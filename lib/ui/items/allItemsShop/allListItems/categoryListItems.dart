import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/ui/ListsFile.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/items/allItemsShop/allListItems.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CategoryListItems extends StatelessWidget {
  const CategoryListItems({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Consumer<ProvidersClass>(builder: (context, providersClass, child) {
      return Consumer<PanelProvider>(builder: (context, panelProvider, child) {
        return Container(
          margin: EdgeInsets.only(left: 3.sp,right: 3.sp,top:3.sp),
          decoration: panelProvider.itemstf?DecorationBox.allBoxDecorationBorderRed:DecorationBox.allBoxDecoration,
          child: MaterialButton(
              padding: EdgeInsets.zero,
              height:widthToHeight(width, height)?height*0.35:height*0.5,
              shape: RadiusBorder.roundedRadius_8,
              onPressed: () {
                panelProvider.itemsTf();
              },
              child: Column(
                children: [
                  returnImg(imageDList[index].url,context),
                  Expanded(
                    child: Container(
                      padding:
                      const EdgeInsets.fromLTRB(15, 16, 5, 10),
                      width: double.maxFinite,
                      child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.end,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                  "${index + 1} => ${providersClass.searchtf ? imageDList[index].title : providersClass.imageSearchList[index].title}",
                                  style: AppTextStyle.panel_17h_txt,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  maxLines: 3),
                            ),
                            Row(children: [
                              Text(
                                "Позиции внутри: ",
                                style: AppTextStyle.grey_12_txt,
                              ),
                              Text(
                                "${providersClass.searchtf ? imageDList[index].price : providersClass.imageSearchList[index].price}",
                                style: AppTextStyle.success_12_txt,
                              ),
                            ]),
                          ]),
                    ),
                  ),
                ],
              )),
        );
    });
    });
  }
}
