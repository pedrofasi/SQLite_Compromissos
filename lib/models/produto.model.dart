import 'package:floor/floor.dart';
@entity
class Produto {
  @PrimaryKey(autoGenerate: true)
  int id;
  String nome;
  String datah;
  bool concluido;
  Produto({this.id, this.nome, this.datah, this.concluido});
  Produto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    datah = json ['datah'];
    concluido = json['concluido'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['datah'] = this.datah;
    data['concluido'] = this.concluido;
    return data;
  }
}
