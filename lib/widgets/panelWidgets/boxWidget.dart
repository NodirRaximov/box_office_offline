import 'package:box_office_offline/model/imagesData.dart';
import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/ui/ListsFile.dart';
import 'package:box_office_offline/ui/cutomDialogs/aboutHistoryShop.dart';
import 'package:box_office_offline/ui/cutomDialogs/aboutScanBarDialog.dart';
import 'package:box_office_offline/ui/items/allItemsShop/allLineListItems.dart';
import 'package:box_office_offline/ui/items/allItemsShop/allListItems.dart';
import 'package:box_office_offline/ui/returnWidgets/topContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class BoxWidget extends StatefulWidget {
  const BoxWidget({Key? key}) : super(key: key);

  @override
  State<BoxWidget> createState() => _BoxWidgetState();
}
bool dialogshow = false;



class _BoxWidgetState extends State<BoxWidget> {
  String tvText2 = "";
  bool lottietf = true;
  late bool shimmerTf;
  late List<ImagesData> imgDlist;

  @override
  void initState() {
    super.initState();
    shimmerTf=true;
    Future.delayed(const Duration(seconds: 2));
    loadData();
    shimmerTf=false;
  }

  Future loadData()async{
    imgDlist=List.of(imageDList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Consumer<ProvidersClass>(builder: (context, providersClass, child) {
        return Consumer<PanelProvider>(builder: (context, panelProviders, child) {
          return GestureDetector(
            onTap: (){
              panelProviders.setFalseMoneyPayButton();
              providersClass.setShowContainer(context);
            },
            child: Stack(
              children: [
                Container(
                  color: Colors.white,
                  height: double.maxFinite,
                  width: double.maxFinite,
                  padding: EdgeInsets.only(left: 16.sp,top: 16.sp,right: providersClass.visible?20.sp:64.sp),
                  child: Column(
                    children: [
                      TopContainer(
                        providers: panelProviders, providersClass: providersClass,index: 1,rowIndex: 1,),
                      Expanded(
                          child: lottietf
                              ? Container(
                                  padding: EdgeInsets.only(top: 10.sp),
                                  child: panelProviders.row_vectortfbox
                                      ? AllListItems(indexWidget: 1,imageDList: imageDList,imageSearchList: providersClass.imageSearchList,)
                                      : AllLineListItems(indexWidget: 1,imageDList: imageDList,imageSearchList: providersClass.imageSearchList,)
                              )
                              : Container(
                            alignment: Alignment.center,
                            child: Lottie.asset(
                                'assets/astronaut-with-space-shuttle.json'),
                          )),
                    ],),
                ),
                const AboutScanBarDialog(),
                const AboutHistoryShop()
              ],),
          );
        });
      }),
    );
  }

  Widget makeDismissible(
      {required Widget child, required BuildContext context}) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => dialogshow = false,
      child: GestureDetector(
          child: child,
          onTap: () {
            dialogshow = false;
          }),
    );
  }

}
