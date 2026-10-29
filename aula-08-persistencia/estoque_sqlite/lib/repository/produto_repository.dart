import '../model/produto.dart';
import '../data/dao/produto_dao.dart';

class ProdutoRepository {
  final ProdutoDAO _dao = ProdutoDAO();

  //Listar
  Future<List<Produto>> listar() => _dao.listar();

  //Salvar
  Future<void> salvar(Produto produto) async {
    if (produto.id == null) {
      await _dao.inserir(produto);
    } else {
      await _dao.atualizar(produto);
    }
  }

  //Deletar
  Future<void> remover(int id) => _dao.deletar(id);
}