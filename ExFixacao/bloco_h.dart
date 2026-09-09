// Bloco H - Enums e exceções
void main(){
    h1();
    h2();
    h3();
    h4();
}

/* H1 - Crie um enum Atividade com plantio, adubação, pulverização e colheita. Use-o em um switch que devolva uma descrição de cada atividade. */

enum AtividadeH1 { plantio, adubacao, pulverizacao, colheita }

void h1(){

    print("Exercício H1\n");

    //enum AtividadeH1 { plantio, adubacao, pulverizacao, colheita }

    for (final atividade in AtividadeH1.values) {
        switch (atividade) {
            case AtividadeH1.plantio:
                print("Plantio de culturas");
                break;
            case AtividadeH1.adubacao:
                print("Adubação do solo");
                break;
            case AtividadeH1.pulverizacao:
                print("Pulverização de defensivos");
                break;
            case AtividadeH1.colheita:
                print("Colheita das culturas");
                break;
        }   
    }
    print("\n--------------------------------\n");
}

/* H2 - Transforme o enum anterior em um enum com campos, guardando também um rótulo em português e se a atividade exige registro de defensivo. */

enum AtividadeH2 {
    plantio("Plantio de culturas", false),
    adubacao("Adubação do solo", false),
    pulverizacao("Pulverização de defensivos", true),
    colheita("Colheita das culturas", false);

    final String rotulo;
    final bool exigeRegistroDefensivo;

    const AtividadeH2(this.rotulo, this.exigeRegistroDefensivo);
}

void h2(){

    print("Exercício H2\n");

    /*enum AtividadeH2 {
    plantio("Plantio de culturas", false),
    adubacao("Adubação do solo", false),
    pulverizacao("Pulverização de defensivos", true),
    colheita("Colheita das culturas", false);

    final String rotulo;
    final bool exigeRegistroDefensivo;

    const AtividadeH2(this.rotulo, this.exigeRegistroDefensivo);*/

    for (final atividade in AtividadeH2.values) {
        print("${atividade.rotulo} - ${atividade.exigeRegistroDefensivo ? "Exige registro de defensivo" : "Não exige registro de defensivo"}");
    }
    print("\n--------------------------------\n");
}


/* H3 - Escreva uma função que valide a área informada e lance ArgumentError quando ela for menor ou igual a zero. Chame-a dentro de try/catch e trate o erro. */
void h3(){

    print("Exercício H3\n");

    double validarAreaH3(double area) {
        if (area <= 0) {
            throw ArgumentError("Área inválida: $area. Deve ser maior que zero.");
        }
        return area;
    }

    try {
        validarAreaH3(-5);
    } on ArgumentError catch (e) {
        print("Dado inválido: ${e.message}");
    } catch (e) {
        print("Erro inesperado: $e");
    }
    print("\n--------------------------------\n");
}

/* H4 - Acrescente um bloco finally ao exercício anterior e confirme, por experimento, que ele executa tanto no caso de sucesso quanto no de erro. */
void h4(){

        print("Exercício H4\n");

    double validarAreaH4(double area) {
        if (area <= 0) {
            throw ArgumentError("Área inválida: $area. Deve ser maior que zero.");
        }
        return area;
    }

    try {
        validarAreaH4(-5);
    } on ArgumentError catch (e) {
        print("Dado inválido: ${e.message}");
    } catch (e) {
        print("Erro inesperado: $e");
    } finally {
        print("Bloco finally executado.");
    }
    print("\n--------------------------------\n");
}