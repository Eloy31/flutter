import 'package:flutter/material.dart';
import 'package:trabalho3/model/emprestimo.dart';
import 'dart:convert';

import 'package:trabalho3/persistence/manipula_arquivo.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ManipulaArquivo manipulaArquivo = ManipulaArquivo();

  Map<String, dynamic> _ultimoRemovido;
  int _ultimoRemovidoPos;

  DateTime _dataInfo = DateTime.now();
  TextEditingController _tipoObjetoController = TextEditingController();
  TextEditingController _nomePessoaController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();

  List _emprestimoList = [];

  @override
  void initState() {
    super.initState();
    manipulaArquivo.readEmprestimo().then((dado) {
      setState(() {
        _emprestimoList = json.decode(dado);
      });
    });
  }

  void _addEmprestimo() {
    setState(() {
      Map<String, dynamic> novoEmprestimo = Map();
      Emprestimo emprestimo = Emprestimo(
          _tipoObjetoController.text,
          _nomePessoaController.text,
          _descricaoController.text,
          _dataInfo,
          false);
      novoEmprestimo = emprestimo.getEmprestimo();
      _tipoObjetoController.text = "";
      _nomePessoaController.text = "";
      _descricaoController.text = "";

      _emprestimoList.add(novoEmprestimo);
      manipulaArquivo.saveEmprestimo(_emprestimoList);
    });
  }

  Future<Null> _refresh() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _emprestimoList.sort((a, b) {
        if (a["concluida"] && !b["concluida"])
          return 1;
        else if (!a["concluida"] && b["concluida"])
          return -1;
        else
          return 0;
      });
      manipulaArquivo.saveEmprestimo(_emprestimoList);
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Emprestimo"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: "Nome"),
                    controller: _nomePessoaController,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: "objeto"),
                    controller: _tipoObjetoController,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration:
                        InputDecoration(labelText: "descricao"),
                    controller: _descricaoController,
                  ),
                ),
              ],
            ),
          ),
          FlatButton(
            child: Row(
              children: <Widget>[
                Text("${_dataInfo.day}/${_dataInfo.month}/${_dataInfo.year}"),
                Icon(Icons.calendar_today),
              ],
            ),
            onPressed: () async {
              final dataSelecionada = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1967),
                lastDate: DateTime(2050),
                builder: (BuildContext context, Widget child) {
                  return Theme(
                    data: ThemeData.dark(),
                    child: child,
                  );
                },
              );
              if (dataSelecionada != null && dataSelecionada != _dataInfo) {
                setState(() {
                  _dataInfo = dataSelecionada as DateTime;
                });
              }
            },
          ),
          RaisedButton(
            child: Text("+"),
            textColor: Colors.white,
            onPressed: () {
              _addEmprestimo();
            },
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 10.0),
                  itemCount: _emprestimoList.length,
                  itemBuilder: buildItem),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItem(BuildContext context, int index) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: CheckboxListTile(
        title: Text("${_emprestimoList[index]["nomePessoa"]} (${_emprestimoList[index]["tipoObjeto"]}) - ${_emprestimoList[index]["data"].day}/${_emprestimoList[index]["data"].month}/${_emprestimoList[index]["data"].year}"),
        value: _emprestimoList[index]["devolvido"],
        secondary: CircleAvatar(
          child: Icon(
              _emprestimoList[index]["devolvido"] ? Icons.check : Icons.error),
        ),
        onChanged: (c) {
          setState(() {
            _emprestimoList[index]["devolvido"] = c;
            manipulaArquivo.saveEmprestimo(_emprestimoList);
          });
        },
      ),
      onDismissed: (direction) {
        setState(() {
          _ultimoRemovido = Map.from(_emprestimoList[index]);
          _ultimoRemovidoPos = index;
          _emprestimoList.removeAt(index);
          manipulaArquivo.saveEmprestimo(_emprestimoList);
          final snack = SnackBar(
            content: Text("Emprestimo \"${_ultimoRemovido["nomePessoa"]}\"removido!"),
            action: SnackBarAction(
                label: "Desfazer",
                onPressed: () {
                  setState(() {
                    _emprestimoList.insert(_ultimoRemovidoPos, _ultimoRemovido);
                    manipulaArquivo.saveEmprestimo(_emprestimoList);
                  });
                }),
            duration: Duration(seconds: 2),
          );
          Scaffold.of(context).removeCurrentSnackBar();
          Scaffold.of(context).showSnackBar(snack);
        });
      },
    );
  }
}
