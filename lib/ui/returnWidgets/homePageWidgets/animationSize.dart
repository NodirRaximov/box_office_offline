import 'package:box_office_offline/providers/historyProvider.dart';
import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/providers/registerProviders.dart';
import 'package:box_office_offline/ui/ListsFile.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/buttons/material_buttons.dart';
import 'package:box_office_offline/ui/cutomDialogs/moneyPayContainer/moneyShowDialogPay.dart';
import 'package:box_office_offline/ui/returnWidgets/homePageWidgets/listHistoryOfVisits.dart';
import 'package:box_office_offline/ui/returnWidgets/homePageWidgets/totalAndButtons.dart';
import 'package:box_office_offline/ui/returnWidgets/registerUser/registerWidget.dart';
import 'package:box_office_offline/ui/text/textFormFieldes.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:box_office_offline/widgets/home/listShopingCartWidget.dart';
import 'package:box_office_offline/widgets/home/listShopingHistoryWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class AnimationSizeContainer extends StatelessWidget {
  const AnimationSizeContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Consumer<ProvidersClass>(builder: (context, providersClass, child) {
      return Consumer<PanelProvider>(builder: (context, panelProvider, child) {
        return Consumer<HistoryProvider>(
            builder: (context, historyProv, child) {
          return Consumer<RegisterProviders>(
              builder: (context, registerProv, child) {
            return AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
              child: Container(
                  decoration: DecorationBox.allBoxDecoration,
                  width: panelProvider.logo
                      ? 0
                      : providersClass.showcontext
                          ? width * 0.48
                          : 64.spMin,
                  height: height,
                  child: panelProvider.moneyPayButton
                      ?const MoneyShowDialogPay(brandOrService: true, index: -1)
                      :providersClass.usertf
                      ? Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(
                                          top: 20, left: 20, right: 5),
                                      width: width * 0.23,
                                      height: 48.sp,
                                      child: TextFormFiledes(
                                        obScuereText: false,
                                        textController: TextEditingController(
                                            text:
                                                "${registerProv.profaccauntAdd.surname} ${registerProv.profaccauntAdd.name}"),
                                        formater: registerProv.maskText,
                                        providers: providersClass,
                                        suffixIconOne:
                                            "assets/userClosedBtn.png",
                                        onPressedOne: () {
                                          registerProv.accauntProfDeleted(
                                              profAccaunts.length - 1);
                                          providersClass.showContext(true);
                                          providersClass.registrfalse();
                                          if (providersClass.userBtnTf ==
                                              true) {
                                            providersClass.btnUserTf(false);
                                            providersClass.imgavatartf(true);
                                            providersClass.dateOkSet();
                                          } else {
                                            providersClass.imgavatartf(false);
                                            providersClass.btnUserTf(true);
                                          }
                                          providersClass.allregisterset(1);
                                          providersClass.showPicture("");
                                          registerProv.picList.clear();
                                        },
                                        suffixIconTwo:
                                            "assets/scan-barcode.png",
                                        onPressedTwo: () {
                                          panelProvider.aboutScanBar();
                                        },
                                        hintTx: "Клиент",
                                        styleTv: AppTextStyle.grey_16_txt,
                                      )),
                                  providersClass.userBtnTf == false

                                      /// list history of visits
                                      ? const ListHistoryOfVisits()
                                      : Container()
                                ],
                              ),
                            ),
                            providersClass.userBtnTf

                                /// user close button clicked else true= user register/else false= shopping cart list ...

                                /// user register

                                ? const RegisterWidget()

                                ///  list history visits

                                : Expanded(
                                    child: providersClass.imglistshop.isNotEmpty
                                        ? historyProv.historyOfVisits == false

                                            ///   list shop

                                            ? const SingleChildScrollView(
                                                child: ListShopingCartWidget(),
                                              )

                                            ///  list history of visits

                                            : ListShopingHistoryWidget
                                                .returnlisthistoryshop(context,
                                                    providersClass.imglistshop)
                                        : Column(
                                            /// list shop == null
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                  height: height * 0.6,
                                                  alignment:
                                                      Alignment.topCenter,
                                                  margin:
                                                      const EdgeInsets.fromLTRB(
                                                          50, 30, 50, 0),
                                                  child: Lottie.asset(
                                                      'assets/astronaut-with-space-shuttle.json')),
                                              const Text(
                                                "Корзина пустая",
                                                style: TextStyle(fontSize: 25),
                                              )
                                            ],
                                          ),
                                  ),
                            providersClass.userBtnTf == false
                                ? historyProv.historyOfVisits
                                    ? Container(
                                        alignment: Alignment.bottomRight,
                                        margin: const EdgeInsets.only(
                                            bottom: 15, right: 35),
                                        child: MaterialButtons(
                                          gr: false,
                                          gradientText: DecorationBox.gradientText,
                                          text: "CLOSE",
                                          decoration:
                                              DecorationBox.linerGradientShadow,
                                          height: 55,
                                          width: 200,
                                          textStyle:
                                              AppTextStyle.white_13_txt_w5,
                                          tf: true,
                                          onPressed: () {
                                            // historyProv
                                            //     .visitsOfHistory(
                                            //     historyProv
                                            //         .oldresultIndex,
                                            //     providersClass
                                            //         .imglistshop);
                                            historyProv.setHistoryListTf();
                                          },
                                        ))

                                    ///  buttons "cancle","visit","oplata"
                                    : providersClass.imglistshop.isNotEmpty
                                        ? const TotalAndButtons()
                                        : Container()
                                : Container()
                          ],
                        )

                      ///  user or shop icon clicked open lists visits

                      : MaterialButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            providersClass.visibleshowdialog();
                            providersClass.twotfbtn(4);
                            providersClass.userBtnOpenorClosed();
                          },
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                providersClass.showcontext
                                    ? Container()
                                    : Expanded(
                                        // user open button clicked visible user shopping cart list ...
                                        child: Container(
                                            alignment: Alignment.topCenter,
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 18, 0, 0),
                                            child: Image.asset(providersClass
                                                    .visible
                                                ? 'assets/userClosedBtn.png'
                                                : 'assets/userOpenBtn.png')),
                                      ),
                                Expanded(
                                    //shopping cart button clicked visible user shopping cart list ...
                                    child: Column(
                                  children: [
                                    Image.asset(providersClass.countshop > 0
                                        ? 'assets/shoppingOpenCardBtn.png'
                                        : 'assets/shoppingcartopen.png'),
                                    Text(
                                      "${providersClass.countshop == 0 ? "" : providersClass.countshop}",
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.blue),
                                      textAlign: TextAlign.center,
                                    )
                                  ],)
                                ),
                              ]),
                        )),
            );
          });
        });
      });
    });
  }
}
