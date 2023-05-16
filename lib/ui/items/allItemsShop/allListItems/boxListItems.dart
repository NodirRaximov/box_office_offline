import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/ui/ListsFile.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/items/allItemsShop/allListItems.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BoxListItems extends StatelessWidget {
  const BoxListItems({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Consumer<ProvidersClass>(builder: (context, providersClass, child) {
      return Consumer<PanelProvider>(builder: (context, panelProviders, child) {
        return Container(
          margin: EdgeInsets.only(top: 3.sp,right: 3.sp,left:3.sp),
          decoration: panelProviders.itemstf?DecorationBox.allBoxDecorationBorderRed:DecorationBox.allBoxDecoration,
          child: Consumer<PanelProvider>(builder:(context,panelProvider,child){
            return MaterialButton(
              padding: EdgeInsets.zero,
              // padding:const EdgeInsets.fromLTRB(10,10,0,0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              onPressed: () { panelProvider.itemsTf();
                panelProvider.aboutScanBar();
              },
              child: Container(
                alignment: Alignment.topLeft,
                child: Stack(
                  children: [
                    SizedBox(
                      height: widthToHeight(width, height)?height*0.4:height*0.49,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            returnImg(imageDList[index].url,context),
                            Container (
                              padding:const EdgeInsets.fromLTRB(15, 0, 0, 0),
                              width:double.maxFinite,
                              child: Column(mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin:const EdgeInsets.fromLTRB(0,20,0,5),
                                      child: Text("${index + 1} => ${imageDList[index].title}",
                                          style: AppTextStyle.panel_17_txt,
                                          textAlign: TextAlign.start,
                                          maxLines: 1),
                                    ),
                                    Container(
                                      margin:const EdgeInsets.fromLTRB(0,0,0,5),
                                      child: Row(
                                        children: [
                                          Text(
                                            "В наличии: ",
                                            style: AppTextStyle.grey_13_txt,
                                          ),
                                          Text("${imageDList[index].counts} шт.",
                                            style: AppTextStyle.blue_13_txt,
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin:const EdgeInsets.fromLTRB(0,0,0,5),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            Text(
                                                "Срок годности: ",
                                                style: AppTextStyle.grey_13_txt
                                            ),
                                            Text(
                                                imageDList[index].data,
                                                style: panelProvider.itemstf?AppTextStyle.red_13_txt:AppTextStyle.grey_13_txt
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Text(
                                        "Место: ${imageDList[index].queue}",
                                        style: AppTextStyle.grey_13_txt
                                    ),
                                  ]),
                            ),
                          ],),
                      ),
                    ),
                    Positioned(
                        bottom: 8,
                        left: 14,
                        child: Row(
                          children: [
                            Text(
                              "${"${imageDList[index].price.toString().substring(0,3)} ${imageDList[index].price.toString().substring(3)}"} 00 ",
                              style: AppTextStyle.panel_17_txt,
                            ),
                            Text("UZS",style: widthToHeight(width, height)?AppTextStyle.grey_14_txt:AppTextStyle.grey_17_txt,)
                          ],
                        )),
                    Positioned(
                        bottom:5.h,
                        right: 3,
                        child: Container(height: 50,width: 50,
                            margin: const EdgeInsets.only(right: 5),
                            child: TextButton(onPressed: (){
                              if(imageDList[index].img=="assets/shoppingOpenCardBtn.png"){
                                providersClass.countdeletshopbox(index, imageDList[index].id,imageDList[index].brandOrService);
                                providersClass.listprise();
                                // if(countshop==0) {
                                //   providersClass.shopCartTf(false);
                                //   // shopcarttf=false;
                                // }
                              }else{
                                imageDList[index].img="assets/shoppingOpenCardBtn.png";
                                providersClass.countAddShop(index,true,context.read<PanelProvider>());
                                providersClass.listprise();
                              }
                            },
                              child: Image.asset(imageDList[providersClass.shopIndex!=-1?providersClass.shopIndex==index?providersClass.shopIndex:index:index].img.toString()),)
                        ))
                  ],
                ),
              ),
            );
          }),
        );
    });
    });
  }
}
