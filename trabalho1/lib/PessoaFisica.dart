import 'package:trabalho1/Cliente.dart';

class PessoaFisica extends Cliente {
  String cpf;
  String rg;
  String sexo;
  DateTime dataNascimento;

  PessoaFisica(this.cpf, this.rg, this.sexo, this.dataNascimento, codigo, nome, endereco, uf, cep) : super(codigo, nome, cep, endereco, uf);

  void validarCpf() {}

  @override
  String toString() {
    // TODO: implement toString
    return super.toString() + 'Cliente-cpf: $cpf, Cliente-rg: $rg, Cliente-sexo: $sexo, Cliente-data-nascimento: $dataNascimento';
  }
}