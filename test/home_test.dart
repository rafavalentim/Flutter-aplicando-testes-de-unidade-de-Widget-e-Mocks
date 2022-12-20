import 'package:estilizacao_componentes/components/box_card.dart';
import 'package:estilizacao_componentes/data/bank_http.mocks.dart';
import 'package:estilizacao_componentes/data/bank_inherited.dart';
import 'package:estilizacao_componentes/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {

  final MockBankHttp httpMock = MockBankHttp();

  //Realizando um teste de Widget.
  testWidgets('My widget has a text "Spent"', (tester) async {

    //Criando um stub.
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));

    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: Home(api: httpMock.dolarToReal(),),
        ),
      ),
    );
    final spentFinder = find.text('Spent');
    expect(spentFinder, findsOneWidget);
  });

  testWidgets('My widget has a text "Deposit"', (tester) async {

    //Criando um stub.
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));

    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: Home(api: httpMock.dolarToReal(),),
        ),
      ),
    );
    final spentFinder = find.text('Deposit');
    expect(spentFinder, findsOneWidget);
  });


  testWidgets('Finds a LinearProgressIndicator', (tester) async {

    //Criando um stub.
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));

    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: Home(api: httpMock.dolarToReal(),),
        ),
      ),
    );
    //Realizando a busca pelo tipo find.byType para achar o ProgressIndicator.
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });

  testWidgets('Finds an AccountStatus by key', (tester) async {

    //Criando um stub.
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));

    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: Home(api: httpMock.dolarToReal(),),
        ),
      ),
    );
    //Realizando a busca pelo tipo find.byType para achar o ProgressIndicator.
    expect(find.byKey(const Key('testKey')), findsOneWidget);
  });

  testWidgets('Find 5 BoxCards', (tester) async {

    //Criando um stub.
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));

    await tester.pumpWidget(
        MaterialApp(
          home: BankInherited(
            child: Home(api:httpMock.dolarToReal(),),
          ),
        ),
    );

        expect(find.byWidgetPredicate((widget){
              if (widget is BoxCard) {
                return true;
              } else {
                return false;
              }
    }), findsNWidgets(5));
  });

  //Realizando testes mais completos, tentando as ações.
  testWidgets('When tap, deposit should upload earned in 10 points', (tester) async
  {

    //Criando um stub.
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));

    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: Home(api: httpMock.dolarToReal(),),
        ),
      ),
    );

    await tester.tap(find.text('Deposit'));
    await tester.tap(find.text('Earned'));

    //É necessário dar um novo pump ao dar um tap.
    await tester.pumpAndSettle();

    expect(find.text('\$10.0'), findsOneWidget);

  });

  testWidgets('When tap, transfer should upload spent in 10 points', (tester) async
  {
    //Criando um stub.
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));

    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: Home(api: httpMock.dolarToReal(),),
        ),
      ),
    );

    await tester.tap(find.text('Transfer'));
    await tester.tap(find.text('Spent'));

    //É necessário dar um novo pump ao dar um tap.
    await tester.pumpAndSettle();

    expect(find.text('\$10.0'), findsOneWidget);

  });

  testWidgets('Testing MockHttp dolarToReal', (tester) async {

    //Criando um stub.
    when(httpMock.dolarToReal()).thenAnswer((_) async => ('5'));

    await tester.pumpWidget(
      MaterialApp(
        home: BankInherited(
          child: Home(api: httpMock.dolarToReal(),),
        ),
      ),
    );

    verify(httpMock.dolarToReal()).called(1);

  });


}
