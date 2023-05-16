
import 'package:box_office_offline/providers/historyProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/ui/ListsFile.dart';
import 'package:box_office_offline/ui/colors/myColors.dart';
import 'package:box_office_offline/ui/items/itemsCardShoping/itemHistoryShop.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../model/dropItems.dart';


class ListShopingHistoryWidget {
  ListShopingHistoryWidget._();

  static Container returnlisthistoryshop(context, List imglistshop) {
    return Container(
      // list shop
        padding: EdgeInsets.fromLTRB(15, 10.sp, 10, 0),
        child:
        Consumer<ProvidersClass>(builder: (context, providersClass, child) {
          return Consumer<HistoryProvider>(
              builder: (context, historyProviders, child) {
                return Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.all(5.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                Image.asset("assets/storis-shop.png",
                                  color: Colors.blue,),
                                SizedBox(width: 8.sp,),
                                Text("История: ${imglistshop
                                    .length}, последний: ${imglistshop[0]
                                    .data}", style: AppTextStyle.blue_13_txt,)
                              ],
                            ),
                          ),
                          PopupMenuButton(
                            offset: Offset(0, 45), // SET THE (X,Y) POSITION
                            iconSize: 30,
                            icon:Image.asset("assets/sort-shop.png",color: Colors.blue,),
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  enabled: false,
                                  onTap: (){


                                  },// THIS ITEM
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children:
                                      providersClass.filterHistoryList.map((value) {
                                        return SizedBox(
                                          height: 50,
                                          child: InkWell(
                                            splashColor: Colors.grey,
                                            onTap: (){
                                              providersClass
                                                  .setFilterHistoryId(value.id);
                                              Navigator.pop(context);
                                              },
                                            child: Row(
                                              children: [
                                                Image.asset(value.icon==true?"assets/check-circle_drop.png":value.icon==false?"assets/no_check_circle_drop.png":value.icon,color: value.icon?AppColor.panelBlack:AppColor.grey,),
                                                SizedBox(width: 8.sp,),
                                                Text(value.title,style: value.textStyle,),
                                              ],
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      // WRITE YOUR CODE HERE
                                  ),
                                ),
                              ];
                            },
                          ),
                          // SizedBox(
                          //   child: IconButton(
                          //     onPressed: () {
                          //       showMenu(context: context,
                          //         position: RelativeRect.fromLTRB(MediaQuery
                          //             .of(context)
                          //             .size
                          //             .height, 120.sp,
                          //             20.sp, MediaQuery
                          //                 .of(context)
                          //                 .size
                          //                 .width),
                          //         items: filterHistoryList.map((e) =>)
                          //             .toList(),);
                          //     },
                          //     icon: Image.asset(
                          //       "assets/sort-shop.png", color: Colors.blue,),
                          //   ),
                          // )
                        ],),
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                        primary: false,
                        itemCount: providersClass.imglistshop.length,
                        itemBuilder: (BuildContext ctx, int index) {
                          return ItemHistoryShop(
                              brandOrService: providersClass.imglistshop[index]
                                  .brandOrService,
                              items: providersClass.imglistshop[index],
                              index: index);
                        },
                      ),
                    ),
                  ],
                );
              });
        }));
  }

}

