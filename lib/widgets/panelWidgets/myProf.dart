import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/buttons/iconsButtons.dart';
import 'package:box_office_offline/ui/items/profMoneyItems.dart';
import 'package:box_office_offline/ui/returnWidgets/myProfile/profInfoWidgetIsClose.dart';
import 'package:box_office_offline/ui/returnWidgets/myProfile/profInfoWidgetIsOpen.dart';
import 'package:box_office_offline/ui/returnWidgets/profBrandAndService/statisticProfBrand.dart';
import 'package:box_office_offline/ui/returnWidgets/profUsers/profUsers.dart';
import 'package:box_office_offline/ui/returnWidgets/myProfile/ratingAndDetails.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyProf extends StatefulWidget {
  const MyProf({Key? key}) : super(key: key);

  @override
  State<MyProf> createState() => _MyProfState();
}

class _MyProfState extends State<MyProf> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(body:
          Consumer<ProvidersClass>(builder: (context, providersClass, child) {
        return Consumer<PanelProvider>(
            builder: (context, panelProvider, child) {
          return Container(
            color: Colors.white,
            padding: EdgeInsets.only(left: 16.sp, top: 45.sp, right: 20.sp),
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TabBar(
                      controller: controller,
                      isScrollable: true,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      tabs: const [
                        Tab(
                          child: Text(
                            'Мой профил',
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Статистика',
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Клиенть',
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Товары',
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Рейтинг лучших',
                          ),
                        ),
                      ],
                    ),
                    IconsButtons(
                      onPressed: () {},
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
                Container(
                  margin: EdgeInsets.only(left: 5.sp,right: 5.sp),
                  height: 1,
                  color: Colors.grey,
                  width: MediaQuery.of(context).size.width,
                ),
                const SizedBox(
                  height: 21,
                ),
                Expanded(
                  child: TabBarView(
                    physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
                    controller: controller,
                    children: [
                      SingleChildScrollView(
                        child: Column(children: [
                          Row(
                            children: [
                              Expanded(
                                  child: ListTile(
                                title: Text(
                                  "  Мой профиль",
                                  style: AppTextStyle.black_18_txt,
                                ),
                                contentPadding: EdgeInsets.zero,
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/balles_icon.png',
                                      height: 24.sp,
                                      width: 24.sp,
                                    ),
                                    SizedBox(
                                      width: 5.sp,
                                    ),
                                    Text(
                                      "566 balls",
                                      style: AppTextStyle.panel_17_txt,
                                    ),
                                    SizedBox(
                                      width: 32.sp,
                                    ),
                                  ],
                                ),
                              )),
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
                                price: "23 000 000 UZS",
                                percentage: "+14%",
                                decoration: DecorationBox.linerGradientDebt,
                              ),
                              MoneyItemsProf(
                                  text: "Harajatim",
                                  icon: "assets/monmey_costs.png",
                                  price: "54 566 500 UZS",
                                  percentage: "+14%",
                                  decoration: DecorationBox.linerGradientCosts),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left:8,right:8,top: 10.sp),
                            decoration: DecorationBox.allBoxDecoration,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            child: AnimatedSize(
                              alignment: Alignment.topCenter,
                              curve: Curves.easeIn,
                              duration: const Duration(milliseconds: 450),
                              child: panelProvider.isOpenProfInfo
                                  ?const ProfInfoWidgetIsOpen(profid: 1)
                                  :const ProfInfoWidgetIsClose(),
                            ),
                          ),
                          SizedBox(height: 20.sp,),
                          Row(children: [
                            RatingAndDetails(flex: 4, text: "Мой рейтинг", onPressed: (){},tf: true,),
                            RatingAndDetails(flex: 6, text: "Детали", onPressed: (){},tf:false),
                          ],),
                          SizedBox(height:20.sp)
                        ]),
                      ),
                      Text(
                        'Статистика',
                        style: AppTextStyle.panel_14_txt,
                      ),
                     const ProfUsers(),
                      const StatisticProfBrand(),
                      const Text('Рейтинг лучших'),
                    ],
                  ),
                ),
              ],),
          );
        });
      }));
}
