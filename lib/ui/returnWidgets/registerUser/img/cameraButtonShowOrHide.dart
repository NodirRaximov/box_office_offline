import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/ui/colors/myColors.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:box_office_offline/widgets/panelWidgets/cameraPage.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CameraButtonShowOrHide extends StatelessWidget {
  const CameraButtonShowOrHide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProvidersClass>(builder: (context, providersClass, child) {
      return Row(
        children: [
          Container(
            margin: const EdgeInsets.only(
              left: 20,
              top: 15,
            ),
            child: Card(
              elevation: 10,
              shadowColor: AppColor.shadowColor,
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(50)),
              child: ClipOval(
                child: MaterialButton(
                  height: 63,
                  minWidth: 45,
                  onPressed: () async {
                    await availableCameras().then(
                            (value) => showDialog(
                            context: context,
                            builder: (BuildContext
                            context) {
                              return AlertDialog(
                                content: SizedBox(
                                  width: 500,
                                  height: 500,
                                  child: ClipOval(
                                      child: CameraPage(
                                          cameras:
                                          value)),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                        50)),
                              );
                            }));
                  },
                  child: Image.asset(
                      "assets/camera.png"),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
                left: 20, top: 20),
            child: Text(
              "Add Family",
              style: AppTextStyle.grey_16_txt,
            ),
          )
        ],
      );
    });
  }
}
