// Bloco B — Segurança contra nulo
void main(){
    b1();
    b2();
    b3();
    b4();
    b5();
}

/* B1 - Declare String? telefone sem valor inicial e imprima-a usando ?? para exibir "não informado" quando estiver vazia. */
void b1(){

    // String? indica que a variável pode ser nula
    String? telefone; 

    print("Telefone: ${telefone ?? "não informado"}");
    print("\n--------------------------------\n");
}

/* B2 - Tente imprimir telefone.length diretamente. Copie a mensagem de erro como comentário e depois corrija usando ?.. */
void b2(){
    
    String? telefone; 

    /* Tentativa de impremir telefone.length diretamente:":

    print("Telefone: ${telefone.length}");

    The property 'length' can't be unconditionally accessed because the receiver can be 'null'.
    */

    print("Telefone: ${telefone?.length}"); 
    print("\n--------------------------------\n");
}

/* B3 - Escreva uma função que receba double? chuvaMm e devolva um texto: "sem registro" quando for nula, "seca" abaixo de 20 mm e "normal" acima disso. */
void b3(){

    double? chuvaMm;

    print("Chuva: ${chuvaMm == null ? "sem registro" : (chuvaMm < 20 ? "seca" : "normal")}");
    print("\n--------------------------------\n");
}

/* B4 -  Escreva uma função com retorno double? que calcule sacas por hectare e devolva nulo quando a área for zero ou negativa. Trate o resultado no main com uma verificação explícita, sem usar o operador !. */
void b4(){

    double? calcularSacasPorHa(double area, double producao){
        if(area <= 0){
            return null;
        }
        return producao / area;
    }

    double? resultado = calcularSacasPorHa(0, 100);
    
    if(resultado == null || resultado <= 0){
        print("Resultado: Área inválida (zero ou negativa)");
    } else {
        print("Resultado: $resultado sacas por hectare");
    }
    print("\n--------------------------------\n");
}

/* B5 - Force uma quebra: use o operador ! sobre um valor que você sabe ser nulo. Copie a
mensagem de execução e escreva, em comentário, por que esse operador deve ser
evitado. */
void b5(){

    String? valorNulo;

    /* Tentativa de usar o operador ! sobre um valor nulo:

    print(valorNulo!);

    Uncaught Error, error: Error: Unexpected null value.
    */

    print("O operador ! força a desreferenciação de uma variável que pode ser nula. Se a variável for realmente nula, isso causará uma exceção em tempo de execução. Portanto, deve ser evitado, pois pode levar a falhas inesperadas no programa.");
}