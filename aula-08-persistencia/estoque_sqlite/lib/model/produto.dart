class Produto{
  final int? id;
  final String nome;
  final int quantidade;
  final double preco;


  const Produto({
    this.id,
    required this.nome,
    required this.quantidade,
    required this.preco,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'quantidade': quantidade,
      'preco': preco,
    };
  }

  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      id: map['id'],
      nome: map['nome'],
      quantidade: map['quantidade'],
      preco: map['preco'],
    );
  }
}