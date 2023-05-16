import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/ui/ListsFile.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfLineListItems extends StatelessWidget {
  const ProfLineListItems({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProvidersClass>(builder: (context, providersClass, child) {
      return Consumer<PanelProvider>(builder: (context, panelProvider, child) {
        return Container(
          margin: EdgeInsets.only(top: 3.sp, left: 3.sp, right: 3.sp),
          decoration: panelProvider.itemstf
              ? DecorationBox.allBoxDecorationBorderRed
              : DecorationBox.allBoxDecoration,
          child:
              Consumer<PanelProvider>(builder: (context, panelProvider, child) {
            return Consumer<ProvidersClass>(
                builder: (context, providersClass, child) {
              return MaterialButton(
                padding: EdgeInsets.only(left: 8.sp),
                shape: RadiusBorder.roundedRadius_8,
                onPressed: () {
                  panelProvider.itemsTf();
                  panelProvider.aboutScanBar();
                },
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          height: 35.sp,
                          width: 35.sp,
                          decoration: BoxDecoration(
                              borderRadius: RadiusBorder.radius_6,
                              image: DecorationImage(
                                image: NetworkImage(imageDList[index].url),
                                fit: BoxFit.cover,
                              )),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                            width: double.maxFinite,
                            height: 100,
                            child: SingleChildScrollView(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "${index + 1} => ${imageDList[index].title}",
                                        style: AppTextStyle.panel_17_txt,
                                        textAlign: TextAlign.start,
                                        maxLines: 1),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 15, 3),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "В наличии: ",
                                                  style:
                                                      AppTextStyle.grey_13_txt,
                                                ),
                                                Text(
                                                  "${imageDList[index].counts}",
                                                  style:
                                                      AppTextStyle.blue_13_txt,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 15, 3),
                                            child: Row(
                                              children: [
                                                Text("Срок годности: ",
                                                    style: AppTextStyle
                                                        .grey_13_txt),
                                                Text(imageDList[index].data,
                                                    style: panelProvider.itemstf
                                                        ? AppTextStyle
                                                            .red_13_txt
                                                        : AppTextStyle
                                                            .grey_13_txt),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 15, 3),
                                            child: Text(
                                                "Страна: ${imageDList[index].queue}",
                                                style:
                                                    AppTextStyle.grey_13_txt),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text("Место: ${imageDList[index].queue}",
                                        style: AppTextStyle.grey_13_txt),
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 55,
                      bottom: providersClass.visible ? 8 : 10,
                      child: Container(
                        margin: const EdgeInsets.only(left: 5),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Text(
                              "${"${imageDList[index].price.toString().substring(0, 3)} ${imageDList[index].price.toString().substring(3)}"} 00 000 ",
                              style: AppTextStyle.panel_16_txt,
                            ),
                            Text(
                              "UZS",
                              style: AppTextStyle.grey_14_txt,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 3,
                      right: 3,
                      child: SizedBox(
                        height: 38.sp,
                        width: 38.sp,
                        child: TextButton(
                          onPressed: () {
                            if (imageDList[index].img ==
                                "assets/shoppingOpenCardBtn.png") {
                              providersClass.countdeletshopbox(
                                  index,
                                  imageDList[index].id,
                                  false);
                              providersClass.listprise();
                              // if(countshop==0) {
                              //   providersClass.shopCartTf(false);
                              //   // shopcarttf=false;
                              // }
                            } else {
                              imageDList[index].img =
                                  "assets/shoppingOpenCardBtn.png";
                              providersClass.countAddShop(
                                  index,
                                 false,
                                  panelProvider);
                              providersClass.listprise();
                            }
                          },
                          child: Image.asset(
                            imageDList[providersClass.shopIndex != -1
                                    ? providersClass.shopIndex == index
                                        ? providersClass.shopIndex
                                        : index
                                    : index]
                                .img
                                .toString(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            });
          }),
        );
      });
    });
  }
}
