
import 'package:box_office_offline/providers/historyProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/ui/items/itemsCardShoping/itemCardShop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


class ListShopingCartWidget extends StatelessWidget{
  const ListShopingCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProvidersClass>(builder:(context,providersClass,child) {
      return Consumer<HistoryProvider>(builder:(context,historyProvider,child) {
        return
          Container(
            padding: EdgeInsets.fromLTRB(15, 10.sp, 10, 0),
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
              primary: false,
              itemCount: providersClass.imglistshop.length,
              itemBuilder: (BuildContext ctx, int index) {
                return ItemCardShop(brandOrService: providersClass.imglistshop[index].brandOrService,
                  items: providersClass.imglistshop[index],
                  index: index,);
              },
            ),
          );
      });
    });
  }
}