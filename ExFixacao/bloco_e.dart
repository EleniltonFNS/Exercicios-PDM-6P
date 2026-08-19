// Bloco E — Coleções
void main(){
    e1();
    e2();
    e3();
    e4();
    e5();
    e6();
    e7();
}

/* E1 - Crie uma lista de culturas. Acrescente uma, remova outra e imprima o tamanho, o primeiro e o último elemento. */
void e1(){

    print("Exercício E1\n");

    List<String> culturas = ["Soja", "Milho", "Sorgo", "Feijão"];
    
    // .add() adiciona um novo elemento à lista.
    culturas.add("Trigo");
    
    // .remove() remove um elemento específico da lista.
    culturas.remove("Sorgo");
    
    print("Lista de Culturas: $culturas\n");
    // .length retorna a quantidade de elementos na lista.
    print("Tamanho da Lista: ${culturas.length}");
    // .first retorna o primeiro elemento da lista.
    print("Primeira Cultura: ${culturas.first}");
    // .last retorna o último elemento da lista.
    print("Última Cultura: ${culturas.last}");
    print("\n--------------------------------\n");
}

/* E2 - Crie uma lista com culturas repetidas e converta-a em um conjunto para eliminar asrepetições. Imprima os dois e compare. */
void e2(){

    print("Exercício E2\n");

    List<String> culturasRepetidas = ["Soja", "Milho", "Sorgo", "Feijão", "Soja", "Milho"];
    
    // Set - coleção que não permite elementos duplicados
    // .toSet() converte a lista em um conjunto, que não permite elementos duplicados.
    Set<String> culturasUnicas = culturasRepetidas.toSet();
    
    print("Lista com Culturas Repetidas: $culturasRepetidas");
    print("Conjunto com Culturas Únicas: $culturasUnicas");
    print("\n--------------------------------\n");
}

/* E3 - Crie um mapa de cultura para cotação da saca. Acrescente uma nova entrada, consulte uma existente e consulte uma que não existe — observe o que o Dart devolve neste último caso. */
void e3(){

    print("Exercício E3\n");

    Map<String, double> cotacaoSaca = {
        "Soja": 128.40,
        "Milho": 85.30,
        "Sorgo": 75.20,
    };

    // Adiciona uma nova entrada ao mapa.    
    cotacaoSaca["Feijão"] = 150.00;
    
    // Consulta de uma cotação existente.
    double? cotacaoSoja = cotacaoSaca["Soja"];
    
    // Consulta de uma cotação inexistente.
    double? cotacaoTrigo = cotacaoSaca["Trigo"];
    
    print("Mapa de Cotação da Saca: $cotacaoSaca \n");
    print("Cotação da Soja: $cotacaoSoja");
    print("Cotação do Trigo: $cotacaoTrigo"); // Retorna null, pois "Trigo" não existe no mapa.
    print("\n--------------------------------\n");
}

/* E4 - Percorra o mapa do exercício anterior com entries e imprima uma linha por cultura, no formato "soja: R$ 128,40". */
void e4(){

    print("Exercício E4\n");

    Map<String, double> cotacaoSaca = {
        "Soja": 128.40,
        "Milho": 85.30,
        "Sorgo": 75.20,
        "Feijão": 150.00,
    };

    // .entries retorna uma coleção de pares chave-valor do mapa, permitindo percorrer cada entrada.
    for (var entry in cotacaoSaca.entries) {
        print("${entry.key.toLowerCase()}: R\$ ${entry.value.toStringAsFixed(2)}");
    }
    print("\n--------------------------------\n");
}

/* E5 - A partir de uma lista de áreas, use where para separar as maiores que 30 ha, map para convertê-las em alqueires e fold para somar o total. Faça em uma única expressão encadeada. */
void e5(){

    print("Exercício E5\n");

    List<double> areasHa = [25.0, 35.0, 40.0, 15.0, 50.0];
    const double alqueireGoiano = 4.84;

    // Encadeamento de métodos.
    double totalAlqueires = areasHa
        // .where() filtra as áreas maiores que 30 ha.
        .where((area) => area > 30)
        // .map() converte cada área de hectares para alqueires goianos.
        .map((area) => area / alqueireGoiano)
        // .fold() acumula a soma das áreas convertidas em alqueires, iniciando com 0.0.
        .fold(0.0, (sum, alqueire) => sum + alqueire);

    print("Total de Alqueires para áreas maiores que 30 ha: ${totalAlqueires.toStringAsFixed(2)} alq");
    print("\n--------------------------------\n");
}

/* E6 - Sobre a mesma lista, responda com any, every e firstWhere: existe algum talhão acima de 40 ha? todos têm mais de 10 ha? qual é o primeiro abaixo de 20 ha? */
void e6(){

    print("Exercício E6\n");

    List<double> areasHa = [25.0, 35.0, 40.0, 15.0, 50.0];

    // .any() verifica se existe algum elemento que satisfaça a condição.
    bool existeAcimaDe40 = areasHa.any((area) => area > 40);
    
    // .every() verifica se todos os elementos satisfazem a condição.
    bool todosAcimaDe10 = areasHa.every((area) => area > 10);
    
    // .firstWhere() retorna o primeiro elemento que satisfaz a condição.
    double primeiroAbaixoDe20 = areasHa.firstWhere((area) => area < 20, orElse: () => -1);

    print("Existe algum talhão acima de 40 ha? ${existeAcimaDe40 ? "Sim" : "Não"}");
    print("Todos os talhões têm mais de 10 ha? ${todosAcimaDe10 ? "Sim" : "Não"}");
    if (primeiroAbaixoDe20 != -1) {
        print("O primeiro talhão abaixo de 20 ha é: $primeiroAbaixoDe20 ha");
    } else {
        print("Não há talhões abaixo de 20 ha.");
    }
    print("\n--------------------------------\n");
}

/* E7 - Ordene a lista de áreas do maior para o menor com sort e compareTo. Depois inverta a ordem alterando apenas a ordem dos operandos. */
void e7(){

    print("Exercício E7\n");

    List<double> areasHa = [25.0, 35.0, 40.0, 15.0, 50.0];

    // .sort() ordena a lista in-place, modificando a lista original.
    // .compareTo() compara dois valores, retornando um valor negativo, zero ou positivo
    areasHa.sort((a, b) => b.compareTo(a));
    print("Áreas ordenadas do maior para o menor: $areasHa");

    areasHa.sort((a, b) => a.compareTo(b));
    print("Áreas ordenadas do menor para o maior: $areasHa");
}