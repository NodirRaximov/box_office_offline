import 'package:box_office_offline/model/dropItems.dart';
import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/ui/ListsFile.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/buttons/material_buttons.dart';
import 'package:box_office_offline/ui/buttons/payButtons.dart';
import 'package:box_office_offline/ui/colors/myColors.dart';
import 'package:box_office_offline/ui/returnWidgets/dropDownItemsShadow.dart';
import 'package:box_office_offline/ui/returnWidgets/totalDiscount.dart';
import 'package:box_office_offline/ui/text/papTextFormFieldes.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ShowDialogPayShop extends StatelessWidget {
  const ShowDialogPayShop({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProvidersClass>(builder: (context, providersClass, child) {
      return Consumer<PanelProvider>(builder: (context, panelProvider, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 8.sp,
            ),
            PayTextFormField(
              height: 48.sp,
              img: "",
              text: "Название",
              obScuereText: false,
              formater: panelProvider.moneyFormater,
              styleTv: AppTextStyle.panel_17_txt,
              onChanded: (newText) {
                panelProvider.text = newText;
              },
            ),
            PayTextFormField(
              height: 48.sp,
              img: "",
              text: "Наличные",
              obScuereText: false,
              formater: panelProvider.moneyFormater,
              styleTv: AppTextStyle.panel_17_txt,
              onChanded: (newText) {
                panelProvider.text = newText;
              },
            ),
            PayTextFormField(
              height: 48.sp,
              img: "assets/uscard_img.png",
              text: "",
              obScuereText: false,
              formater: panelProvider.moneyFormater,
              styleTv: AppTextStyle.panel_17_txt,
              onChanded: (newText) {
                panelProvider.text = newText;
              },
            ),
            PayTextFormField(
              height: 48.sp,
              img: "assets/humocard_img.png",
              text: "",
              obScuereText: false,
              formater: panelProvider.moneyFormater,
              styleTv: AppTextStyle.panel_17_txt,
              onChanded: (newText) {
                panelProvider.text = newText;
              },
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.65,
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Row(
                children: [
                  const Expanded(
                      flex: 2,
                      child: Text(
                        textAlign: TextAlign.center,
                        "Аванс",
                        style: TextStyle(fontSize: 20),
                      )),
                  Expanded(
                    flex: 6,
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 5),
                      height: 60,
                      decoration: DecorationBox.payBoxDecotation,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(fontSize: 20),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  // Container(
                  //     width: 60.sp,
                  //     height: 60,
                  //     margin: const EdgeInsets.only(
                  //         left: 15, right: 15),
                  //     decoration: DecorationBox.allBoxDecoration,
                  //     child: TextButton(
                  //       style: ButtonStyle(
                  //           shape: MaterialStateProperty.resolveWith((states) =>
                  //               RoundedRectangleBorder(
                  //                   borderRadius: BorderRadius.circular(8)))),
                  //       onPressed: () {
                  //         panelProvider.itemsTf();
                  //       },
                  //       child: panelProvider.itemstf ? const Text(
                  //         "Скачать\nБланк", textAlign: TextAlign.center,) : Image
                  //           .asset(
                  //         "assets/doc_upload.png", width: 55.sp, height: 60,),
                  //     )
                  // ),
                  // Container(
                  //     alignment: Alignment.centerLeft,
                  //     height: 60,
                  //     width: MediaQuery
                  //         .of(context)
                  //         .size
                  //         .width * 0.13,
                  //     decoration: DecorationBox.allBoxDecoration,
                  //     child: TextButton(
                  //       onPressed: () {},
                  //       style: ButtonStyle(
                  //           padding: MaterialStateProperty.resolveWith((
                  //               states) => EdgeInsets.zero),
                  //           shape: MaterialStateProperty.resolveWith((states) =>
                  //               RoundedRectangleBorder(
                  //                   borderRadius: BorderRadius.circular(8)))),
                  //       child: Row(
                  //         children: [
                  //           Container(
                  //             width: 40,
                  //             margin: EdgeInsets.only(right: 5.sp),
                  //             alignment: Alignment.centerRight,
                  //             child: Image.asset(
                  //               "assets/doc_upload.png",
                  //               colorBlendMode: BlendMode.colorBurn,),
                  //           ),
                  //           Expanded(
                  //             child: Text("sdfs.jpeg",
                  //               style: AppTextStyle.grey_14_txt,
                  //               overflow: TextOverflow.ellipsis,),
                  //           ),
                  //         ],
                  //       ),
                  //     )
                  // ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 10.sp, right: 5.sp),
              child: Row(
                children: [
                  Expanded(
                      child: PayButtons(
                    margin: EdgeInsets.all(5.sp),
                    padding: EdgeInsets.only(left: 8.sp),
                    text: "  ",
                    onPressed: () {},
                    height: 60,
                    shape: RadiusBorder.roundedRadius_8,
                    decoration: DecorationBox.allBoxDecoration,
                    iconStart: "assets/add-circle.png",
                    startHeight: 26.sp,
                    startWidth: 26.sp,
                    startIconColor: Colors.blue,
                    iconEnd: "assets/anorbank_img.png",
                  )),
                  Expanded(
                      child: PayButtons(
                    margin: EdgeInsets.all(5.sp),
                    padding: EdgeInsets.only(left: 8.sp),
                    text: "CashBack",
                    textStyle: AppTextStyle.grey_24_txt,
                    onPressed: () {},
                    height: 60,
                    shape: RadiusBorder.roundedRadius_8,
                    decoration: DecorationBox.allBoxDecoration,
                    iconStart: "assets/add-circle.png",
                    startHeight: 26.sp,
                    startWidth: 26.sp,
                        iconEnd: "",
                    startIconColor: Colors.blue,
                  )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, left: 10.sp, right: 5.sp),
              child: Row(
                children: [
                  Expanded(
                    child: PayButtons(
                      margin: EdgeInsets.all(5.sp),
                      padding: EdgeInsets.only(left: 8.sp),
                      text: "Перевод",
                      textStyle: AppTextStyle.grey_24_txt,
                      onPressed: () {},
                      height: 60,
                      shape: RadiusBorder.roundedRadius_8,
                      decoration: DecorationBox.allBoxDecoration,
                      iconStart: "assets/add-circle.png",
                      startHeight: 26.sp,
                      startWidth: 26.sp,
                      startIconColor: Colors.blue,
                      iconEnd: "",
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  )
                ],
              ),
            ),
            ToTalDiscount(
                couponesShow: false, index: -1, providersClass: providersClass),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Expanded(child: DropDownItemsShadow(
                      list:statusList,
                      providerText: providersClass.statusDrop,
                      onChanged: (value){
                        providersClass.setStatusDrop(value);
                        setForIcon(statusList, value, providersClass, context);
                      },
                      hintText: "No Status",
                    icon: "assets/arrow-down.png",
                  )
                  ),
                  Expanded(child: DropDownItemsShadow(
                    list:providersClass.deliveryList,
                    providerText: providersClass.deliveryDrop,
                    iconColor: AppColor.panelBlack,
                    onChanged: (value){
                      providersClass.setDeliveryDrop(value);
                      setForIcon(providersClass.deliveryList, value, providersClass, context);
                    },
                    icon:"assets/arrow-down.png",
                    hintText: "Delivery",
                  )
                  ),

                  Expanded(
                    child: MaterialButtons(
                      gr: false,
                      gradientText: DecorationBox.gradientText,
                      padding: EdgeInsets.zero,
                      shape: RadiusBorder.roundedRadius_8,
                      height: 48.sp,
                      onPressed: () {
                        panelProvider.setMoneyPayButton();
                        // Navigator.pop(context);
                      },
                      text: "ОПЛАТИТЬ",
                      textStyle: AppTextStyle.white_13_txt_w5,
                      margin:
                           EdgeInsets.only(top: 5.sp, right: 10.sp,left: 10.sp),
                      decoration: DecorationBox.linerGradientShadow,
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      });
    });
  }
  void setForIcon(list,value,ProvidersClass providersClass,context){
    var id=-1;
    for(var e in list){
      if(e.title==value.toString()){
        id=e.id;
        // providersClass.toast(value.toString(), context, Colors.blue);
      }
    }
    if(id==-1){
      providersClass.toast("notFound",context,Colors.red);
    }else{
      // if(list==providersClass.deliveryList){
        providersClass.setIconDrop(id,context);
      // }

    }
  }
}
