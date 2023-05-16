
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/buttons/iconsButtons.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingAndDetails extends StatelessWidget {
  const RatingAndDetails(
      {Key? key,
      required this.flex,
      required this.text,
      required this.onPressed,
      required this.tf})
      : super(key: key);

  final int flex;
  final String text;
  final bool tf;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10.sp),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text(
                      text,
                      style: AppTextStyle.black_17_txt_w7,
                    ),
                    IconsButtons(
                      onPressed: onPressed,
                      text: "Month",
                      height: 26.sp,
                      iconStart: "",
                      padding: EdgeInsets.zero,
                      shape: RadiusBorder.roundedRadius_6,
                      textStyle: AppTextStyle.blue_13_txt,
                      iconEnd: "assets/arrow-down.png",
                      decoration: DecorationBox.deorationColorGrey,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5.sp,
            ),
            tf ? returnRating() : returnDetails()
          ],
        ));
  }

  Container returnDetails() {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: EdgeInsets.all(15.sp),
      decoration: DecorationBox.allBoxDecoration,
      child: Expanded(
        child: Column(
          children: [
            returnDetailsLine('Название', 'KPI', 'По факту', 1, AppTextStyle.grey_16_txt),
            returnDetailsLine('Оптом продажи:', '74%', '3 878 000 UZS', 2, AppTextStyle.blue_16_txt),
            returnDetailsLine('Нал. продажи:', '34%', '3 878 000 UZS', 2, AppTextStyle.red_16_txt),
            returnDetailsLine('Заказы:', '34%', '455', 2, AppTextStyle.red_16_txt),
            returnDetailsLine('Пациенты:', '56%', '44', 2, AppTextStyle.success_16_txt),
            returnDetailsLine('Заработано:', '34%', '3 878 000 UZS', 2, AppTextStyle.success_16_txt),
            returnDetailsLine('Время работы:', '12h.', '12 hours', 2, AppTextStyle.panel_16_txt),
            returnDetailsLine('Звонков:', '5', '5', 2, AppTextStyle.panel_16_txt),
            returnDetailsLine('Время на звонки', '444', '444', 2, AppTextStyle.panel_16_txt),
          ],
        ),
      ),
    );
  }

 Container returnDetailsLine(name, kpi, inFact, index, styleTextKpi) {
    Container row=Container();
    switch (index) {
      case 1:
        row = Container(
          margin: EdgeInsets.only(left:10.sp,top: 5.sp,bottom: 5.sp),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  name,
                  style: AppTextStyle.grey_14_txt,
                ),
              ),
              SizedBox(
                width: 100,
                child: Text(
                  kpi,
                  style: AppTextStyle.grey_14_txt,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  inFact,
                  style: AppTextStyle.grey_14_txt,
                ),
              ),
            ],
          ),
        );
        break;
      case 2:
        row = Container(
          margin: EdgeInsets.only(left:10,top: 5.sp,bottom: 5.sp),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  name,
                  style: AppTextStyle.panel_16_txt,
                ),
              ),
              SizedBox(
                width: 100,
                child: Text(kpi, style: styleTextKpi),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  inFact,
                  style: AppTextStyle.panel_16_txt,
                ),
              ),
            ],
          ),
        );
        break;
    }
    return row;
  }

  Container returnRating() {
    return Container(
      padding: EdgeInsets.only(left:10.sp,top:15.sp,bottom: 15.sp),
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: DecorationBox.allBoxDecoration,
      child: Expanded(
        child: Column(
          children: [
            returnItem(EdgeInsets.only(top: 5.sp), 'assets/sales_icon.png', 'Продажи',
                '438', 1, TextOverflow.ellipsis),
            returnItem(EdgeInsets.only(top: 5.sp), 'assets/customers_icon.png', 'Клиентов',
                '546', 1, TextOverflow.ellipsis),
            returnItem(EdgeInsets.only(top: 5.sp), 'assets/statistics_icon.png',
                'Статистика', '1,802', 1, TextOverflow.ellipsis),
            returnItem(EdgeInsets.only(top: 5.sp), 'assets/sale_amount_icon.png',
                'Сумма продаж', '999 890 909 UZS', 1, TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }

  Container returnItem(
      EdgeInsets margin, icon, title, subtitle, maxLines, overFlow) {
    return Container(
      margin: margin,
      child: ListTile(
        leading: Container(
          height: 40.sp,
          width: 40.sp,
          decoration: DecorationBox.allBoxDecoration,
          child: Image.asset(icon),
        ),
        title: Text(
          title,
          style: AppTextStyle.grey_12_txt,
        ),
        subtitle: Container(
          margin: margin,
          child: Text(
            subtitle,
            overflow: overFlow,
            maxLines: maxLines,
            style: AppTextStyle.panel_16_txt,
          ),
        ),
      ),
    );
  }
}
