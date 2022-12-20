import 'package:estilizacao_componentes/models/bank.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Bank Model deposit tests', () {

    test('Bank model deposit shoud turn point into 10',
            () {
          final bank = BankModel();
          bank.deposit(10);
          expect(bank.points, 10); //Realiza a comparação para saber se o teste está passando.
        });
    test('Bank model deposit shoud turn avalaible into 10 ',
            () {
          final bank = BankModel();
          bank.deposit(10);
          expect(bank.available, 10);
        });
  });

  test('Bank model transfer shoud turn points into 10',
  (){
    final bank = BankModel();
    bank.transfer(10);
    expect(bank.points, 10);
  });
}
