import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/ui/ListsFile.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/items/allItemsShop/allListItems.dart';
import 'package:box_office_offline/ui/returnWidgets/topContainer.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {

  bool searchtf = true;
  bool backtf = false;
  String tvText = "";
  String tvText2 = "";
  bool lottietf = true;

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
        return Consumer<PanelProvider>(builder: (context, panelProviders, child) {
          return Container(
            color: Colors.white,
            height: double.maxFinite,
            width: double.maxFinite,
            padding: EdgeInsets.only(left: 16.sp,top: 16.sp,right: providersClass.visible?20.sp:64.sp),
            child: Column(
              children: [
                TopContainer(
                  providers: panelProviders, providersClass: providersClass,index: 1,),
                Expanded(
                    child: lottietf
                        ? Container(
                        padding: EdgeInsets.only(top:10.sp,),
                        //     providersClass.visible ? 30 : 60, 10),
                        child: panelProviders.row_vectortfCtg
                            ? AllListItems(indexWidget: 3,imageDList: imageDList,imageSearchList: imageDList,)
                            : ListView.builder(
                          shrinkWrap: true,
                          itemCount: searchtf
                              ? imageDList.length
                              : imageDList.length,
                          itemBuilder:
                              (BuildContext ctx, int index) {
                            return Container(
                              margin: EdgeInsets.only(left: 3.sp,right: 3.sp,top:8.sp),
                              decoration: DecorationBox.allBoxDecoration,
                              child: MaterialButton(
                                padding: EdgeInsets.all(8.sp),
                                onPressed: () {},
                                shape: RadiusBorder.roundedRadius_8,
                                height: 64.sp,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 48.sp,
                                      width: 48.sp,
                                      child: ClipRRect(
                                          borderRadius:
                                          RadiusBorder.radius_8,
                                          // decoration: BoxDecoration(
                                          //     borderRadius: BorderRadius.circular(10)),
                                          child: Image.network(
                                            searchtf
                                                ? imageDList[index].url
                                                : imageDList[index].url,
                                            height: 48.sp,
                                            width: 48.sp,
                                          )),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            15, 0, 10, 0),
                                        child: Text(
                                            searchtf
                                                ? imageDList[index].title
                                                : imageDList[index].title,
                                            style: AppTextStyle.black_18_txt,
                                            textAlign:
                                            TextAlign.start,
                                            overflow: TextOverflow
                                                .ellipsis,
                                            maxLines: 1),
                                      ),
                                    ),
                                    Container(
                                      alignment:
                                      Alignment.centerRight,
                                      margin: const EdgeInsets
                                          .fromLTRB(10, 0, 10, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Позиции внутри: ",
                                            style: AppTextStyle.grey_12_txt,
                                          ),
                                          Text(
                                            "${searchtf ? imageDList[index].price : imageDList[index].price} шт",
                                            style:
                                            AppTextStyle.success_12_txt,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ))
                        : Container(
                      alignment: Alignment.center,
                      child: Lottie.asset(
                          'assets/astronaut-with-space-shuttle.json'),
                    )),
              ],
            ),
          );
        });
      }),
    );
  }
}
