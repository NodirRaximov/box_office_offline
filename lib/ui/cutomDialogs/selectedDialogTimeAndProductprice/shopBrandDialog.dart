import 'package:box_office_offline/providers/dateAndTimeProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ShopBrandDialog {
  ShopBrandDialog._();

  static brandDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Consumer<ProvidersClass>(
              builder: (context, providersClass, child) {
            return Consumer<DateAndTimeProvider>(
                builder: (context, dateProvider, child) {
              return AlertDialog(
                  title: SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Stack(children: [
                      const Positioned(
                          top: 8,
                          left: 1,
                          right: 1,
                          bottom: 1,
                          child: Text("Attributes",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 25))),
                      Positioned(
                          top: 0,
                          right: 2,
                          child: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                Navigator.pop(context);
                              }))
                    ]),
                  ),
                  content: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Row(children: [
                            Text("Surcharge: ",style: AppTextStyle.panel_16_txt,),
                            Container(
                                height: 48.sp,
                                width: 150.sp,
                                decoration: DecorationBox.linerGradientShadow,
                                child: MaterialButton(
                                    onPressed: () {},
                                    shape: RadiusBorder.roundedRadius_8,
                                    child: const Text(
                                      "20%",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                    )
                                )
                            )
                          ]),
                        ),
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                child: Text("Product price",style: AppTextStyle.panel_16_txt,)),
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            height: MediaQuery.of(context).size.height * 0.15,
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: GridView.builder(
                                scrollDirection: Axis.horizontal,
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 80,
                                        mainAxisSpacing: 2,
                                        crossAxisSpacing: 2,
                                        childAspectRatio: 2 / 8),
                                shrinkWrap: true,
                                itemCount: dateProvider.stockGoodsList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                      margin: const EdgeInsets.all(3),
                                      decoration: dateProvider.selectStockId == dateProvider.stockGoodsList[index].id
                                          ? DecorationBox.linerGradientShadow
                                          : BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  RadiusBorder.radius_8,
                                              boxShadow: [
                                                  ShadowBox.boxShadowOne
                                                ]),
                                      child: MaterialButton(
                                        elevation: 0,
                                        shape: RadiusBorder.roundedRadius_8,
                                        onPressed: () {
                                          dateProvider.selectStockGoods(dateProvider.stockGoodsList[index].id);
                                        },
                                        child: Text(dateProvider.stockGoodsList[index].stock,
                                            style: TextStyle(
                                                color: dateProvider.selectStockId == dateProvider.stockGoodsList[index].id
                                                    ? Colors.white
                                                    : Colors.black87)),
                                      ));
                                })),
                        Container(
                          alignment: Alignment.center,
                          child: Container(
                              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              height: 40.sp,
                              width: 120.sp,
                              decoration: DecorationBox.linerGradientShadow,
                              child: MaterialButton(
                                  shape: RadiusBorder.roundedRadius_5,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Tanlash",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white)))),
                        )
                      ])));
            });
          });
        });
  }
}
