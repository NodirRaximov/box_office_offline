import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/cutomDialogs/moneyPayContainer/showDialogPay.dart';
import 'package:box_office_offline/ui/cutomDialogs/moneyPayContainer/showDialogPayDeposits.dart';
import 'package:box_office_offline/ui/returnWidgets/totalDiscount.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MoneyShowDialogPay extends StatelessWidget {
  const MoneyShowDialogPay(
      {super.key, required this.brandOrService, required this.index});

  final bool brandOrService;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProvidersClass>(builder: (context, providersClass, child) {
      return Consumer<PanelProvider>(builder: (context, panelProvider, child) {
        return SingleChildScrollView(
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(top: 15.sp,left: 15.sp,right: 15.sp),
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipOval(
                    child: Container(
                      decoration: DecorationBox.allBoxDecoration,
                      child: GestureDetector(
                        onTap: () {
                          panelProvider.setMoneyPayButton();
                        },
                        child: const Icon(Icons.arrow_back_ios),
                      ),
                    ),
                  ),
                  SizedBox(
                      child: Text("Платеж",
                          textAlign: TextAlign.center,
                          style: AppTextStyle.black_24_txt)),
                  SizedBox(
                      child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      panelProvider.setMoneyPayButton();
                      // Navigator.pop(context);
                    },
                    icon: const Icon(Icons.clear_sharp),
                    iconSize: 25,
                  ))
                ],
              ),
            ),
            brandOrService
                ? ShowDialogPayShop(
                    index: index,
                  )
                : const ShowDialogPayDeposits(),

          ]),
        );
      });
    });
  }
}
