import 'package:box_office_offline/model/imagesData.dart';
import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/ui/ListsFile.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/colors/myColors.dart';
import 'package:box_office_offline/ui/cutomDialogs/aboutHistoryShop.dart';
import 'package:box_office_offline/ui/cutomDialogs/aboutScanBarDialog.dart';
import 'package:box_office_offline/ui/items/allItemsShop/allLineListItems.dart';
import 'package:box_office_offline/ui/items/allItemsShop/allListItems.dart';
import 'package:box_office_offline/ui/returnWidgets/topContainer.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ProfWidget extends StatefulWidget {
  const ProfWidget({Key? key}) : super(key: key);

  @override
  State<ProfWidget> createState() => _ProfWidgetState();
}
List<ImagesData> imageSearchListProf=[];

class _ProfWidgetState extends State<ProfWidget> {


  bool widthToHeight(width,height){
    if(width-height<500){
      return true;
    }else{
      return  false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Consumer<ProvidersClass>(builder: (context, providersClass, child) {
        return Consumer<PanelProvider>(builder: (context, panelProvider, child) {
          return Stack(
            children: [
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(left: 16.sp,top: 16.sp,right: providersClass.visible?20.sp:64.sp),
                // color: const Color.fromRGBO(247, 248, 252, 1.0),
                height: double.maxFinite,
                width: double.maxFinite,
                child: Column(mainAxisSize: MainAxisSize.min,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                        child: Container(
                          alignment: Alignment.centerLeft,
                            width: providersClass.showcontext?MediaQuery.of(context).size.width*0.42:MediaQuery.of(context).size.width*0.81,
                            child: TopContainer(index: 2,providers: panelProvider,providersClass: providersClass,))),
                    if (panelProvider.accauntIdTf) Container() else
                      Container(
                        padding: const EdgeInsets.only(left: 15,),
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(children: [
                          Text(panelProvider.profOId,
                            style: AppTextStyle.panel_16_txt,
                          ),
                          MaterialButton(
                            shape: RadiusBorder.roundedRadius_5,
                            minWidth: 40,
                            onPressed: () {
                              panelProvider.accauntidTf(true);
                            },
                            child: Image.asset(
                                "assets/close-circle.png",
                                color: AppColor.grey),
                          )
                        ],),
                      ),
                    Expanded(
                        child: Container(
                          padding: EdgeInsets.only(top: 10.sp),
                          child: providersClass.lottietf
                              ?panelProvider.accauntIdTf==true
                              ?AllListItems(indexWidget: 2,imageDList: imageDListProf,imageSearchList: imageSearchListProf)
                              :panelProvider.accauntIdTf==false
                              ?AllLineListItems(indexWidget: 2,imageDList: imageDListProf,imageSearchList: imageSearchListProf)
                              :Container()
                              :Container(
                            alignment: Alignment.center,
                            child: Lottie.asset('assets/astronaut-with-space-shuttle.json'),
                          ),
                        )
                    ),
                  ],
                ),
              ),
              const AboutScanBarDialog(),
              const AboutHistoryShop()
            ],
          );
        });
      }),
    );
  }
}
