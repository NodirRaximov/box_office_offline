
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/colors/myColors.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextFormFiledes extends StatelessWidget {
  const TextFormFiledes(
      {Key? key,
        this.labelTx,
        this.onChanded,
        this.styleTv,
        this.hintTx,
        this.providers,
        this.height,
        this.width,
        this.edgeInsets,
        this.suffixIconOne,
        this.suffixIconTwo,
        required this.obScuereText,
        this.textController,
        this.onPressedOne,
        this.onPressedTwo,
        this.onPressedThree,
        this.keyType,
        required this.formater,
        this.suffixIconThree,
        this.suffixIconStart,
        this.iconColor})
      : super(key: key);
  final String? labelTx;
  final String? hintTx;
  final double? height;
  final double? width;
  final TextEditingController? textController;
  final ValueChanged<String>? onChanded;
  final EdgeInsets? edgeInsets;
  final TextStyle? styleTv;
  final dynamic providers;
  final dynamic suffixIconStart;
  final dynamic suffixIconOne;
  final dynamic suffixIconTwo;
  final dynamic suffixIconThree;
  final bool obScuereText;
  final dynamic iconColor;
  final VoidCallback? onPressedOne;
  final VoidCallback? onPressedTwo;
  final VoidCallback? onPressedThree;
  final TextInputType? keyType;
  final MaskTextInputFormatter formater;

  final bool _col=true;
  bool get col =>_col;
  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      padding: const EdgeInsets.only(top: 3),
      margin: edgeInsets,
      decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color: _col
                  ?AppColor.grey
                  :AppColor.primary),
          borderRadius: RadiusBorder.radius_6),
      child: Row(
        children: [
          suffixIconStart!=null?
          IconButton(onPressed: onPressedOne, icon: Image.asset(suffixIconStart,color: providers.userBtnTf?AppColor.primary:AppColor.grey,)):Container(),
          Expanded(
            child: TextFormField(
              obscureText:obScuereText,
              keyboardType:keyType,
              onChanged: onChanded,
              inputFormatters: [formater],
              style: styleTv,
              decoration: InputDecoration(
                labelText: labelTx,
                hintText: hintTx,
                hintStyle: AppTextStyle.grey_14_txt,
                labelStyle:AppTextStyle.grey_14_txt,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(10),
              ),
              controller: textController,
            ),
          ),
          suffixIconOne!=null?
          IconButton(onPressed: onPressedOne, icon: Image.asset(suffixIconOne,color: providers.userBtnTf?AppColor.primary:AppColor.grey,)):Container(),
          suffixIconTwo!=null?
          IconButton(onPressed: onPressedTwo, icon: Image.asset(suffixIconTwo,color: iconColor)):Container(),
          suffixIconThree!=null?
          IconButton(onPressed: onPressedThree, icon: Icon(suffixIconThree,color: iconColor??AppColor.grey)):Container(),
          const SizedBox(width: 5)
        ],
      ),
    );
  }}