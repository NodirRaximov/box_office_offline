import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/buttons/iconsButtons.dart';
import 'package:box_office_offline/ui/items/profMoneyItems.dart';
import 'package:box_office_offline/ui/returnWidgets/myProfile/profInfoWidgetIsClose.dart';
import 'package:box_office_offline/ui/returnWidgets/myProfile/profInfoWidgetIsOpen.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ClientOrders extends StatelessWidget {
  const ClientOrders({Key? key, required this.txt}) : super(key: key);

  final String txt;

  @override
  Widget build(BuildContext context) {
    return Consumer<PanelProvider>(builder: (context, panelProvider, child) {
      return Wrap(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(left: 5.sp,right: 5.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Users/ $txt",
                      style: AppTextStyle.text_black_24_w5,
                    ),
                    IconsButtons(
                        text: "Иш тугатдим",
                        textColor: Colors.white,
                        shape: RadiusBorder.roundedRadius_8,
                        height: 38.sp,
                        width: 200.sp,
                        iconEnd: "",
                        iconStart: "assets/timer_pause.png",
                        textStyle: AppTextStyle.white_13_txt_w5,
                        onPressed: () {},
                        decoration: DecorationBox.linerGradientShadow)
                  ],
                ),
              ),
              Row(
                children: [
                  MoneyItemsProf(
                      text: "Ishlab toptim",
                      icon: "assets/money_reciv.png",
                      price: "185 580 000 UZS",
                      percentage: "+14%",
                      decoration: DecorationBox.linerGradientShadow),
                  MoneyItemsProf(
                    text: "Qarz",
                    icon: "assets/money_debt.png",
                    price: "11 UZS",
                    percentage: "+25%",
                    decoration: DecorationBox.linerGradientDebt,
                  ),
                  MoneyItemsProf(
                      text: "Harajatim",
                      icon: "assets/monmey_costs.png",
                      price: "54 566 500 UZS",
                      percentage: "+3%",
                      decoration: DecorationBox.linerGradientCosts),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 8, right: 8, top: 10.sp),
                decoration: DecorationBox.allBoxDecoration,
                width: MediaQuery.of(context).size.width,
                child: AnimatedSize(
                  alignment: Alignment.topCenter,
                  curve: Curves.easeIn,
                  duration: const Duration(milliseconds: 450),
                  child: panelProvider.isOpenProfInfo
                      ? const ProfInfoWidgetIsOpen(profid: 1)
                      : const ProfInfoWidgetIsClose(),
                ),
              ),
            ],
          )
        ],
      );
    });
  }
}
