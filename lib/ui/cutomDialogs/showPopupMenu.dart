import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/widgets/main/mainPage.dart';
import 'package:box_office_offline/widgets/panelWidgets/customDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ShowPopUpMenues{
  ShowPopUpMenues._();

  static  showPopupMenues(context) async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(68.sp, MediaQuery.of(context).size.height,
          MediaQuery.of(context).size.width, 50.sp),
      items: [
        PopupMenuItem(
            value: "View",
            child: Consumer<ProvidersClass>(
              builder: (context, providersClass, child) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const CustomDialog()));
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Test Page"),
                        Icon(
                          Icons.logout,
                          color: Colors.grey,
                        ),
                      ]),
                );
              },
            )),
        PopupMenuItem(
            value: "Edit",
            child: Consumer<ProvidersClass>(
              builder: (context, providersClass, child) {
                return InkWell(
                  onTap: () {
                    if (providersClass.showcontext == false) {
                      providersClass.twotfbtn(4);
                      providersClass.showContext(true);
                      providersClass.dateOkSet();
                    }
                    providersClass.btnUserTf(true);
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Edit User"),
                        Icon(
                          Icons.logout,
                          color: Colors.grey,
                        ),
                      ]),
                );
              },
            )),
        PopupMenuItem(
            value: "Logout",
            child: Consumer<ProvidersClass>(
              builder: (context, providersClass, child) {
                return InkWell(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (_) => const MainPage(title: '')),
                              (route) => false);
                      providersClass.restartPage();
                      providersClass.allregisterset(0);
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Logout"),
                          Icon(
                            Icons.logout,
                            color: Colors.grey,
                          ),
                        ]));
              },
            )),
      ],
      elevation: 8.0,
    ).then((value) => {});
  }
}