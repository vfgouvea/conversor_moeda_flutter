import 'package:exemplo_curso_flutter/src/app/controllers/home_controller.dart';
import 'package:exemplo_curso_flutter/src/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

main() {

  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  final homeController = HomeController(fromText,toText);

  test('deve converter de real para dolar com ponto', (){
    fromText.text = '2.0';
    homeController.convert();
    expect(toText.text,'0.36');
  });

  test('deve converter de real para dolar com virgula', (){
    fromText.text = '2.0';
    homeController.convert();
    expect(toText.text,'0.36');
  });

  test('deve converter de dolar para real', (){
    fromText.text = '2.0';
    homeController.fromCurrency = CurrencyModel(name: 'Dolar',real: 5.65,dolar: 1,euro: 0.85,bitcoin: 0.000088);
    homeController.toCurrency = CurrencyModel(name: 'Real',real: 1,dolar: 0.18,euro: 0.15,bitcoin: 0.000016);
    homeController.convert();
    expect(toText.text,'11.30');
  });

}
