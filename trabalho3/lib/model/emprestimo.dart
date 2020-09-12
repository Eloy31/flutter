class Emprestimo {
  String _tipoObjeto;
  String _nomePessoa;
  String _descricao;
  DateTime _data;
  bool _devolvido;

  Emprestimo(this._tipoObjeto, this._nomePessoa, this._descricao, this._data, this._devolvido);


  String get tipoObjeto => _tipoObjeto;

  set tipoObjeto(String value) {
    _tipoObjeto = value;
  }

  String get nomePessoa => _nomePessoa;

  set nomePessoa(String value) {
    _nomePessoa = value;
  }

  String get descricao => _descricao;

  set descricao(String value) {
    _descricao = value;
  }

  DateTime get data => _data;

  set data(DateTime value) {
    _data = value;
  }

  bool get devolvido => _devolvido;

  set devolvido(bool value) {
    _devolvido = value;
  }

  Map getEmprestimo() {
    Map<String, dynamic> emprestimo = Map();
    emprestimo["tipoObjeto"] = _tipoObjeto;
    emprestimo["nomePessoa"] = _nomePessoa;
    emprestimo["descricao"] = _descricao;
    emprestimo["data"] = _data;
    emprestimo["devolvido"] = _devolvido;
    return emprestimo;
  }
}
