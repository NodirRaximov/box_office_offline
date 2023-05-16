import 'dart:io';

import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/providers/registerProviders.dart';
import 'package:box_office_offline/ui/colors/myColors.dart';
import 'package:box_office_offline/ui/cutomDialogs/imgShow.dart';
import 'package:box_office_offline/widgets/panelWidgets/cameraPage.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CameraButtonPicUser extends StatelessWidget {
  const CameraButtonPicUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Consumer<RegisterProviders>(
        builder: (context, registerProvider, child) {
      return Consumer<ProvidersClass>(
          builder: (context, providersClass, child) {
        return Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(
                registerProvider.widthToHeight(width, height) ? 20 : 40,
                20,
                0,
                0),
            child: ClipOval(
              child: Container(
                height: 110,
                width: 110,
                decoration: providersClass.picture == ""
                    ? BoxDecoration(
                        border: Border.all(width: 1, color: AppColor.grey),
                        borderRadius: BorderRadius.circular(60))
                    : null,
                child: providersClass.picture == ""

                    /// camera button
                    ? MaterialButton(
                        onPressed: () async {
                          await availableCameras().then((value) => showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: SizedBox(
                                      width: 500,
                                      height: 500,
                                      child: ClipOval(
                                          child: CameraPage(cameras: value))),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                );
                              }));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60)),
                        child: Image.asset('assets/camera.png'))

                    /// picture of user
                    : InkWell(
                        onTap: () {
                          showDialogImg(context, 0);
                        },
                        child: Container(
                          height: 140,
                          width: 140,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(60)),
                              image: DecorationImage(
                                  image: FileImage(
                                    File(registerProvider.picList.first),
                                  ),
                                  fit: BoxFit.fill)),
                        ),
                      ),
              ),
            ),
          ),
        );
      });
    });
  }
}
