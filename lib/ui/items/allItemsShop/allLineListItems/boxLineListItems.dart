import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/ui/ListsFile.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BoxLineListItems extends StatelessWidget {
  const BoxLineListItems({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProvidersClass>(builder: (context, providersCLass, child) {
      return Consumer<PanelProvider>(builder: (context, panelProvider, child) {
        return Container(
          margin: EdgeInsets.only(top: 3.sp, left: 3.sp, right: 3.sp),
          decoration: DecorationBox.allBoxDecoration,
          height: double.maxFinite,
          width: double.maxFinite,
          child: Consumer<PanelProvider>(
              builder: (context, panelProvider, child) {
                return Consumer<ProvidersClass>(
                    builder: (context, providersClass, child) {
                      return MaterialButton(
                        padding: const EdgeInsets.only(left: 10),
                        shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        onPressed: () => panelProvider.aboutScanBar(),
                        child: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage(imageDList[index].url),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(5, 0 , 5, 0),
                                    width: double.maxFinite,
                                    child: SingleChildScrollView(
                                      child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            retunrNoShimmerText("${index + 1} => ${imageDList[index].title}", AppTextStyle.black_18_txt, "", null),
                                            SizedBox(height: 5.sp,),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: [
                                                  retunrNoShimmerText( "В наличии: ", AppTextStyle.grey_13_txt, "${imageDList[index].counts}", AppTextStyle.success_13_txt),
                                                  SizedBox(width: 5.sp,),
                                                  retunrNoShimmerText( "Срок годности: ${imageDList[index].data}",AppTextStyle.grey_13_txt, "",null),
                                                  SizedBox(width: 5.sp,),
                                                  retunrNoShimmerText( "Страна: ${imageDList[index].queue}",AppTextStyle.grey_13_txt, "",null),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 5.sp,),
                                            retunrNoShimmerText( "Место: ${imageDList[index].queue}",AppTextStyle.grey_13_txt, "",null),
                                          ]),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  retunrNoShimmerText(imageDList[index].price.toString(), AppTextStyle.panel_16_txt, ' UZS', AppTextStyle.grey_16_txt),
                                  Container(height: 30.sp,width: 30.sp,
                                      margin: const EdgeInsets.only(right: 5),
                                      child: TextButton(onPressed: (){
                                        if(imageDList[index].img=="assets/shoppingOpenCardBtn.png"){
                                          providersClass.countdeletshopbox(index, imageDList[index].id,true);
                                          providersClass.listprise();
                                          // if(countshop==0) {
                                          //   providersClass!.shopCartTf(false);
                                          //   // shopcarttf=false;
                                          // }
                                        }else{
                                          imageDList[index].img="assets/shoppingOpenCardBtn.png";
                                          providersClass.countAddShop(index,true,panelProvider);
                                          providersClass.listprise();
                                        }
                                      },
                                        child: Image.asset(imageDList[providersClass.shopIndex!=-1?providersClass.shopIndex==index?providersClass.shopIndex:index:index].img.toString()),)
                                  )
                                ],),
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
  retunrNoShimmerText(txt,textStyle,String? subtitle,TextStyle? subtitleStyle) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          txt,
          style: textStyle,
          maxLines: 1,textAlign: TextAlign.start,
        ),
        Text(
          subtitle!,
          style: subtitleStyle,
        ),
      ],
    );
  }
}
