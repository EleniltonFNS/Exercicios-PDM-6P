// Bloco J — Integradores
void main() async {
  j1();
  j2();
  await j3();
}

class Talhao {
  String nome;
  double areaHa;
  String cultura;

  Talhao({required this.nome, required this.areaHa, required this.cultura});

  @override
  String toString() => "$nome - ${areaHa.toStringAsFixed(1).replaceAll('.', ',')} ha - $cultura";
}

enum Atividade {
  plantio("Plantio"),
  adubacao("Adubação"),
  pulverizacao("Pulverização"),
  colheita("Colheita");

  final String rotulo;
  const Atividade(this.rotulo);
}

class Registro {
  Talhao talhao;
  Atividade atividade;
  DateTime data;
  String? observacao;

  Registro({
    required this.talhao,
    required this.atividade,
    required this.data,
    this.observacao,
  });

  @override
  String toString() {
    String dataFormatada = "${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year}";
    String obs = observacao != null ? " ($observacao)" : "";
    return "${atividade.rotulo} em $dataFormatada$obs";
  }
}

/* J1 - Relatório da propriedade: a partir de uma lista de objetos Talhao, imprima um relatório com área total, área por cultura, percentual de cada cultura e o talhão de maior área. Toda a formatação deve sair no padrão brasileiro. */
void j1(){

  print("Exercício J1\n");

  List<Talhao> talhoes = [
    Talhao(nome: "Talhão 1", areaHa: 38.0, cultura: "Soja"),
    Talhao(nome: "Talhão 2", areaHa: 24.5, cultura: "Milho"),
    Talhao(nome: "Talhão 3", areaHa: 42.0, cultura: "Milho"),
    Talhao(nome: "Talhão 4", areaHa: 31.2, cultura: "Soja"),
    Talhao(nome: "Talhão 5", areaHa: 12.8, cultura: "Sorgo"),
  ];

  double areaTotal = talhoes.fold(0.0, (soma, t) => soma + t.areaHa);

  Map<String, double> areaPorCultura = {};
  for (var talhao in talhoes) {
    areaPorCultura[talhao.cultura] = (areaPorCultura[talhao.cultura] ?? 0.0) + talhao.areaHa;
  }

  Talhao maiorTalhao = talhoes.reduce((maior, t) => t.areaHa > maior.areaHa ? t : maior);

  print("Área total da propriedade: ${areaTotal.toStringAsFixed(1).replaceAll('.', ',')} ha\n");

  print("Área e percentual por cultura:");
  for (var entry in areaPorCultura.entries) {
    double percentual = (entry.value / areaTotal) * 100;
    print("${entry.key}: ${entry.value.toStringAsFixed(1).replaceAll('.', ',')} ha (${percentual.toStringAsFixed(2).replaceAll('.', ',')}%)");
  }

  print("\nMaior talhão: ${maiorTalhao.nome} com ${maiorTalhao.areaHa.toStringAsFixed(1).replaceAll('.', ',')} ha plantados com ${maiorTalhao.cultura}");
  print("\n--------------------------------\n");
}

/* J2 - Registro de atividades: crie uma classe Registro com talhão, atividade (enum), data e observação opcional. Monte uma lista de registros, valide a data com exceção e imprima o histórico agrupado por talhão. */
void j2(){

  print("Exercício J2\n");

  Talhao talhao1 = Talhao(nome: "Talhão 1", areaHa: 38.0, cultura: "Soja");
  Talhao talhao2 = Talhao(nome: "Talhão 2", areaHa: 24.5, cultura: "Milho");

  // Validação da data: não pode ser uma data futura
  DateTime validarData(DateTime data) {
    if (data.isAfter(DateTime.now())) {
      throw ArgumentError("Data futura não permitida: $data");
    }
    return data;
  }

  List<Registro> registros = [];

  // Registros válidos
  registros.add(Registro(
    talhao: talhao1,
    atividade: Atividade.adubacao,
    data: validarData(DateTime(2026, 9, 15)),
    observacao: "NPK 04-14-08",
  ));
  registros.add(Registro(
    talhao: talhao1,
    atividade: Atividade.plantio,
    data: validarData(DateTime(2026, 10, 5)),
  ));
  registros.add(Registro(
    talhao: talhao2,
    atividade: Atividade.adubacao,
    data: validarData(DateTime(2026, 9, 20)),
  ));
  registros.add(Registro(
    talhao: talhao2,
    atividade: Atividade.pulverizacao,
    data: validarData(DateTime(2026, 10, 12)),
    observacao: "Fungicida preventivo",
  ));

  // Testando validação com exceção (data futura)
  try {
    validarData(DateTime(2027, 2, 10));
  } on ArgumentError catch (e) {
    print("Dado inválido: ${e.message}\n");
  }

  // Agrupando histórico por talhão
  Map<String, List<Registro>> historicoPorTalhao = {};
  for (var reg in registros) {
    historicoPorTalhao.putIfAbsent(reg.talhao.nome, () => []).add(reg);
  }

  print("Histórico de atividades por talhão:");
  for (var entry in historicoPorTalhao.entries) {
    print("${entry.key}:");
    for (var reg in entry.value) {
      print("  - $reg");
    }
  }
  print("\n--------------------------------\n");
}

/* J3 - Receita estimada: junte a lista de talhões a uma consulta simulada de cotação, feita de forma assíncrona. Calcule a receita bruta estimada de cada talhão e o total da propriedade, tratando o caso em que a consulta falha. */
Future<void> j3() async {

  print("Exercício J3\n");

  List<Talhao> talhoes = [
    Talhao(nome: "Talhão 1", areaHa: 38.0, cultura: "Soja"),
    Talhao(nome: "Talhão 2", areaHa: 24.5, cultura: "Milho"),
    Talhao(nome: "Talhão 3", areaHa: 42.0, cultura: "Milho"),
    Talhao(nome: "Talhão 4", areaHa: 31.2, cultura: "Soja"),
    Talhao(nome: "Talhão 5", areaHa: 12.8, cultura: "Sorgo"),
  ];

  Map<String, double> produtividade = {
    "Soja": 60.0,
    "Milho": 100.0,
    "Sorgo": 55.0,
  };

  // Função interna para consulta simulada de cotação
  Future<Map<String, double>> consultarCotacoes({bool simularFalha = false}) async {
    await Future.delayed(Duration(milliseconds: 500));
    if (simularFalha) {
      throw Exception("Falha de rede ao consultar cotações.");
    }
    return {
      "Soja": 128.40,
      "Milho": 85.30,
      "Sorgo": 75.20,
    };
  }

  // Caso 1: Sucesso
  try {
    print("--- Caso de sucesso ---");
    Map<String, double> cotacoes = await consultarCotacoes();

    double receitaTotal = 0;
    for (var talhao in talhoes) {
      double scHa = produtividade[talhao.cultura] ?? 0;
      double valorSaca = cotacoes[talhao.cultura] ?? 0;
      double receitaTalhao = talhao.areaHa * scHa * valorSaca;
      receitaTotal += receitaTalhao;

      print("${talhao.nome} (${talhao.cultura}): R\$ ${receitaTalhao.toStringAsFixed(2).replaceAll('.', ',')}");
    }
    print("Receita bruta total: R\$ ${receitaTotal.toStringAsFixed(2).replaceAll('.', ',')}\n");
  } catch (e) {
    print("Erro inesperado: $e");
  }

  // Caso 2: Falha na consulta (tratada)
  try {
    print("--- Caso de erro ---");
    await consultarCotacoes(simularFalha: true);
  } catch (e) {
    print("Erro na consulta: $e");
  }

  print("\n--------------------------------\n");
}
