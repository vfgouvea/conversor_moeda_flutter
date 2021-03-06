import 'package:exemplo_curso_flutter/src/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {

  final List<CurrencyModel> items;
  final CurrencyModel selectedItem;
  final TextEditingController textFieldController;
  final void Function(CurrencyModel model) dropDownOnChange;

  const CurrencyBox({Key key, this.items, this.selectedItem, this.dropDownOnChange, this.textFieldController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 56,
            child: DropdownButton<CurrencyModel>(
              iconEnabledColor: Colors.amber,
              isExpanded: true,
              underline: Container(
                height: 1,
                color: Colors.amber,
              ),
              items: items.map((e) => DropdownMenuItem(value:e, child: Text(e.name))).toList(),
              value: selectedItem,
              onChanged: dropDownOnChange,
            ),
          ),
        ),
        SizedBox(width: 10.0),
        Expanded(
            flex: 2,
            child: TextField(
              controller: textFieldController,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber))),
            )),
      ],
    );
  }
}
