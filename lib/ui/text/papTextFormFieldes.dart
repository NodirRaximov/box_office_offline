import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:money_input_formatter/money_input_formatter.dart';

class PayTextFormField extends StatelessWidget {
  const PayTextFormField({Key? key,
    this.labelTx,
    this.hintTx,
    required this.text,
    this.height,
    this.width,
    this.textController,
    this.onChanded,
    this.edgeInsets,
    this.styleTv,
    this.providers,
    required this.obScuereText,
    this.keyType,
    required this.formater,
    required this.img})
      : super(key: key);
  final String? labelTx;
  final String? hintTx;
  final String text;
  final String img;
  final double? height;
  final double? width;
  final TextEditingController? textController;
  final ValueChanged<String>? onChanded;
  final EdgeInsets? edgeInsets;
  final TextStyle? styleTv;
  final dynamic providers;
  final bool obScuereText;
  final TextInputType? keyType;
  final MoneyInputFormatter formater;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.65,
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Row(children: [
          Expanded(flex: 2,
              child: text==""
                  ? Align(
                alignment: Alignment.center,
                    child: Image.asset(img,
                alignment: Alignment.centerLeft,
               ),
                  )
                  :Text(textAlign:TextAlign.center,
                text, style: const TextStyle(fontSize: 20),)),
          Expanded(flex: 6,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20,top: 5),
                height: height,
                width: MediaQuery.of(context).size.width * 0.65,
                decoration:DecorationBox.payBoxDecotation,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  style: AppTextStyle.panel_17_txt,
                  keyboardType: keyType,
                  inputFormatters: [formater],
                  onChanged: onChanded,
                  controller: textController,
                ),
              ))
        ],)
    );
  }
}