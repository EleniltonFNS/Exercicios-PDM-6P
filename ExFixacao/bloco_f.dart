import 'dart:math';

// Bloco F — Funções
void main(){
    f1();
    f2();
    f3();
    f4();
    f5();
}

/* F1 - Escreva uma função que receba a área em hectares e devolva o valor em alqueires goianos. Escreva também a versão com sintaxe de seta. */
void f1(){

    print("Exercício F1\n");

    final random = Random();

    double hectaresAleatorio = random.nextDouble() * 100;

    print("Hectares: ${hectaresAleatorio.toStringAsFixed(2)}");

    String hectaresParaAlqueires(double hectares) {
        const double alqueireGoiano = 4.84;
        return (hectares / alqueireGoiano).toStringAsFixed(2);
    }

    String hectaresParaAlqueiresSeta(double hectares) => (hectares / 4.84).toStringAsFixed(2);

    print("Área em alqueires goianos: ${hectaresParaAlqueires(hectaresAleatorio)}");
    print("Área em alqueires goianos (por seta): ${hectaresParaAlqueiresSeta(hectaresAleatorio)}");
    print("\n--------------------------------\n");
}

/* F2 - Escreva uma função de formatação que receba um número e, opcionalmente, o número de casas decimais, com 1 como padrão. Chame-a das duas formas: com e sem o segundo argumento. */
void f2(){

    print("Exercício F2\n");

    String formatarNumero(double numero, [int casasDecimais = 1]) {
        return numero.toStringAsFixed(casasDecimais);
    }

    String formatarNumeroSeta(double numero, [int casasDecimais = 1]) => numero.toStringAsFixed(casasDecimais);

    print("Número formatado (2 casas): ${formatarNumero(3.14159, 2)}");
    print("Número formatado sem segundo argumento: ${formatarNumero(3.14159)}");
    print("Número formatado por seta (3 casas): ${formatarNumeroSeta(3.14159, 3)}");
    print("Número formatado por seta sem segundo argumento: ${formatarNumeroSeta(3.14159)}");
    print("\n--------------------------------\n");
}

/* F3 - Escreva uma função com parâmetros nomeados: nome e área são obrigatórios (required), cultura tem valor padrão. Chame-a invertendo a ordem dos argumentos e confirme que funciona. */
void f3(){

    print("Exercício F3\n");

    String formatarNomeArea({required String nome, required double area, String cultura = "trigo"}) {
        return "Produtor: $nome, Área: ${area.toStringAsFixed(2)} ha, Cultura: $cultura";
    }

    print("Cultura informada:\n${formatarNomeArea(nome: "Elenilton", area: 150.5, cultura: "milho")}");
    print("Cultura não informada:\n${formatarNomeArea(nome: "Elenilton", area: 150.5)}");
    print("\n--------------------------------\n");
}

/* F4 - Escreva uma função que receba uma lista de áreas e uma função de transformação, aplique a transformação a cada elemento e imprima o resultado. Chame-a duas vezes, com transformações diferentes. */
void f4(){

    print("Exercício F4\n");

    List<double> aplicarTransformacao(
        List<double> areas,
        double Function(double) transformacao,
    ) {
        return areas.map(transformacao).toList();
    }

    List<double> areasHa = [25.0, 35.0, 40.0, 15.0, 50.0];

    List<double> areasAlqueires = aplicarTransformacao(
        areasHa,
        (area) => area / 4.84,
    );
    print("Áreas em alqueires: ${areasAlqueires.map((area) => area.toStringAsFixed(2)).toList()}");

    List<double> areasComAcrescimo = aplicarTransformacao(
        areasHa,
        (area) => area * 1.10,
    );
    print("Áreas com acréscimo de 10%: ${areasComAcrescimo.map((area) => area.toStringAsFixed(2)).toList()}");
    print("\n--------------------------------\n");
}

/* F5 - Escreva uma função que calcule a receita bruta a partir de área, produtividade e preço da saca, com os três parâmetros nomeados e obrigatórios. */
void f5(){
    
    print("Exercício F5\n");

    final random = Random();

    double areaAleatoria = random.nextDouble() * 100;
    double produtividadeAleatoria = random.nextDouble() * 100;
    double precoSacaAleatorio = random.nextDouble() * 200;

    print("Área: ${areaAleatoria.toStringAsFixed(2)} ha");
    print("Produtividade: ${produtividadeAleatoria.toStringAsFixed(2)} sc/ha");
    print("Preço da saca: R\$ ${precoSacaAleatorio.toStringAsFixed(2)}");

    String calcularReceitaBruta({required double area, required double produtividade, required double precoSaca}) {
        return (area * produtividade * precoSaca).toStringAsFixed(2);
    }

    print("Receita bruta: R\$ ${calcularReceitaBruta(area: areaAleatoria, produtividade: produtividadeAleatoria, precoSaca: precoSacaAleatorio)}");
}