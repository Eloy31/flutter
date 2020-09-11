abstract class Cliente {
  int codigo;
  String nome;
  String endereco;
  String uf;
  String cep;

  Cliente(this.codigo, this.nome, this.cep, this.endereco, this.uf);

  void inserir() {}
  void alterar() {}

  @override
  String toString() {
    // TODO: implement toString
    return 'Cliente-codigo: $codigo, Cliente-nome: $nome, Cliente-endereço: $endereco, Cliente-uf: $uf, Cliente-cep: $cep';
  }
}