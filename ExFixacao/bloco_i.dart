// Bloco I — Código assíncrono
void main() async {
  await i1();
  await i2();
  await i3();
}

// Simula a leitura de um sensor de umidade do solo: demora 2 segundos e devolve a umidade em %.
Future<double> lerSensorUmidade() async {
  await Future.delayed(Duration(seconds: 2));
  return 32.5;
}

/* I1 - Escreva uma função que simule a leitura de um sensor de umidade do solo: aguarde dois segundos com Future.delayed e devolva um valor. Chame-a com await e imprima mensagens antes e depois. */
Future<void> i1() async {

  print("Exercício I1\n");

  print("Antes: iniciando a leitura do sensor...");
  // await pausa ESTA função até a leitura terminar e entrega o double já pronto.
  double umidade = await lerSensorUmidade();
  print("Depois: leitura concluída, umidade do solo = ${umidade.toStringAsFixed(1).replaceAll('.', ',')}%");
  print("\n--------------------------------\n");
}

/* I2 - Chame a mesma função sem await e imprima o que é devolvido. Explique em comentário o que apareceu no console. */
Future<void> i2() async {

  print("Exercício I2\n");

  print("Antes de chamar a função");
  // Sem await: a função é disparada, mas o programa NÃO espera ela terminar.
  var leitura = lerSensorUmidade();
  print("Depois de chamar a função");
  print("O que foi devolvido sem await: $leitura");

  /* O que apareceu no console:

  As mensagens "Antes" e "Depois" apareceram na hora, e no lugar do valor apareceu algo como "Instance of 'Future<double>'". Isso acontece porque, sem o await, o que a função devolve não é o número 32.5, e sim um Future<double>: a promessa de que o valor chegará em 2 segundos. A leitura continua em segundo plano enquanto o programa segue em frente. */

  // Aqui eu espero a leitura terminar só para ela não "vazar" para a saída do I3.
  print("Agora com await: ${await leitura}");
  print("\n--------------------------------\n");
}

/* I3 - Faça três leituras em sequência e depois três simultâneas com Future.wait. Meça os dois tempos com Stopwatch e explique a diferença. */
Future<void> i3() async {

  print("Exercício I3\n");

  final relogio = Stopwatch();

  // Três leituras em SEQUÊNCIA: cada await espera a anterior terminar antes de começar a próxima.
  relogio.start();
  double s1 = await lerSensorUmidade();
  double s2 = await lerSensorUmidade();
  double s3 = await lerSensorUmidade();
  relogio.stop();
  int tempoSequencial = relogio.elapsedMilliseconds;
  print("Em sequência: [$s1, $s2, $s3] em $tempoSequencial ms");

  // Três leituras SIMULTÂNEAS: as três começam juntas e Future.wait espera todas terminarem.
  relogio.reset();
  relogio.start();
  List<double> leituras = await Future.wait([
    lerSensorUmidade(),
    lerSensorUmidade(),
    lerSensorUmidade(),
  ]);
  relogio.stop();
  int tempoSimultaneo = relogio.elapsedMilliseconds;
  print("Simultâneas: $leituras em $tempoSimultaneo ms");

  /* Diferença entre os dois tempos:

  Em sequência o tempo é a SOMA das esperas: 3 leituras x 2 s = cerca de 6000 ms, porque cada await só libera a linha seguinte depois que a leitura anterior termina.
  Com Future.wait as três esperas acontecem ao mesmo tempo, então o tempo total é o da mais demorada: cerca de 2000 ms.
  O Dart não está usando três processadores; ele apenas não fica parado esperando uma de cada vez. Só funciona porque as leituras são independentes entre si: se uma dependesse do resultado da outra, teria que ser em sequência. */
  print("\n--------------------------------\n");
}
