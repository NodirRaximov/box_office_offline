import 'package:box_office_offline/providers/historyProvider.dart';
import 'package:box_office_offline/providers/mainProviders.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/providers/registerProviders.dart';
import 'package:box_office_offline/ui/ListsFile.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/buttons/material_buttons.dart';
import 'package:box_office_offline/ui/colors/myColors.dart';
import 'package:box_office_offline/ui/returnWidgets/containerLines.dart';
import 'package:box_office_offline/ui/returnWidgets/registerUser/dropdownDialog/dropdownDilaog.dart';
import 'package:box_office_offline/ui/returnWidgets/registerUser/img/cameraButtonPicUser.dart';
import 'package:box_office_offline/ui/returnWidgets/registerUser/img/cameraButtonShowOrHide.dart';
import 'package:box_office_offline/ui/returnWidgets/registerUser/img/listFamilyUserImg.dart';
import 'package:box_office_offline/ui/text/textFormFieldes.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProviders>(
        builder: (context, registerProvider, child) {
      return Consumer<ProvidersClass>(
          builder: (context, providersClass, child) {
        return Consumer<HistoryProvider>(
            builder: (context, historyProviders, child) {
          return Consumer<MainProviders>(builder: (context, mainProv, child) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                providersClass.userBtnTf
                    ? Container(
                        margin: const EdgeInsets.fromLTRB(25, 15, 0, 0),
                        alignment: Alignment.topLeft,
                        child: providersClass.activBtn
                            ? Row(
                                children: [
                                  Image.asset("assets/storis-shop.png"),
                                  Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        "История визитов: ${providersClass.countshop}",
                                        style: AppTextStyle.grey_17_txt,
                                      )),
                                ],
                              )
                            : const Text(
                                "Registration new user",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.panelColorOne),
                              ),
                      )
                    : historyProviders.historyOfVisits == false
                        ? Container(
                            margin: const EdgeInsets.fromLTRB(20, 15, 0, 10),
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text(
                                      "Рекомендовано от: ${registerProvider.profaccauntAdd.name != null ? ("${registerProvider.profaccauntAdd.surname} ${registerProvider.profaccauntAdd.name}") : "Not User"}",
                                      style: AppTextStyle.grey_17_txt,
                                    )),
                                Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text(
                                      "дата ${registerProvider.profaccauntAdd.timeWork == null ? "Not Data" : "${registerProvider.profaccauntAdd.timeWork}"}",
                                      style: AppTextStyle.grey_17_txt,
                                    )),
                                Expanded(
                                    child: Container(
                                  alignment: Alignment.centerRight,
                                  width: 30,
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 30, 0),
                                  child: Image.asset(
                                    "assets/sort-shop.png",
                                    color: Colors.grey,
                                  ),
                                ))
                              ],
                            ))
                        : Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.fromLTRB(20, 15, 0, 10),
                            child: Text(
                              "История визитов: ${providersClass.countshop}",
                              style: AppTextStyle.grey_17_txt,
                            )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Container(
                      height: 48.sp,
                      margin:
                          const EdgeInsets.only(left: 20, top: 10, right: 20),
                      child: TextFormFiledes(
                        obScuereText: false,
                        hintTx: 'Phone or pasport JSHIR*',
                        styleTv: AppTextStyle.grey_16_txt,
                        onChanded: (newText) {
                          registerProvider.subscrib(
                              registerProvider.ind, newText);
                          providersClass.numberActiv(newText);
                        },
                        keyType: const TextInputType.numberWithOptions(
                            decimal: true),
                        textController: providersClass.numbertv != ""
                            ? TextEditingController(
                                text: providersClass.numbertv)
                            : null,
                        formater: registerProvider.numFirst.length > 12
                            ? registerProvider.maskFormaterPhone
                            : registerProvider.maskFormaterPassport,
                      ),
                    )),
                    providersClass.activBtn
                        ? MaterialButtons(
                            height: 48.sp,
                            width: 140.sp,
                            gr: true,
                            gradientText: DecorationBox.gradientText,
                            padding: EdgeInsets.zero,
                            textStyle: AppTextStyle.blue_color_16_txt,
                            text: " Изменить\nномер",
                            shape: RadiusBorder.roundedRadius_8,
                            decoration: DecorationBox.linerGradientShadow,
                            margin: const EdgeInsets.only(top: 10, right: 20),
                            onPressed: () {
                              providersClass.toast(
                                  'Phone Number', context, Colors.blue);
                            })
                        : MaterialButtons(
                            gr: false,
                            gradientText: DecorationBox.gradientText,
                            onPressed: () {
                              registerProvider
                                  .imgShowD(!registerProvider.showDImg);
                              providersClass.setSecond();
                              providersClass.startTime(true);
                              // mainProv.restart();
                            },
                            text: 'Активировать',
                            textStyle: AppTextStyle.white_16_txt_w4,
                            decoration: DecorationBox.linerGradientDecoration,
                            shape: RadiusBorder.roundedRadius_8,
                            width: 140.sp,
                            height: 48.sp,
                            margin: const EdgeInsets.only(
                              top: 10,
                              right: 20,
                            ),
                          ),
                  ],
                ),
                providersClass.activIconBtn
                    ? MaterialButtons(
                        gr: true,
                        gradientText: DecorationBox.gradientText,
                        text: "Mening shaxsiy akkauntimga qo'shish",
                        onPressed: () {},
                        margin: EdgeInsets.only(top: 20.sp),
                        shape: RadiusBorder.roundedRadius_8,
                        height: 48.sp,
                        padding: const EdgeInsets.only(left: 50, right: 50),
                        decoration: DecorationBox.linerGradientShadow,
                        textStyle: AppTextStyle.blue_16_txt,
                      )
                    :Container(),
                providersClass.activIconBtn
                    ? Container(
                        child:
                            Lottie.asset("assets/astronaut-in-tea-break.json"))
                    : Column(mainAxisSize: MainAxisSize.max, children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            /// list of user family pictures
                            const ListFamilyUserImg(),

                            /// camera button or picture of user
                            const CameraButtonPicUser(),
                            providersClass.picture != ""

                                /// camera button show or hide
                                ? const CameraButtonShowOrHide()
                                : Container(),
                          ],
                        ),

                        /// name and lastname of user
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextFormFiledes(
                                labelTx: "Name*",
                                height: 48.sp,
                                edgeInsets:
                                    const EdgeInsets.fromLTRB(20, 20, 20, 10),
                                obScuereText: false,
                                onChanded: (newText) {
                                  registerProvider.profName = newText;
                                  debugPrint(
                                      registerProvider.profName.toString());
                                },
                                keyType: TextInputType.text,
                                styleTv: AppTextStyle.grey_16_txt,
                                formater: registerProvider.maskText,
                              ),
                            ),
                            Expanded(
                              child: TextFormFiledes(
                                labelTx: "Surname*",
                                height: 48.sp,
                                styleTv: AppTextStyle.grey_16_txt,
                                edgeInsets:
                                    const EdgeInsets.fromLTRB(20, 20, 20, 10),
                                obScuereText: false,
                                onChanded: (newText) {
                                  registerProvider.profSurName = newText;
                                  debugPrint(
                                      registerProvider.profSurName.toString());
                                },
                                keyType: TextInputType.text,
                                formater: registerProvider.maskText,
                              ),
                            ),
                          ],
                        ),

                        /// age and gender of user
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  ContainerLines(
                                    sufIcon: "",
                                    height: 48.sp,
                                    margin: const EdgeInsets.fromLTRB(
                                        20, 10, 20, 10),
                                    btnImg: 'assets/calendar-edit.png',
                                    hintText: providersClass.dateOk,
                                    textStyle:
                                        providersClass.dateOk != "00/00/0000"
                                            ? AppTextStyle.grey_16_txt
                                            : AppTextStyle.grey_14_txt,
                                    onPressed: () {
                                      providersClass.selectDatePicker(context);
                                    },
                                    index: providersClass.dateOk != "00/00/0000"
                                        ? 1
                                        : -1,
                                  ),
                                  providersClass.dateOk != "00/00/0000"
                                      ? Positioned(
                                          top: 18,
                                          left: 32,
                                          child: Text(
                                            "Age*",
                                            style: AppTextStyle.grey_10_txt,
                                          ))
                                      : Container()
                                ],
                              ),
                            ),
                            Expanded(
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColor.grey, width: 1),
                                        borderRadius: RadiusBorder.radius_6),
                                    height: 48.sp,
                                    padding:
                                        const EdgeInsets.fromLTRB(12, 0, 10, 0),
                                    margin: const EdgeInsets.fromLTRB(
                                        20, 10, 20, 10),
                                    child: DropdownButtonFormField(
                                      items: const [
                                        DropdownMenuItem(
                                          value: 'Erkak',
                                          child: Text('Erkak'),
                                        ),
                                        DropdownMenuItem(
                                            value: 'Ayol', child: Text('Ayol')),
                                      ],
                                      style: AppTextStyle.grey_16_txt,
                                      onChanged: (value) {
                                        providersClass
                                            .setgenders(value.toString());
                                      },
                                      iconSize: 0,
                                      decoration: InputDecoration(
                                          labelText: "Gender*",
                                          labelStyle:
                                              providersClass.genders != ""
                                                  ? AppTextStyle.grey_12_txt
                                                  : AppTextStyle.grey_14_txt,
                                          suffixIcon: Image.asset(
                                            "assets/arrow-down.png",
                                            color: AppColor.grey,
                                          ),
                                          border: InputBorder.none),
                                    )))
                          ],
                        ),

                        /// region of user
                        DropdownDialog(
                            list: regionList,
                            indexList: 1,
                            value: providersClass.regiondrop,
                            hintText: "Regions*"),

                        /// profession of user
                        DropdownDialog(
                            list: regionList,
                            indexList: 2,
                            value: providersClass.professions,
                            hintText: "Professions*"),

                        /// coupon of user
                        DropdownDialog(
                            list: regionList,
                            indexList: 3,
                            value: providersClass.coupons,
                            hintText: "Coupons*"),

                        /// cancel and save buttons
                        Container(
                          margin: const EdgeInsets.only(top: 40),
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              MaterialButtons(
                                gr: false,
                                gradientText: DecorationBox.gradientText,
                                text: "Cancel",
                                decoration: registerProvider.allPositionsData(
                                        context, providersClass)
                                    ? DecorationBox.allBoxDecorationBorderBlue
                                    : DecorationBox.allBoxDecorationBorderRed,
                                height: 48.sp,
                                textStyle: registerProvider.allPositionsData(
                                        context, providersClass)
                                    ? AppTextStyle.blue_13_txt_w5
                                    : AppTextStyle.red_13_txt_w5,
                                width: 170.sp,
                                shape: RadiusBorder.roundedRadius_8,
                                tf: false,
                                onPressed: () {
                                  providersClass.dateOkSet();
                                  providersClass.btnUserTf(false);
                                  providersClass.allregisterset(1);
                                  providersClass.registrfalse();
                                  providersClass.showPicture("");
                                  registerProvider.saveOrCancel();
                                },
                              ),
                              MaterialButtons(
                                  gr: false,
                                  gradientText: DecorationBox.gradientText,
                                  text: "Save",
                                  decoration:
                                      DecorationBox.linerGradientDecoration,
                                  height: 48.sp,
                                  textStyle: AppTextStyle.white_13_txt_w5,
                                  shape: RadiusBorder.roundedRadius_8,
                                  width: 170.sp,
                                  tf: false,
                                  onPressed: () {
                                    if (registerProvider.allPositionsData(
                                        context, providersClass)) {
                                      providersClass.btnUserTf(false);
                                      registerProvider.addUser(providersClass);
                                      providersClass.profAccaunt
                                          .add(registerProvider.profaccauntAdd);
                                      // providersClass.accauntProfAdd(profaccauntAdd);
                                      providersClass.allregisterset(0);
                                      providersClass.registrfalse();
                                      providersClass.showPicture("");
                                      registerProvider.saveOrCancel();
                                      providersClass.toast(
                                          "Add user", context, Colors.blue);
                                    } else {
                                      providersClass.toast("Enter Data of User",
                                          context, Colors.red);
                                    }
                                  }),
                            ],
                          ),
                        )
                      ])
              ],
            );
          });
        });
      });
    });
  }
}
