import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:money_input_formatter/money_input_controller.dart';
import 'package:money_input_formatter/money_input_formatter.dart';
class MoneyInputFor extends StatefulWidget {
  @override
  State<MoneyInputFor> createState() => _MoneyInputForState();
}

class _MoneyInputForState extends State<MoneyInputFor> {
  final controller = MoneyInputController();
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textAlign: TextAlign.end,
        keyboardType: TextInputType.number,
        controller: controller,
        onChanged: (_) => setState(() => value = controller.numberValue),// convert to a number
        inputFormatters: [MoneyInputFormatter()],
    );
  }
}