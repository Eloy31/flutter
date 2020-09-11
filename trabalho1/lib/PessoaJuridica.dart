import 'package:trabalho1/Cliente.dart';

class PessoaJuridica extends Cliente {
  String cnpj;
  String inscricaoEstadual;
  String razaoSocial;

  PessoaJuridica(this.cnpj, this.inscricaoEstadual, this.razaoSocial, codigo, nome, cep, endereco, uf) : super(codigo, nome, cep, endereco, uf);

  void validarCnpj() {}

  @override
  String toString() {
    // TODO: implement toString
    return super.toString() + 'Cliente-cnpj: $cnpj, Cliente-inscricao-Estadual: $inscricaoEstadual, Cliente-razao-social: $razaoSocial';
  }
}