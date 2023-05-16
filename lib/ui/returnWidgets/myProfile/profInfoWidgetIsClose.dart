import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfInfoWidgetIsClose extends StatelessWidget {
  const ProfInfoWidgetIsClose({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PanelProvider>(builder:(context,panelProvider,child) {
      return MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        shape: RadiusBorder.roundedRadius_8,
        child: Stack(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10, left: 10),
                  height: 50.sp,
                  width: 50.sp,
                  child: ClipRRect(
                    borderRadius: RadiusBorder.radius_8,
                    child: SizedBox.fromSize(
                        child: Image.network(
                          "https://www.pngkit.com/png/detail/10-107249_work-for-a-doctor-memes.png",
                          fit: BoxFit.fitHeight,
                        )),
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      returnItem(const EdgeInsets.only(), 'Status',
                          "Offline", 1, TextOverflow.ellipsis,1),
                      returnItem(
                          const EdgeInsets.only(),
                          'Full Name',
                          "Usmanova Umida Jabbor qizi",
                          1,
                          TextOverflow.ellipsis,2),
                      returnItem(const EdgeInsets.only(), 'Specialty',
                          "Marketing Coordinator", 1, TextOverflow.ellipsis,2),
                      returnItem(const EdgeInsets.only(), 'Work',
                          "Humedic Company or -", 1, TextOverflow.ellipsis,2),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
                right: 10.sp,
                top: 5.sp,
                child: MaterialButton(
                  minWidth: 40,
                  height: 40,
                  shape: RadiusBorder.roundedRadius_5,
                  onPressed: () {
                    panelProvider.profInfotf(true);
                  },
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    size: 30.sp,
                  ),
                ))
          ],
        ),
      );
    });
  }
  Expanded returnItem(EdgeInsets margin, title, subtitle, maxLines, overFlow,int flex) {
    return Expanded(
      flex: flex,
      child: Container(
        margin: margin,
        child: ListTile(
          title: Text(
            title,
            style: AppTextStyle.grey_12_txt,
          ),
          subtitle: Text(
            subtitle,
            overflow: overFlow,
            maxLines: maxLines,
            style: AppTextStyle.panel_14_txt,
          ),
        ),
      ),
    );
  }
}
