import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';

class ListItemColumn extends StatelessWidget {
  const ListItemColumn(
      {super.key,
      required this.suffixText,
      required this.txt,
      required this.index});

  final String suffixText;
  final dynamic txt;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                child: Text(
                  suffixText,
                  textAlign: TextAlign.start,
                  style: AppTextStyle.grey_11_txt,
                )),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
              child: Text(
                  "$txt",
                  style: AppTextStyle.panel_14_txt,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1),
            ),
          ],
        ),
        Positioned(
          bottom: -5,
          right: 5,
          child: index == 1
            ? Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
          child: Text(
              "${txt * 0.7}",
              style: AppTextStyle.red_13_txt,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              maxLines: 1),
        )
            : Container(),)
      ],
    );
  }
}
