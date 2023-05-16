import 'package:box_office_offline/model/dropItems.dart';
import 'package:box_office_offline/model/imagesData.dart';
import 'package:box_office_offline/providers/historyProvider.dart';
import 'package:box_office_offline/providers/dateAndTimeProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/ui/ListsFile.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/cutomDialogs/selectedDialogTimeAndProductprice/shopBrandDialog.dart';
import 'package:box_office_offline/ui/cutomDialogs/selectedDialogTimeAndProductprice/shopServiceDialog.dart';
import 'package:box_office_offline/ui/items/listItemColumn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ItemHistoryShop extends StatelessWidget {
  const ItemHistoryShop(
      {Key? key,
      required this.brandOrService,
      required this.items,
      required this.index})
      : super(key: key);
  final bool brandOrService;
  final ImagesData items;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProvidersClass>(builder: (context, providersClass, child) {
      return Consumer<HistoryProvider>(
          builder: (context, historyProvider, child) {
        return Consumer<DateAndTimeProvider>(
            builder: (context, dateProvider, child) {
              return Container(
                height: 64.sp,
                decoration: DecorationBox.allBoxDecoration,
                margin: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                child: Container(
                  decoration: BoxDecoration(borderRadius: RadiusBorder.radius_8),
                  child: Card(
                    shape: RadiusBorder.roundedRadius_8,
                    elevation: 0,
                    child: InkWell(
                      onTap: () {
                        historyProvider.increment();
                      },
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 2,
                              child: ListItemColumn(
                                  suffixText: "Предложение",
                                  index: 2,
                                  txt: items.title)),
                          items.brandOrService
                              ? Container()
                              : Container(
                            alignment: Alignment.center,
                            child: ClipOval(
                              child: SizedBox(
                                  height: 40.sp,
                                  width: 40.sp,
                                  child: Image.network(
                                    returnImg(items),
                                    fit: BoxFit.fitHeight,
                                  )),
                            ),
                          ),
                          SizedBox.square(
                            child: Row(
                              children: [
                                Container(
                                    alignment: Alignment.center,
                                    child: ListItemColumn(
                                        suffixText: "Един.из.",
                                        index: 2,
                                        txt: items.brandOrService.toString())),
                                Container(
                                  alignment: Alignment.center,
                                  child: ListItemColumn(
                                      suffixText: "Кол-во",
                                      index: 2,
                                      txt: items.counts.toString()),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  width:
                                  MediaQuery.of(context).size.width * 0.115,
                                  child: ListItemColumn(
                                      suffixText: "Цена",
                                      index: 1,
                                      txt: returnPrice(items.price, items.counts)),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(right: 10, left: 10),
                              alignment: Alignment.centerRight,
                              height: 25,
                              width: 25,
                              child: MaterialButton(
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  onPressed: () {
                                    // historyProvider.increment();
                                    // context.read<ProvidersClass>().clicedtolist;
                                    dateProvider.clearDayAndTimeList();
                                    shopdialogOpen(
                                      providersClass
                                          .imglistshop[index].brandOrService,
                                      context,
                                    );
                                    dateProvider
                                        .goodslist(providersClass.imglistshop);
                                    dateProvider.timelist(10);
                                    dateProvider.daylist();
                                    dateProvider.getDayAndTime();
                                  },
                                  child: Image.asset(
                                    "assets/scan-barcode.png",
                                    color: Colors.grey.withOpacity(1.0),
                                  ))),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
      });
    });
  }
  // sortList(List<DropItems> list){
  //   list.sort((a, b){return
  //     // a.toString()==list[0].title.compareTo(b.toString());
  //   });
  //
  // }
  String returnImg(ImagesData items) {
    String itemUrl="";
    var indexDoc = -1;
    for (var i = 0; i < profAccaunts.length; i++) {
      if (profAccaunts[i].id == items.doctorId) {
        indexDoc = i;
      }
    }
    if (indexDoc == -1) {
      debugPrint('Not Found or no Doctor id');
    } else {
      itemUrl = profAccaunts[indexDoc].url!;
    }
    return itemUrl;
  }
  returnPrice(price,count){
    return price*count;
  }

  void shopdialogOpen(brandOrService, context) {
    if (brandOrService == false) {
      ShopServiceDialog.serviceDialog(context);
    } else {
      ShopBrandDialog.brandDialog(context);
    }
  }
}
