import 'package:flutter/material.dart';
import 'package:gasto_mensal/view/cadastro_gasto_mensal.dart';
import 'package:gasto_mensal/view/lista_gasto_mensal.dart';

import 'controller/gasto_controller.dart';
import 'model/gasto.dart';

void main() {
  runApp(MaterialApp(
      home: ListaGastoMensal(),
    theme: ThemeData(
        hintColor: Colors.deepOrangeAccent,
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color:
          Colors.white)),
          focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color:
          Colors.amber)),
          hintStyle: TextStyle(color: Colors.amber),
        )),
  ));


/*  WidgetsFlutterBinding.ensureInitialized();
  GastoController gastoController = GastoController();
  GastoMensal gastoMensal = GastoMensal(null,2020,"Setembro","Conta de agua",50.9,"Fixo");
      gastoController.salvar(gastoMensal).then((res) => print(res));*/

/*  WidgetsFlutterBinding.ensureInitialized();
  GastoController gastoController = GastoController();
  List<GastoMensal> gastos = await gastoController.findAll();
  print(gastos);*/

  /*WidgetsFlutterBinding.ensureInitialized();
  GastoMensal gastoMensal = GastoMensal(1,2020,"Agosto","Conta de luz",90.9,"Fixo");
      GastoController gastoController = GastoController();
  gastoController.salvar(gastoMensal).then((res) => print(res));
  List<GastoMensal> gastos = await gastoController.findAll();
  print(gastos);*/

  /*WidgetsFlutterBinding.ensureInitialized();
  GastoController gastoController = GastoController();
  gastoController.excluir(1).then((res) => print(res));
  List<GastoMensal> gastos = await gastoController.findAll();
  print(gastos);*/
}