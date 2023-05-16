import 'package:box_office_offline/providers/historyProvider.dart';
import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/providers/registerProviders.dart';
import 'package:box_office_offline/ui/ListsFile.dart';
import 'package:box_office_offline/ui/returnWidgets/homePageWidgets/listHistoryOfVisits.dart';
import 'package:box_office_offline/ui/returnWidgets/registerUser/registerWidget.dart';
import 'package:box_office_offline/ui/text/textFormFieldes.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:box_office_offline/widgets/home/listShopingCartWidget.dart';
import 'package:box_office_offline/widgets/home/listShopingHistoryWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ButtonAndListCard extends StatelessWidget {
  const ButtonAndListCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Consumer<ProvidersClass>(builder: (context, providersClass, child) {
      return Consumer<RegisterProviders>(
          builder: (context, registerProv, child) {
        return Consumer<PanelProvider>(
            builder: (context, panelProvider, child) {
          return Consumer<HistoryProvider>(
              builder: (context, historyProv, child) {
            return Column(
              children: [


              ],
            );
          });
        });
      });
    });
  }
}
