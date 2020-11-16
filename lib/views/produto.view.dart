import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sqlite/controllers/produto.controller.dart';
import 'package:sqlite/models/produto.model.dart';
import '../app_status.dart';

class ProdutoListView extends StatefulWidget {
  @override
  _ProdutoListViewState createState() => _ProdutoListViewState();
}

class _ProdutoListViewState extends State<ProdutoListView> {
  final _formKey = GlobalKey<FormState>();
  var _itemController = TextEditingController();
  var _itemController2 = TextEditingController();
  ProdutoController _controller = null;

  @override
  Widget build(BuildContext context) {
    _controller = Provider.of<ProdutoController>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Compromissos'), centerTitle: true),
      body: Scrollbar(
        child: Observer(builder: (_) {
          if (_controller.status == AppStatus.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (_controller.status == AppStatus.success) {
            return ListView(
              children: [
                for (int i = 0; i < _controller.list.length; i++)
                  ListTile(
                      title: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        title: _controller.list[i].concluido ?
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(_controller.list[i].nome, style: TextStyle(
                                fontSize: 20.0,
                                decoration: TextDecoration.lineThrough,
                                color: Colors.green),),
                            Text(_controller.list[i].datah, style: TextStyle(
                                fontSize: 10.0,
                                decoration: TextDecoration.lineThrough,
                                color: Colors.green),),
                          ],
                        ) :
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(_controller.list[i].nome, style: TextStyle(
                                fontSize: 20.0, color: Colors.red),),
                            Text(_controller.list[i].datah, style: TextStyle(
                                fontSize: 10.0, color: Colors.grey),),
                          ],
                        ),
                        value: _controller.list[i].concluido,
                        secondary: IconButton(
                          icon: Icon(
                            Icons.delete,
                            size: 20.0,
                            color: Colors.red[900],
                          ),
                          onPressed: () async {
                            await _controller.delete(_controller.list[i].id);
                          },
                        ),
                        onChanged: (c) async {
                          Produto edited = _controller.list[i];
                          edited.concluido = c;
                          await _controller.update(edited);
                        },
                      )),
              ],
            );
          }else{
            return Text("Carregando... " ?? '');
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _displayDialog(context),
      ),
    );
  }



  _displayDialog(context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    controller: _itemController,
                    validator: (s) {
                      if (s.isEmpty)
                        return "Digite o compromisso.";
                      else
                        return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "Compromisso"),
                  ),

                  TextFormField(
                    controller: _itemController2,
                    validator: (s) {
                      if (s.isEmpty)
                        return "Digite a data e hora.";
                      else
                        return null;
                    },
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(labelText: "Data/Hora"),
                  ),

                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: new Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: new Text('SALVAR'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _controller.create(Produto(nome: _itemController.text, datah: _itemController2.text, concluido: false));
                    _itemController.text = "";
                    _itemController2.text = "";
                    Navigator.of(context).pop();
                  }
                },
              )
            ],
          );
        });
  }
}



