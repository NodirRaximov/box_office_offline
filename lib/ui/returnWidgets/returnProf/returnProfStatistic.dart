import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/buttons/material_buttons.dart';
import 'package:box_office_offline/ui/colors/myColors.dart';
import 'package:box_office_offline/ui/returnWidgets/profUsers/profUsers.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:provider/provider.dart';

class ReturnProf{
  ReturnProf._();

  static  returnClientCategory() {
    return Consumer<PanelProvider>(builder: (context, panelProvider, child) {
      return panelProvider.statisticRow == false
          ? Column(
        children: [
          returnDebitCategory(
              'Developers', '15', '4534', '23123', '23123', ""),
          returnDebitCategory('Doctors', "", '343', '500', '23123', ""),
          returnDebitCategory(
              'Marketo logs', '10', '3', '4992', '23123', ""),
          returnDebitCategory(
              'Developers', '15', '4534', '23123', '23123', ""),
          returnDebitCategory('Doctors', "", '343', '500', '23123', ""),
          returnDebitCategory(
              'Marketo logs', '10', '3', '4992', '23123', ""),
        ],
      )
          : panelProvider.userProfStatic == false
          ? Column(
        children: [
          returnDebitCategory(
              'Umarova Aziza', '10', 'Today', '23123', '23123', ""),
          returnDebitCategory('Vostinov Alexander', "", '1 month ago',
              '500', '23123', ""),
          returnDebitCategory('Eshnazarova Odina', '1', '3 month ago',
              '4992', '23123', ""),
          returnDebitCategory(
              'Umarova Aziza', '', 'Today', '23123', '23123', ""),
          returnDebitCategory('Vostinov Alexander', "", '1 month ago',
              '500', '23123', ""),
          returnDebitCategory('Eshnazarova Odina', '', '3 month ago',
              '4992', '23123', ""),
        ],
      )
          : Column(
        children: [
          returnDebitCategory('BOTOX', '10', '45', '23123', '23123',
              Icons.error_outline),
          returnDebitCategory('Botox Шприц', "", '25', '500', '23123',
              Icons.error_outline),
          returnDebitCategory('Super slim pag', '1', '10', '4992',
              '23123', Icons.error_outline),
        ],
      );
    });
  }
  static  returnBrandCategory() {
    return Consumer<PanelProvider>(builder: (context, panelProvider, child) {
      return panelProvider.statisticBrandRow == false
          ? Column(
        children: [
          returnDebitBrandCategory('BOTOX', '545', '1 year ago', '123', '4 455 645 UZS',
              ""),
          returnDebitBrandCategory('Шприцы', "0", 'Today', '0', '0 UZS',
              ""),
          returnDebitBrandCategory('Гель', '10', '12.12.2023', '10',
              '30 000 000 UZS', ""),
        ],
      )
          : Column(
        children: [
          returnDebitBrandCategory(
              'Botox для губ', '441', '1 year ago', '100', '3 000 000 UZS', ""),
          returnDebitBrandCategory('Botox для век', "100", '1 year ago',
              '3', '455 645 UZS', ""),
          returnDebitBrandCategory('Botox для Лица', '4', '1 year ago',
              '20', '1 000 000 UZS', ""),
          returnDebitBrandCategory(
              'Botox для губ', '441', '1 year ago', '100', '3 000 000 UZS', ""),
          returnDebitBrandCategory('Botox для век', "100", '1 year ago',
              '3', '455 645 UZS', ""),
          returnDebitBrandCategory('Botox для Лица', '4', '1 year ago',
              '20', '1 000 000 UZS', ""),
        ],
      );
    });
  }
  static returnDebitBrandCategory(name, debit, quantity, offer, money, sufIcon) {
    return Consumer<PanelProvider>(builder: (context, panelProvider, child) {
      return Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: MaterialButton(
          onPressed: () {
           panelProvider.setStatisticBrandRow(!panelProvider.statisticBrandRow);
          },
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              SizedBox(
                height: 48.sp,
                child: Row(
                  children: [
                    categoryItemReturn(name, AppTextStyle.panel_14_txt,
                        const Color(0x00ffffff), "", context),
                    categoryItemReturn(debit, AppTextStyle.red_13_txt,
                        const Color(0x00ffffff), "", context),
                    categoryItemReturn(quantity, AppTextStyle.panel_14_txt,
                        const Color(0x00ffffff), sufIcon, context),
                    categoryItemReturn(offer, AppTextStyle.panel_14_txt,
                        const Color(0x00ffffff), "", context),
                    categoryItemReturn(money, AppTextStyle.panel_14_txt,
                        const Color(0x00ffffff), "", context),
                  ],
                ),
              ),
              Container(
                height: 1,
                color: AppColor.greyStatic,
              )
            ],
          ),
        ),
      );
    });
  }
  static returnDebitCategory(name, debit, quantity, offer, money, sufIcon) {
    return Consumer<PanelProvider>(builder: (context, panelProvider, child) {
      return Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: MaterialButton(
          onPressed: () {
            if (panelProvider.statisticRow == false) {
              panelProvider.setStatisticRow(true);
            } else if (panelProvider.statisticRow == true) {
              if (panelProvider.userProfStatic == false) {
                panelProvider.setUserProfStatic(true);
                onClickUser = name;
              } else {
                panelProvider.setStatisticRow(false);
                panelProvider.setUserProfStatic(false);
              }
            }
          },
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              SizedBox(
                height: 48.sp,
                child: Row(
                  children: [
                    categoryItemReturn(name, AppTextStyle.panel_14_txt,
                        const Color(0x00ffffff), "", context),
                    categoryItemReturn(debit, AppTextStyle.red_13_txt,
                        const Color(0x00ffffff), "", context),
                    categoryItemReturn(quantity, AppTextStyle.panel_14_txt,
                        const Color(0x00ffffff), sufIcon, context),
                    categoryItemReturn(offer, AppTextStyle.panel_14_txt,
                        const Color(0x00ffffff), "", context),
                    categoryItemReturn(money, AppTextStyle.panel_14_txt,
                        const Color(0x00ffffff), "", context),
                  ],
                ),
              ),
              Container(
                height: 1,
                color: AppColor.greyStatic,
              )
            ],
          ),
        ),
      );
    });
  }
  static returnCategoryBrand() {
    return Consumer<PanelProvider>(builder: (context, panelProvider, child) {
      return  Row(
        children: [
          categoryItemReturn('Offers category', AppTextStyle.grey_14_txt,
              const Color(0x00ffffff), "", context),
          categoryItemReturn('Stock balance ', AppTextStyle.grey_14_txt,
              const Color(0x00ffffff), "", context),
          categoryItemReturn(
              'Last parish',
              AppTextStyle.grey_14_txt,
              const Color(0x00ffffff),
              "",
              context),
          categoryItemReturn('Quantity sell', AppTextStyle.grey_14_txt,
              const Color(0x00ffffff), "", context),
          categoryItemReturn('Money', AppTextStyle.grey_14_txt,
              const Color(0x00ffffff), "", context),
        ],
      );
    });
  }

  static returnCategory() {
    return Consumer<PanelProvider>(builder: (context, panelProvider, child) {
      return panelProvider.statisticRow == false
          ? Row(
        children: [
          categoryItemReturn('Client category', AppTextStyle.grey_14_txt,
              const Color(0x00ffffff), "", context),
          categoryItemReturn('Debt ', AppTextStyle.grey_14_txt,
              const Color(0x00ffffff), "", context),
          categoryItemReturn(
              'Quantity of order',
              AppTextStyle.grey_14_txt,
              const Color(0x00ffffff),
              "",
              context),
          categoryItemReturn('Offer in order', AppTextStyle.grey_14_txt,
              const Color(0x00ffffff), "", context),
          categoryItemReturn('Money', AppTextStyle.grey_14_txt,
              const Color(0x00ffffff), "", context),
        ],
      )
          : panelProvider.userProfStatic == false
          ? Row(
        children: [
          categoryItemReturn('Clients', AppTextStyle.grey_14_txt,
              const Color(0x00ffffff), "", context),
          categoryItemReturn('Debt', AppTextStyle.grey_14_txt,
              const Color(0x00ffffff), "", context),
          categoryItemReturn('Last seen', AppTextStyle.grey_14_txt,
              const Color(0x00ffffff), "", context),
          categoryItemReturn(
              'Offer in order',
              AppTextStyle.grey_14_txt,
              const Color(0x00ffffff),
              "",
              context),
          categoryItemReturn('Money', AppTextStyle.grey_14_txt,
              const Color(0x00ffffff), "", context),
        ],
      )
          : Row(
        children: [
          categoryItemReturn('Tovar', AppTextStyle.grey_14_txt,
              const Color(0x00ffffff), "", context),
          categoryItemReturn('Debt ', AppTextStyle.grey_14_txt,
              const Color(0x00ffffff), "", context),
          categoryItemReturn(
              'Quantity of order',
              AppTextStyle.grey_14_txt,
              const Color(0x00ffffff),
              "",
              context),
          categoryItemReturn(
              'Offer in order',
              AppTextStyle.grey_14_txt,
              const Color(0x00ffffff),
              "",
              context),
          categoryItemReturn('Money', AppTextStyle.grey_14_txt,
              const Color(0x00ffffff), "", context),
        ],
      );
    });
  }

  static categoryItemReturn(txt, textStyle, Color? colors, suficsIcon, context) {
    return Expanded(
        child: Container(
          color: colors,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 10.sp),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                txt,
                style: textStyle,
              ),
              suficsIcon == ""
                  ? Container()
                  : JustTheTooltip(
                content: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  padding: EdgeInsets.all(8.sp),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5.sp),
                          decoration: DecorationBox.returnBorderColorRadius(
                              AppColor.greyStatic, RadiusBorder.radius_6, 2),
                          child: Text(
                            'Шифокор ушбу товарни сотиши учун дипломи йок',
                            style: AppTextStyle.panel_14_txt,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 8.sp),
                            alignment: Alignment.bottomRight,
                            child: MaterialButtons(
                              gr: false,
                              gradientText: DecorationBox.gradientText,
                              text: 'Close',
                              onPressed: () {},
                              decoration: DecorationBox.linerGradientShadow,
                              textStyle: AppTextStyle.white_13_txt_w4,
                              height: 30.sp,
                              width: 100.sp,
                            ))
                      ],
                    ),
                  ),
                ),
                triggerMode: TooltipTriggerMode.tap,
                child: const Material(
                  color: Colors.white,
                  shape: CircleBorder(),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.error_outline,
                      color: AppColor.greyStatic,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}