import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/ui/returnWidgets/containerLines.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DropdownDialog extends StatelessWidget {
  const DropdownDialog(
      {Key? key,
      required this.list,
      required this.indexList,
      // required this.onPressed,
      required this.value,
      required this.hintText})
      : super(key: key);

  final List<String> list;
  final int indexList;

  // final VoidCallback onPressed;

  final String value;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProvidersClass>(builder: (context, providersClass, child) {
      return Stack(
        children: [
          ContainerLines(
            sufIcon: "",
            height: 48.sp,
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            index: value != "" ? 1 : -1,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    contentPadding: EdgeInsets.zero,
                    title: Text(hintText.substring(0, hintText.length - 1),
                        style: AppTextStyle.panel_22_txt_w4),
                    content: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          list.length,
                          (index) => MaterialButton(
                              minWidth: 200,
                              onPressed: () {
                                providersClass.setDropDownValue(
                                    indexList, index);
                                Navigator.pop(context);
                              },
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  list[index],
                                  textAlign: TextAlign.start,
                                  style: AppTextStyle.grey_18_txt,
                                ),
                              )
                          ),
                        ),
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: Text("Close", style: AppTextStyle.blue_18_txt),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  );
                },
              );
            },
            hintText: value != "" ? value : hintText,
            btnImg: "assets/arrow-down.png",
            textStyle: value != hintText
                ? AppTextStyle.grey_16_txt
                : AppTextStyle.grey_14_txt,
          ),
          value != ""
              ? Positioned(
                  top: 18,
                  left: 32,
                  child: Text(hintText, style: AppTextStyle.grey_10_txt))
              : Container()
        ],
      );
    });
  }
}
