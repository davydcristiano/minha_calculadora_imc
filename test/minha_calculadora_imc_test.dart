import 'package:test/test.dart';
import '../bin/minha_calculadora_imc.dart';

void main() {
  group('Pessoa', () {
    test('calcularIMC deve retorna o IMC certo', () {
      Pessoa pessoa = Pessoa('Teste', 86.0, 1.66);

      double imc = pessoa.calcularIMC();

      expect(imc, closeTo(22.86, 0.01));
    });

    test('classificarIMC deve retornar a classificação correta do IMC', () {
      Pessoa pessoa = Pessoa('Teste', 86.0, 1.66);

      double imc = pessoa.calcularIMC();
      String classificacao = pessoa.classificarIMC(imc);

      expect(classificacao, 'Saudável');
    });
  });
}
