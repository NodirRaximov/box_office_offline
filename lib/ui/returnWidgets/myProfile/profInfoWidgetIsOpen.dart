import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfInfoWidgetIsOpen extends StatelessWidget {
  const ProfInfoWidgetIsOpen({Key? key, required this.profid}) : super(key: key);

  final int profid;

  @override
  Widget build(BuildContext context) {
    return Consumer<PanelProvider>(builder:(context,panelProvider,child){
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
                  height: 167.sp,
                  width: 178.sp,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      returnItem(
                          EdgeInsets.only(top: 10.sp),
                          'Full Name',
                          "Usmanova Umida Jabbor qizi",
                          1,
                          TextOverflow.ellipsis),
                      returnItem(EdgeInsets.zero, 'date of birth', "10.10.2000",
                          1, TextOverflow.ellipsis),
                      returnItem(EdgeInsets.only(bottom: 10.sp), 'Gender',
                          "Female", 1, TextOverflow.ellipsis),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      returnItem(EdgeInsets.only(top: 10.sp), 'Specialty',
                          "Marketing Coordinator", 1, TextOverflow.ellipsis),
                      returnItem(
                          EdgeInsets.zero,
                          'City/Region',
                          "Tashkent city/Almazar district",
                          1,
                          TextOverflow.ellipsis),
                      returnItem(EdgeInsets.only(bottom: 10.sp), 'Status',
                          "Offline", 1, TextOverflow.ellipsis),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      returnItem(EdgeInsets.only(top: 10.sp), 'Work',
                          "Humedic Company or -", 1, TextOverflow.ellipsis),
                      ListTile(
                        title: Text(
                          'File',
                          style: AppTextStyle.grey_12_txt,
                        ),
                        subtitle: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 5.sp),
                              child: InkWell(
                                onTap: (){},
                                splashColor: Colors.grey,
                                child: Text(
                                  'Diplom235345.pdf',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: AppTextStyle.blue_13_txt_under,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5.sp),
                              child: InkWell(
                                  onTap: (){},
                                  splashColor: Colors.grey,
                                  child: Image.asset('assets/file_edit_icon.png')
                              ),
                            )
                          ],
                        ),
                      ),
                      returnItem(EdgeInsets.only(bottom: 10.sp), 'Accaunt',
                          "Unverified", 1, TextOverflow.ellipsis),
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
                    panelProvider.profInfotf(false);
                  },
                  child: Icon(
                    Icons.keyboard_arrow_up,
                    size: 30.sp,
                  ),
                ))
          ],
        ),
      );
    });
  }

  Container returnItem(EdgeInsets margin, title, subtitle, maxLines, overFlow) {
    return Container(
      margin: margin,
      child: ListTile(
        title: Container(
          margin: EdgeInsets.only(bottom: 5.sp),
          child: Text(
            title,
            style: AppTextStyle.grey_12_txt,
          ),
        ),
        subtitle: Text(
          subtitle,
          overflow: overFlow,
          maxLines: maxLines,
          style: AppTextStyle.panel_14_txt,
        ),
      ),
    );
  }
}
