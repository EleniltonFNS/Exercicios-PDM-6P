import 'dart:math';

// Bloco D — Decisão e repetição
void main(){
    d1();
    d2();
    d3();
    d4();
    d5();
    d6();
}

/* D1 - Classifique uma produtividade em três faixas: abaixo de 50 sc/ha, entre 50 e 70, e acima de 70.
Use if/else. */
void d1(){

    print("Exercício D1\n");

    // Gerando um valor aleatório de produtividade entre 0 e 100 sc/ha.
    final random = Random();

    // .nextDouble() gera um número aleatório entre 0.0 e 1.0, multiplicando por 100 para obter o intervalo desejado.
    double produtividade = random.nextDouble() * 100;

    print("Produtividade: ${produtividade.toStringAsFixed(2)} sc/ha");

    if (produtividade < 50) {
        print("\nProdutividade abaixo de 50 sc/ha");
    } else if (produtividade >= 50 && produtividade <= 70) {
        print("\nProdutividade entre 50 e 70 sc/ha");
    } else {
        print("\nProdutividade acima de 70 sc/ha");
    }
    print("\n--------------------------------\n");
}

/* D2 - Refaça a classificação anterior usando switch como expressão (a forma com => que
devolve um valor). */
void d2(){

    print("Exercício D2\n");

    final random = Random();

    double produtividade = random.nextDouble() * 100;

    print("Produtividade: ${produtividade.toStringAsFixed(2)} sc/ha");

    String classificacao = switch (produtividade) {
        < 50 => "Produtividade abaixo de 50 sc/ha",
        >= 50 && <= 70 => "Produtividade entre 50 e 70 sc/ha",
        _ => "Produtividade acima de 70 sc/ha",
    };
    
    print("\n$classificacao");
    print("\n--------------------------------\n");

}

/* D3 - Imprima uma tabela de conversão de hectares para alqueires goianos, de 10 em 10, de 10 até 100 hectares. */
void d3(){

    print("Exercício D3\n");

    print("Tabela de Conversão de Hectares para Alqueires Goianos");
    print("\nHectares\tAlqueires");
    
    for (int hectares = 10; hectares <= 100; hectares += 10) {
        double alqueires = hectares / 4.84;
        print("$hectares\t${alqueires.toStringAsFixed(2)}");
    }
    print("\n--------------------------------\n");
}

/* D4 - Simule a colheita: partindo de 5.000 sacas em estoque, retire 350 por dia e imprima quantos dias levam até o estoque acabar. Use while. */
void d4(){

    print("Exercício D4\n");

    int estoque = 5000;
    int retirada = 350;
    int dias = 0;

    while (estoque > 0) {
        estoque -= retirada;
        dias++;
    }

    print("Dias para esgotar o estoque: $dias");
    print("\n--------------------------------\n");
}

/* D5 - Percorra uma lista de meses da safra com for-in e imprima cada um numerado. */
void d5(){

    print("Exercício D5\n");

    List<String> mesesSafra = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"];

    int numero = 1;
    // for-in percorre cada elemento da lista mesesSafra, atribuindo-o à variável mes a cada iteração.
    for (String mes in mesesSafra) {
        print("$numero - $mes");
        numero++;
    }
    print("\n--------------------------------\n");
}

/* D6 - Percorra uma lista de áreas e some apenas as maiores que zero, usando continue para pular as demais. Interrompa o laço com break se a soma passar de 200 ha. */
void d6(){

    print("Exercício D6\n");

    List<double> areas = [50.0, -10.0, 30.0, 80.0, 20.0, -5.0, 40.0];

    double soma = 0;
    for (double area in areas) {
        if (area <= 0) {
            continue; // Pula para a próxima iteração se a operação for true.
        }
        soma += area;
        if (soma > 200) {
            break; // Interrompe o laço se a soma passar de 200 ha.
        }
    }

    print("Soma das áreas maiores que zero: $soma ha");
}