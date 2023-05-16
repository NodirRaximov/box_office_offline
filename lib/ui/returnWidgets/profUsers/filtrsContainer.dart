import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/providers/registerProviders.dart';
import 'package:box_office_offline/ui/ListsFile.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/returnWidgets/containerLines.dart';
import 'package:box_office_offline/ui/returnWidgets/dropDownItemsShadow.dart';
import 'package:box_office_offline/ui/text/textFormFieldes.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FiltresContainer extends StatelessWidget {
  const FiltresContainer({Key? key,
    required this.filtrOne,
    required this.filtrTwo,
    required this.filtrThree,
    required this.filtrFour})
      : super(key: key);

  final String filtrOne;
  final String filtrTwo;
  final String filtrThree;
  final String filtrFour;

  @override
  Widget build(BuildContext context) {
    return Consumer<PanelProvider>(builder: (context, panelProvider, child) {
      return Consumer<ProvidersClass>(
          builder: (context, providersClass, child) {
        return Consumer<RegisterProviders>(
            builder: (context, registerProvider, child) {
          return Container(
            decoration: DecorationBox.allBoxDecoration,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10.sp),
                  child: Align(
                    alignment: Alignment.topLeft,

                    child: TextFormFiledes(
                      labelTx: "Login",
                      keyType: TextInputType.text,
                      textController: TextEditingController(),
                      providers: providersClass,
                      height: 48.sp,
                      width: 240.sp,
                      edgeInsets: const EdgeInsets.fromLTRB(20, 10, 30, 10),
                      obScuereText: false,
                      suffixIconStart: 'assets/search_of_on.png',
                      formater: registerProvider.maskText,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top:10.sp,bottom: 10.sp,right: 10.sp),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          DropDownItemsShadow(list: statusList,
                              icon: "assets/arrow-down.png",
                              hintText: filtrOne,
                              providerText: "",
                              onChanged: (value){
                            providersClass.setregiondrop(value);
                              },
                          ),
                          DropDownItemsShadow(list: statusList,
                            icon: "assets/arrow-down.png",
                            hintText: filtrTwo,
                            providerText: "",
                            onChanged: (value){
                              providersClass.setregiondrop(value);
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          DropDownItemsShadow(list: statusList,
                            icon: "assets/arrow-down.png",
                            hintText: filtrThree,
                            providerText: "",
                            onChanged: (value){
                              providersClass.setregiondrop(value);
                            },
                          ),
                          ContainerLines(
                            widtht: 210,
                            height: 48.sp,
                            index: -1,
                            decorationBox: DecorationBox.allBoxDecoration,
                            margin:const EdgeInsets.all(10),
                            sufIcon: "",
                            btnImg: "assets/calendar-edit.png",
                            hintText: providersClass.dateOk=="00/00/0000"?filtrFour:providersClass.dateOk,
                            textStyle: providersClass.dateOk=="00/00/0000"?AppTextStyle.grey_16_txt:AppTextStyle.grey_16_txt,
                            onPressed: (){
                              providersClass.selectDatePicker(context);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
      });
    });
  }
}
