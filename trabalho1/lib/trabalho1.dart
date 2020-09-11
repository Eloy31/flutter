library trabalho1;

import 'package:trabalho1/PessoaFisica.dart';
import 'package:trabalho1/PessoaJuridica.dart';

void main () {
  PessoaFisica pessoaFisica = PessoaFisica('111111111','222222222','Femea', DateTime.now(), 123,'Eloy','Morro do chapéu','BA','77850000');
  print(pessoaFisica);
  PessoaJuridica pessoaJuridica = PessoaJuridica('111111111','Cod123','Topzeira',123,'Eloy','Morro do chapéu','BA','77850000');
  print(pessoaJuridica);
}
