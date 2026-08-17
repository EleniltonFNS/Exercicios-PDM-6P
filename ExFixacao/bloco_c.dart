// Bloco C — Texto
void main(){
    c1();
    c2();
    c3();
    c4();
}

/* C1 - Usando interpolação, monte e imprima a frase "O Talhão 3 tem 42,0 ha plantados com milho" a partir de três variáveis. */
void c1(){

    String talhao = "Talhão 3";
    double areaHa = 42.0;
    String cultura = "milho";

    print("O $talhao tem ${areaHa.toStringAsFixed(1)} ha plantados com $cultura");
    print("\n--------------------------------\n");
}

/* C2 - Imprima um valor monetário no formato brasileiro, com o cifrão escapado corretamente e vírgula como separador decimal. Dica: toStringAsFixed seguido de replaceAll. */
void c2(){

    double valor = 1234.56;

    // .replaceAll('.', ',') substitui o ponto por vírgula no valor monetário.
    print("Valor: R\$ ${valor.toStringAsFixed(2).replaceAll('.', ',')}");
    print("\n--------------------------------\n");
}

/* C3 - Crie um texto de várias linhas com o endereço completo de uma cooperativa e imprima-o. */
void c3(){

    // String de várias linhas usando três aspas duplas.
    String endereco = """
    Av: Pedro Antônio Dias
    Quadra 02, Lote 19
    Bairro Residencial Dona Tidinha
    Cidade: Carmo do Rio Verde - GO
    CEP: 76340-000
    """;

    print(endereco);
    print("\n--------------------------------\n");
}

/* C4 - A partir da string ' soja , milho , sorgo ', produza uma lista com as três culturas sem espaços em excesso e em letras maiúsculas. */
void c4(){

    String culturasString = " soja , milho , sorgo ';

    // .trim() remove espaços em excesso no início e no final da string.
    // .split(',') divide a string em uma lista de substrings com base na vírgula.
    // .map((s) => s.trim().toUpperCase()) aplica um transformação a cada elemento da lista.
        // .toUpperCase() converte cada elemento para letras maiúsculas.
    // .toList() converte o resultado em uma lista.
    List<String> culturas = culturasString.trim().split(',').map((s) => s.trim().toUpperCase()).toList();
    print(culturas);
}