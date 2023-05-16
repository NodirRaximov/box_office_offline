import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/providers/registerProviders.dart';
import 'package:box_office_offline/ui/ListsFile.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/buttons/panelButtons.dart';
import 'package:box_office_offline/ui/cutomDialogs/showPopupMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class LeftPanel extends StatelessWidget {
  const LeftPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PanelProvider>(builder: (context, panelProvider, child) {
      return Consumer<ProvidersClass>(
          builder: (context, providersClass, child) {
        return Consumer<RegisterProviders>(
            builder: (context, registerProv, child) {
          return Container(
            width: 64.sp,
            decoration: DecorationBox.linerGradientNoRadiusHome,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PanelButtons(
                    img: "assets/shape.png",
                    iconTf: panelProvider.logo,
                    index: 6,
                    providers: panelProvider,
                    onPressed: () {
                      panelProvider.onPressedTf(6);
                      panelProvider.isOpenProfInfo = true;
                      if (providersClass.showcontext == true) {
                        providersClass.setShowContainer(context);
                      }
                      panelProvider.setFalseMoneyPayButton();
                    }),
                SizedBox.square(
                  child: Column(
                    children: [
                      PanelButtons(
                          onPressed: () {
                            panelProvider.onPressedTf(0);
                            panelProvider.country;
                            panelProvider.setFalseMoneyPayButton();
                          },
                          img: "assets/box.png",
                          index: 0,
                          providers: panelProvider,
                          iconTf: panelProvider.boxtf),
                      PanelButtons(
                          onPressed: () {
                            panelProvider.onPressedTf(1);
                            panelProvider.country;
                            panelProvider.setFalseMoneyPayButton();

                          },
                          img: "assets/profile-2user.png",
                          index: 1,
                          providers: panelProvider,
                          iconTf: panelProvider.proftf),
                      PanelButtons(
                          onPressed: () {
                            panelProvider.onPressedTf(2);
                            panelProvider.country;
                            panelProvider.setFalseMoneyPayButton();

                          },
                          img: "assets/category-2.png",
                          index: 2,
                          providers: panelProvider,
                          iconTf: panelProvider.cattf),
                      PanelButtons(
                          onPressed: () {
                            panelProvider.onPressedTf(3);
                            panelProvider.country;
                            panelProvider.setFalseMoneyPayButton();

                          },
                          img: "assets/scan-barcode.png",
                          index: 3,
                          providers: panelProvider,
                          iconTf: panelProvider.qrtf),
                      PanelButtons(
                          onPressed: () {
                            panelProvider.onPressedTf(4);
                            panelProvider.country;
                            panelProvider.setFalseMoneyPayButton();

                          },
                          img: "assets/reserve.png",
                          index: 4,
                          providers: panelProvider,
                          iconTf: panelProvider.reservetf),
                      PanelButtons(
                          onPressed: () {
                            panelProvider.onPressedTf(5);
                            panelProvider.country;
                            panelProvider.setFalseMoneyPayButton();
                          },
                          img: "assets/money-recive.png",
                          index: 5,
                          providers: panelProvider,
                          iconTf: panelProvider.recivetf),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                  child: TextButton(
                    child: ClipOval(
                      child: FadeInImage(
                        placeholder: const AssetImage("assets/no_check_circle_drop.png",),
                        image:NetworkImage(imageDList[0].url.toString()),
                        // loadingBuilder: (context,child,image)=> Container(color:Colors.yellow),
                        // errorBuilder: (context,child,image)=> Container(color:Colors.red),
                        fit: BoxFit.cover,
                        height: 32.sp,
                        width: 32.sp,
                      ),
                    ),
                    onPressed: () {
                      ShowPopUpMenues.showPopupMenues(context);
                      // Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          );
        });
      });
    });
  }
}
