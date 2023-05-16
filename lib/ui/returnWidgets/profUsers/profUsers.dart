import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/buttons/material_buttons.dart';
import 'package:box_office_offline/ui/colors/myColors.dart';
import 'package:box_office_offline/ui/returnWidgets/profUsers/usersProf/clientOrders.dart';
import 'package:box_office_offline/ui/returnWidgets/profUsers/usersProf/statisticOrders.dart';
import 'package:box_office_offline/ui/returnWidgets/returnProf/returnProfStatistic.dart';
import 'package:box_office_offline/ui/text/textFormFieldes.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

late String onClickUser = "";

class ProfUsers extends StatelessWidget {
  const ProfUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PanelProvider>(builder: (context, panelProvider, child) {
      return SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            panelProvider.userProfStatic == false
                ? const StatisticOrders()
                : ClientOrders(txt: onClickUser),
            panelProvider.userProfStatic == false
                ? Container()
                : Row(
                    children: [
                      Expanded(
                        child: TextFormFiledes(
                          height: 50.sp,
                            edgeInsets: EdgeInsets.only(left: 5.sp,top: 10.sp),
                            labelTx: 'Short info',styleTv: AppTextStyle.grey_14_txt,
                            obScuereText: false,
                            formater: MaskTextInputFormatter()),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10.sp),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            IconButton(
                              splashColor: Colors.grey,
                                onPressed: () {},
                                icon: Image.asset('assets/calendar-edit.png')),
                            SizedBox(
                              width: 5.sp,
                            ),
                            Text(
                              'Set Reminder',
                              style: AppTextStyle.grey_14_txt,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
            Container(
                margin: EdgeInsets.only(left: 8, right: 8, top: 10.sp),
                height: 48.sp,
                decoration: BoxDecoration(
                    borderRadius: RadiusBorder.radius_8,
                    color: AppColor.greyStatic),
                child: ReturnProf.returnCategory()),
            ReturnProf.returnClientCategory()
          ],
        ),
      );
    });
  }







}
