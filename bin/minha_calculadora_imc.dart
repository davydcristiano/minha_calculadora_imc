import 'dart:io';

class Pessoa {
  String nome;
  double peso;
  double altura;

  Pessoa(this.nome, this.peso, this.altura);

  double calcularIMC() {
    return peso / (altura * altura);
  }

  String classificarIMC(double imc) {
    if (imc < 16) {
      return "Magreza grave";
    } else if (imc < 17) {
      return "Magreza moderada";
    } else if (imc < 18.5) {
      return "Magreza leve";
    } else if (imc < 25) {
      return "Saudável";
    } else if (imc < 30) {
      return "Sobrepeso";
    } else if (imc < 35) {
      return "Obesidade Grau I";
    } else if (imc < 40) {
      return "Obesidade Grau II (Severa)";
    } else {
      return "Obesidade Grau III (Mórbida)";
    }
  }

  void exibirResultado() {
    double imc = calcularIMC();
    String classificacao = classificarIMC(imc);

    print("\nOlá, $nome!");
    print("Seu IMC é: $imc");
    print("Classificação: $classificacao");
  }
}

void main(List<String> arguments) {
  print("\nOlá, seja bem vindo a calculadora IMC");

  String? nome;
  double? peso;
  double? altura;

  try {
    print("\nPor favor insira seu nome: ");
    nome = stdin.readLineSync()!;

    print("\nPor favor Digite seu peso (em kg): ");
    String? pesoStr = stdin.readLineSync();
    if (pesoStr != null) {
      peso = double.tryParse(pesoStr);
      if (peso == null) {
        print("\nErro: Por favor insira um número válido.");
        return;
      }
    } else {
      print("\nErro: entrada de peso inválida");
      return;
    }

    print("\nPor favor Digite sua altura (em metros): ");
    String? alturaStr = stdin.readLineSync();
    if (alturaStr != null) {
      altura = double.tryParse(alturaStr);
      if (altura == null) {
        print("\nErro: Por favor insira uma Altura válida.");
        return;
      }
    } else {
      print("\nErro: entrada de altura inválida.");
      return;
    }
  } catch (e) {
    print("\nErro ao ler a entrada: $e");
    return;
  }

  Pessoa calculadora = Pessoa(nome, peso, altura);
  calculadora.exibirResultado();
}
