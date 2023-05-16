import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/cutomDialogs/timeReverse.dart';
import 'package:box_office_offline/ui/text/textFormFieldes.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetCodePVC extends StatelessWidget {
  const GetCodePVC({super.key,
    this.providersClass,
    required this.onPressed,
    this.providers
  });
  final ProvidersClass? providersClass;
  final dynamic providers;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(alignment: Alignment.topCenter,
      children: [
        providers.showDImg
            ?GestureDetector(
          onTap: () {
            providers.imgShowD(!providers.showDImg);
            providersClass!.startTime(false);
          },
          child: Container(
            color:const Color.fromARGB(170, 0, 0, 0),
          ),
        ):Container(),
        providers.showDImg
            ? Container(
          decoration: BoxDecoration(borderRadius: RadiusBorder.radius_8,color: Colors.white,),
          width: width * 0.6,
          height: height * 0.5,
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 50.sp),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Container(
                          margin:const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          child: Text("Activate by PVC",style: AppTextStyle.black_24_txt,))),
                  Container(
                    margin:const EdgeInsets.only(right: 10),
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        providers.imgShowD(!providers.showDImg);
                        providersClass!.startTime(false);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.grey,
                        size: 25,
                      ),
                    ),
                  )
                ],
              ),
              Container(alignment: Alignment.centerLeft,
                  margin:const EdgeInsets.only(left: 20,top: 10,bottom: 10),
                  child: Text("Enter PVC Code",style: AppTextStyle.black_18_txt,)),
              Container(
                padding: const EdgeInsets.only(right: 20, top: 8,left: 20),
                child: TextFormFiledes(
                  height: 48.sp,
                  hintTx: "Введите PVC",
                  formater: providers.pvcmask,
                  onChanded: (newText) {
                    if (newText.length > 10) {
                      providersClass!.activIconbtn(false);
                    } else {
                      providersClass!.activIconbtn(true);
                      providersClass!.restartPositionData();
                    }
                  },
                  obScuereText: false,
                  styleTv: AppTextStyle.grey_16_txt,
                  keyType: const TextInputType.numberWithOptions(
                      decimal: true),
                ),
              ),
              Container(
                  height: 100,
                  width: width*0.4,
                  margin:const EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child:const TimerReverse()
              ),
              Container(
                  width: 140.sp,
                  height: 38.sp,
                  decoration: DecorationBox.linerGradientDecoration,
                  margin: const EdgeInsets.only(top:10, right:20,),
                  child: MaterialButton(
                    minWidth: 140.sp,
                    height: 48.sp,
                    onPressed: () {
                      if (providersClass!.numberactiv == "" ||
                          providersClass!.numberactiv.length < 9) {
                        providersClass!.toast("Enter Phone Number",context,Colors.pink);
                      } else {
                        var kodnum =
                        providersClass!.numberactiv.substring(0, 4);
                        var numthree = providersClass!.numberactiv.substring(
                            providersClass!.numberactiv.length - 2);
                        providersClass!
                            .numberTv("$kodnum** *** ** $numthree");
                        providersClass!.activbtn(true);
                        providersClass!.startTime(false);
                      }
                    },
                    shape: RoundedRectangleBorder(borderRadius: RadiusBorder.radius_8),
                    child: const Text(
                      'Activate',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ],
          ),
        )
            : Container()
      ],
    );
  }
}