# SQLite - Lista de Compromissos

Uma nova aplicação flutter, utilizando-se de um banco de dados para armazenamento de dados: O SQLite.

## Funcionamento

Esse projeto foi feito totalmente na linguagem Dart e em aplicação Flutter.

- [Flutter](https://flutter.dev/docs/get-started/codelab)
- [Dart](https://dart.dev/)

O projeto consiste em uma lista de dados, onde são adicionados dados(tarefas) sequencialmente pelo usuário afim de lembrar-los sobre suas tarefas pendentes. O aplicativo conta como um sistema de CheckBox, onde ao você finalizar sua tarefa, você pode marcar ela como "Pronta", como pode ser visto no video de demonstração.

Este projeto já foi feito anteriormente utilizando a estrutura de armazenamento de dados de maneira MVC e SharedPreferences, porém, este conta com uma nova forma de armazenamento, que é a SQLite e com o auxílio da ferramenta Floor para mapeamento de objetos.

##SQLite

O SQLite é basicamente, um banco de dados dentro do seu celular. Sendo mais específico, o SQLite é uma biblioteca em linguagem C que implementa um banco de dados SQL embutido, e para utiliza-lo,são necessários algumas etapas:

- Adicionar Dependências
- Definir o modelo
- Abrir o Banco de Dados
- Manipular os dados no BD

Definir Modelos, abrir banco de dados e manipular, são categorias que podem ser executadas automaticamente quando é aplicado a ferramenta Floor, que fornece mapeamento automático entre os objetos na memória e os dados do banco de dados, ao mesmotempo que oferece controle total do banco de dados com o uso de SQL.

##Vídeo no YouTube
https://youtu.be/RTwPcOtYSOY
