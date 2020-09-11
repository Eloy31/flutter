import 'package:aula5/view/lista_atividade.dart';
import 'package:flutter/material.dart';

void main() {
  runApp((MaterialApp(
    theme: ThemeData(
        primaryColor: Colors.amber[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary)),
    home: Home(),
  )));
}
