// Bloco G — Classes e objetos
void main(){
    g1();
    g2();
    g3();
    g4();
    g5();
    g6();
    g7();
}

class Produtor {
    final String nome;
    final String cidade;
    final String? telefone;

    Produtor({required this.nome, required this.cidade, this.telefone});

    Produtor.semTelefone({required this.nome, required this.cidade}) : telefone = null;
}

class Talhao {
    static const double alqueireGoiano = 4.84;

    final String nome;
    final double areaHa;
    final String cultura;

    Talhao({required this.nome, required this.areaHa, required this.cultura});

    double get areaAlqueires => areaHa / alqueireGoiano;
    bool get temMenosDe20Ha => areaHa < 20;

    @override
    String toString() => "$nome - ${areaHa.toStringAsFixed(2)} ha - $cultura";
}

abstract class Cultura {
    final String nome;
    final int cicloDias;

    Cultura({required this.nome, required this.cicloDias});

    String resumo();
}

class CulturaAnual extends Cultura {
    CulturaAnual({required super.nome, required super.cicloDias});

    @override
    String resumo() => "$nome (ciclo de $cicloDias dias)";
}

class CulturaPerene extends Cultura {
    CulturaPerene({required super.nome, required super.cicloDias});

    @override
    String resumo() => "$nome (ciclo de $cicloDias dias, perene)";
}

/* G1 - Crie a classe Produtor com nome, cidade e telefone (que pode não existir). Use campos final e construtor com parâmetros nomeados obrigatórios. */
void g1(){

    print("Exercício G1\n");

    final produtor = Produtor(
        nome: "Elenilton",
        cidade: "Carmo do Rio Verde",
        telefone: "(62) 99999-9999",
    );

    print("Nome: ${produtor.nome}");
    print("Cidade: ${produtor.cidade}");
    print("Telefone: ${produtor.telefone}");
    print("\n--------------------------------\n");
}

/* G2 - Acrescente um construtor nomeado Produtor.semTelefone que dispense o telefone. */
void g2(){

    print("Exercício G2\n");

    final produtor = Produtor.semTelefone(
        nome: "Fazenda Pito Aceso",
        cidade: "Uruana",
    );

    print("${produtor.nome}, ${produtor.cidade}");
    print("Telefone: ${produtor.telefone ?? "não informado"}");
    print("\n--------------------------------\n");
}

/* G3 - Crie a classe Talhao com nome, área e cultura. Acrescente um campo calculado que devolva a área em alqueires e outro que informe se o talhão tem menos de 20 ha. */
void g3(){

    print("Exercício G3\n");

    final talhao = Talhao(nome: "Talhão 1", areaHa: 18.0, cultura: "Soja");

    print("Área em alqueires: ${talhao.areaAlqueires.toStringAsFixed(2)} alq");
    print("Tem menos de 20 ha? ${talhao.temMenosDe20Ha ? "Sim" : "Não"}");
    print("\n--------------------------------\n");
}

/* G4 - Sobrescreva toString em Talhao e imprima um objeto diretamente com print. */
void g4(){

    print("Exercício G4\n");

    final talhao = Talhao(nome: "Talhão 2", areaHa: 42.0, cultura: "Milho");
    print(talhao);
    print("\n--------------------------------\n");
}

/* G5 - Acrescente à classe uma constante static com o valor do alqueire goiano e use-a no campo calculado. Depois acesse essa constante a partir do main, sem criar nenhum objeto. */
void g5(){

    print("Exercício G5\n");

    print("Um alqueire goiano equivale a ${Talhao.alqueireGoiano} ha");
    print("\n--------------------------------\n");
}

/* G6 - Crie uma lista de objetos Talhao e repita sobre ela as agregações do Bloco E: área total, filtro por cultura e o maior talhão. Compare com a versão que usava mapas. */
void g6(){

    print("Exercício G6\n");

    final List<Talhao> talhoes = [
        Talhao(nome: "Talhão 1", areaHa: 25.0, cultura: "Soja"),
        Talhao(nome: "Talhão 2", areaHa: 35.0, cultura: "Milho"),
        Talhao(nome: "Talhão 3", areaHa: 40.0, cultura: "Soja"),
        Talhao(nome: "Talhão 4", areaHa: 15.0, cultura: "Feijão"),
        Talhao(nome: "Talhão 5", areaHa: 50.0, cultura: "Milho"),
    ];

    final areaTotal = talhoes.fold(0.0, (total, talhao) => total + talhao.areaHa);
    final talhoesDeSoja = talhoes.where((talhao) => talhao.cultura == "Soja").toList();
    final maiorTalhao = talhoes.reduce(
        (maior, talhao) => talhao.areaHa > maior.areaHa ? talhao : maior,
    );

    print("Área total: ${areaTotal.toStringAsFixed(2)} ha");
    print("Talhões de soja: $talhoesDeSoja");
    print("Maior talhão: $maiorTalhao");
    print("\n--------------------------------\n");
}

/* G7 - Crie uma classe abstrata Cultura com nome e ciclo em dias, e duas subclasses concretas.Guarde as duas em uma lista do tipo da classe abstrata e percorra imprimindo o resumo de cada uma. */
void g7(){

    print("Exercício G7\n");

    final List<Cultura> culturas = [
        CulturaAnual(nome: "Soja", cicloDias: 120),
        CulturaPerene(nome: "Café", cicloDias: 240),
    ];

    for (final cultura in culturas) {
        print(cultura.resumo());
    }
}