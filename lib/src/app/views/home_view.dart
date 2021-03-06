import 'package:exemplo_curso_flutter/src/app/components/currency_box.dart';
import 'package:exemplo_curso_flutter/src/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(fromText, toText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 100.0, right: 50.0, bottom: 100.0, left: 50.0),
            child: Column(
              children: [
                SizedBox(
                    child: Image.asset(
                  "assets/images/logo.png",
                  width: 250,
                  height: 250,
                )),
                SizedBox(height: 30.0),
                CurrencyBox(
                  items: homeController.currencies,
                  selectedItem: homeController.fromCurrency,
                  textFieldController: fromText,
                  dropDownOnChange: (model) {
                    setState(() {
                      homeController.fromCurrency = model;
                    });
                  },
                ),
                CurrencyBox(
                  items: homeController.currencies,
                  selectedItem: homeController.toCurrency,
                  textFieldController: toText,
                  dropDownOnChange: (model) {
                    setState(() {
                      homeController.toCurrency = model;
                    });
                  },
                ),
                SizedBox(height: 50.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.amber),
                  onPressed: () {homeController.convert();},
                  child: Text('CONVERTER'),
                ),
              ],
            ),
          )),
    );
  }
}
