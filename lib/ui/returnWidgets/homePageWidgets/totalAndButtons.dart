import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/providers/registerProviders.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/buttons/material_buttons.dart';
import 'package:box_office_offline/ui/cutomDialogs/moneyPayContainer/moneyShowDialogPay.dart';
import 'package:box_office_offline/ui/returnWidgets/totalDiscount.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TotalAndButtons extends StatelessWidget {
  const TotalAndButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProvidersClass>(builder: (context, providersClass, child) {
      return Consumer<RegisterProviders>(
          builder: (context, registerProv, child) {
        return Consumer<PanelProvider>(
            builder: (context, panelProvider, child) {
          return Container(
            color: const Color.fromARGB(0, 0, 0, 0),
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ToTalDiscount(
                  couponesShow: true,
                  providersClass: providersClass,
                  index: -1,
                ),
                SizedBox(
                  height: 5.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButtons(
                      gr: false,
                      gradientText: DecorationBox.gradientText,
                      decoration: DecorationBox.allBoxDecorationBorderRed,
                      text: "CANCEL",
                      textStyle:
                          registerProv.allPositionsData(context, providersClass)
                              ? AppTextStyle.blue_13_txt_w5
                              : AppTextStyle.red_13_txt_w5,
                      // textColor:
                      // registerProv.allPositionsData(context, providersClass)?Colors.blue:Colors.red,
                      height: 48.sp,
                      width: 150.sp,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1,
                              color: registerProv.allPositionsData(
                                      context, providersClass)
                                  ? Colors.blue
                                  : Colors.red),
                          borderRadius: BorderRadius.circular(8)),
                      tf: true,
                      onPressed: () {
                        panelProvider.setFalseMoneyPayButton();
                        providersClass.closeOrOpen(context);
                        providersClass.twotfbtn(4);
                        if (panelProvider.aboutScanBarDialog != false) {
                          panelProvider.aboutScanBar();
                        }
                        providersClass.shopTfCart();
                        providersClass.allregisterset(0);
                        context.read<RegisterProviders>().picList.clear();
                      },
                    ),
                    MaterialButtons(
                      gr: false,
                      gradientText: DecorationBox.gradientText,
                      textStyle: AppTextStyle.white_13_txt_w5,
                      text: "В ЗАКАЗ",
                      decoration: DecorationBox.linerGradientShadowSuccess,
                      shape: RadiusBorder.roundedRadius_8,
                      height: 48.sp,
                      width: 150.sp,
                      tf: true,
                      onPressed: () {
                        const MoneyShowDialogPay(brandOrService:false, index: -1);
                      },
                    ),
                    MaterialButtons(
                      gr: false,
                      gradientText: DecorationBox.gradientText,
                      textStyle: AppTextStyle.white_13_txt_w5,
                      text: "ОПЛАТИТЬ",
                      decoration: DecorationBox.linerGradientShadow,
                      shape: RadiusBorder.roundedRadius_8,
                      height: 48.sp,
                      width: 150.sp,
                      tf: true,
                      onPressed: () {
                        panelProvider.setMoneyPayButton();
                        // MoneyShowDialogPay.showDialogPay(true, context, -1);
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        });
      });
    });
  }
}
