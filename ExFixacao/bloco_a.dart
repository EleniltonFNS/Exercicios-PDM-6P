// Bloco A — Variáveis, tipos e saída
void main(){
    a1();
    a2();
    a3();
    a4();
    a5();
}

/* A1 - Declare, com tipos explícitos, o nome de um produtor, a cidade, a área da propriedade em hectares e o ano da safra.
Imprima uma linha de identificação com os quatro valores. */
void a1(){
    
    String nomeProdutor = "Elenilton";
    String cidade = "Carmo do Rio verde";
    double areaPropriedadeHa = 150.5;
    int anoSafra = 2026;

    print("Produtor: $nomeProdutor \nCidade: $cidade \nÁrea da Propriedade: $areaPropriedadeHa \nAno da Safra: $anoSafra"); 
    print("\n--------------------------------\n");
}

/* A2 - Refaça o exercício anterior usando var em todas as declarações. 
Escreva em comentário qual tipo foi inferido em cada caso. */
void a2(){
    
    var nomeProdutor = "Elenilton"; // String
    var cidade = "Carmo do Rio verde"; // String
    var areaPropriedadeHa = 150.5; // double
    var anoSafra = 2026; // int
    
    // .runtimeType retorna o tipo da variável.
    print("Produtor: ${nomeProdutor.runtimeType} \nCidade: ${cidade.runtimeType} \nÁrea da Propriedade: ${areaPropriedadeHa.runtimeType} \nAno da Safra: ${anoSafra.runtimeType}");
    print("\n--------------------------------\n");
}

/* A3 - Declare uma constante para o alqueire goiano (4,84 ha) e outra variável com final recebendo DateTime.now(). 
Tente trocar o final por const, leia o erro e explique a diferença entre os dois. */
void a3(){

    const double alqueireGoiano = 4.84;
    final DateTime dataAtual = DateTime.now();

    /* Tentativa de trocar "final" por "const":

    const DateTime dataAtual = DateTime.now();

    compileNewDDC
    main.dart:41:41: Error: Cannot invoke a non-'const' constructor where a const expression is expected.
    Try using a constructor or factory that is 'const'.
        const DateTime dataAtual = DateTime.now();
                                            ^^^
    */
    print("Enquanto \"const\" é usado para valores que são conhecidos em tempo de compilação e não podem ser alterados, \"final\" é usado para valores que são definidos em tempo de execução e também não podem ser alterados após a atribuição inicial."); 
    print("No caso do DateTime.now(), o valor é determinado em tempo de execução, portanto, não pode ser declarado como const.");
    p
}

/* A4 - Converta uma área em hectares para alqueires goianos e imprima o resultado com duas casas decimais. */
void a4(){

    double areaHectares = 150.5;
    const double alqueireGoiano = 4.84;
    double areaAlqueires = areaHectares / alqueireGoiano;

    print("Área em hectares: $areaHectares ha");
    // .toStringAsFixed(2) formata o número para duas casas decimais.
    print("Área em alqueires goianos: ${areaAlqueires.toStringAsFixed(2)} alq");
    print("\n--------------------------------\n");
}

/* A5 - Declare três cotações de saca. Imprima a maior, a menor e a média, todas com duas casas. 
Dica: a > b ? a : b resolve a comparação de dois valores. */
void a5(){
    
    double cot1 = 150.75;
    double cot2 = 145.30;
    double cot3 = 152.10;

    double maiorCotacao = cot1 > cot2 ? (cot1 > cot3 ? cot1 : cot3) : (cot2 > cot3 ? cot2 : cot3);
    double menorCotacao = cot1 < cot2 ? (cot1 < cot3 ? cot1 : cot3) : (cot2 < cot3 ? cot2 : cot3);
    double mediaCotacoes = (cot1 + cot2 + cot3) / 3;

    print("Maior Cotação: ${maiorCotacao.toStringAsFixed(2)}");
    print("Menor Cotação: ${menorCotacao.toStringAsFixed(2)}");
    print("Média das Cotações: ${mediaCotacoes.toStringAsFixed(2)}");
}