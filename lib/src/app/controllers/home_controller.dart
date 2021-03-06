import 'package:exemplo_curso_flutter/src/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomeController {

  List<CurrencyModel> currencies;

  CurrencyModel toCurrency;
  final TextEditingController toText;

  CurrencyModel fromCurrency;
  final TextEditingController fromText;

  HomeController(this.fromText, this.toText) {
    currencies = CurrencyModel.getCurrencies();
    fromCurrency = currencies[0];
    toCurrency = currencies[1];
  }

  void convert(){

    double valueToConvert = double.tryParse(fromText.text.replaceAll(",",".")) ?? 1.0;
    double returnValue = 0.0;

    if( toCurrency.name == 'Real'){
      returnValue = valueToConvert * fromCurrency.real;
    }else if( toCurrency.name == 'Dolar'){
      returnValue = valueToConvert * fromCurrency.dolar;
    }else if( toCurrency.name == 'Euro'){
      returnValue = valueToConvert * fromCurrency.euro;
    }else if( toCurrency.name == 'Bitcoin'){
      returnValue = valueToConvert * fromCurrency.bitcoin;
    }
    toText.text = returnValue.toStringAsFixed(2);
  }

}
