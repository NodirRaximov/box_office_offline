
import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/items/allItemsShop/allListItems.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfListItems extends StatelessWidget {
  const ProfListItems({Key? key,required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Consumer<ProvidersClass>(builder: (context, providersClass, child) {
      return Consumer<PanelProvider>(builder: (context, panelProvider, child) {
        return Container(
          margin: EdgeInsets.only(left: 3.sp,top:3.sp,right: 3.sp),
          decoration: panelProvider.itemstf?DecorationBox.allBoxDecorationBorderRed:DecorationBox.allBoxDecoration,
          child: MaterialButton(
              height: widthToHeight(width, height)?height*0.3:height*0.4,
              padding: EdgeInsets.zero,
              shape: RadiusBorder.roundedRadius_8,
              onPressed: () {
                panelProvider.itemsTf();
                panelProvider.accauntidTf(false);
                panelProvider.profOid(panelProvider.searchtf? ("$index ${providersClass.profAccaunt[index].name} ${providersClass.profAccaunt[index].lastname} ${providersClass.profAccaunt[index].surname}"):
                ("$index ${providersClass.profSearchAccaunt[index].name} ${providersClass.profSearchAccaunt[index].lastname} ${providersClass.profSearchAccaunt[index].surname}"),providersClass.profAccaunt[index].id);
              },
              child: Column(children: [
                Container(
                    margin:const EdgeInsets.fromLTRB(10, 15, 10, 0),
                    height: 114.sp,
                    width: 114.sp,
                    child:ClipOval(child:Image.network("${panelProvider.searchtf?providersClass.profAccaunt[index].url:providersClass.profSearchAccaunt[index].url}",fit:BoxFit.cover))
                ),
                Expanded(
                  child: Container (
                    padding:const EdgeInsets.fromLTRB(10, 15, 5, 10),
                    width:double.maxFinite,
                    child: SingleChildScrollView(
                      child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${panelProvider.searchtf? ("${providersClass.profAccaunt[index].name} ${providersClass.profAccaunt[index].lastname} ${providersClass.profAccaunt[index].surname}"):
                            ("${providersClass.profSearchAccaunt[index].name} ${providersClass.profSearchAccaunt[index].lastname} ${providersClass.profSearchAccaunt[index].surname}")} ",
                                style: AppTextStyle.panel_16_txt_h,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                maxLines: 2),
                            Container(
                              padding:const EdgeInsets.fromLTRB(0, 5, 0, 4),
                              child: Text(
                                "${panelProvider.searchtf? providersClass.profAccaunt[index].position:providersClass.profSearchAccaunt[index].position}",
                                style: AppTextStyle.grey_13_txt,
                              ),
                            ),
                            Container(
                              padding:const EdgeInsets.fromLTRB(0, 4, 0, 4),
                              child: Row(
                                  children: [
                                    Text("Qabul: ",style: AppTextStyle.grey_13_txt),
                                    Text(
                                      "${panelProvider.searchtf? providersClass.profAccaunt[index].reception:providersClass.profSearchAccaunt[index].reception}",
                                      style: AppTextStyle.grey_13_txt,
                                    ),
                                    Text(
                                      " (${panelProvider.searchtf? providersClass.profAccaunt[index].queue:providersClass.profSearchAccaunt[index].queue})",
                                      style: AppTextStyle.blue_13_txt,
                                    ),
                                  ]),
                            ),
                            Container(
                              padding:const EdgeInsets.fromLTRB(0, 4, 0, 0),
                              child: Row(
                                  children: [
                                    Text("Ish vaqti: ",style: AppTextStyle.grey_13_txt),
                                    Text(
                                      "${panelProvider.searchtf? providersClass.profAccaunt[index].timeWork:providersClass.profSearchAccaunt[index].timeWork}",
                                      style: AppTextStyle.success_13_txt,
                                    ),
                                  ]),
                            ),
                          ]),
                    ),
                  ),
                ),
              ],)
          ),
        );
    });
    });
  }
}
