import 'package:box_office_offline/ui/colors/myColors.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DecorationBox{
  DecorationBox._();

  static BoxDecoration allBoxDecoration=BoxDecoration(
      borderRadius: RadiusBorder.radius_8,
      color: Colors.white,
      boxShadow: <BoxShadow>[
        ShadowBox.boxShadowOne
      ]
  );

  static BoxDecoration payBoxDecotation=BoxDecoration(
      borderRadius: RadiusBorder.radius_8,
      boxShadow: <BoxShadow>[ShadowBox.boxShadowOne],
      color: Colors.white,
      border: Border.all(width: 1,color: AppColor.grey)
  );
  static BoxDecoration allBoxDecorationBorderRed=BoxDecoration(
      borderRadius: RadiusBorder.radius_8,
      color: Colors.white,
      boxShadow: <BoxShadow>[
        ShadowBox.boxShadowOne
      ],
      border: Border.all(width: 1,color: Colors.red)
  );

  static BoxDecoration allBoxDecorationBorderBlue=BoxDecoration(
      borderRadius: RadiusBorder.radius_8,
      color: Colors.white,
      boxShadow: <BoxShadow>[
        ShadowBox.boxShadowOne
      ],
      border: Border.all(width: 1,color: Colors.blue)
  );

  static BoxDecoration linerGradientDecoration=BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      gradient: LinearGradient(
          colors: [
            const Color.fromRGBO(29, 161, 242, 1).withOpacity(0.9),
            const Color.fromRGBO(0, 60, 197, 1).withOpacity(0.9)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops:const [0.1,1]
      )
  );
  static BoxDecoration linerGradientNoRadius=BoxDecoration(
      gradient: LinearGradient(
          colors: [
            const Color.fromRGBO(29, 161, 242, 1).withOpacity(0.9),
            const Color.fromRGBO(0, 60, 197, 1).withOpacity(0.9)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops:const [0.1,1]
      )
  );
  static BoxDecoration linerGradientNoRadiusHome=BoxDecoration(
      gradient: LinearGradient(
          colors: [
            const Color.fromRGBO(29, 161, 242, 1).withOpacity(0.9),
            const Color.fromRGBO(0, 60, 197, 1).withOpacity(0.9)
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops:const [0.1,1]
      )
  );
  static BoxDecoration linerGradientShadow=BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      boxShadow: [ShadowBox.boxShadowOne],
      gradient: LinearGradient(
          colors: [
            const Color.fromRGBO(29, 161, 242, 1).withOpacity(0.9),
            const Color.fromRGBO(0, 60, 197, 1).withOpacity(0.9)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops:const [0.1,1]
      )
  );
  static BoxDecoration linerGradientShadowSuccess=BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      boxShadow: [ShadowBox.boxShadowOne],
      gradient: const LinearGradient(
          colors: [
            Color(0xFF7BF6E8),
            Color(0xFF00B9A7)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops:[0.1,1]
      )
  );
  static BoxDecoration linerGradientCosts=BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      boxShadow: [ShadowBox.boxShadowOne],
      gradient: LinearGradient(
          colors: [
            const Color.fromRGBO(255, 170, 102, 1.0).withOpacity(0.9),
            const Color.fromRGBO(255, 134, 38, 1.0).withOpacity(0.9)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops:const [0.1,1]
      )
  );
  static BoxDecoration linerGradientDebt=BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      boxShadow: [ShadowBox.boxShadowOne],
      gradient: LinearGradient(
          colors: [
            const Color.fromRGBO(255, 107, 112, 1.0).withOpacity(0.9),
            const Color.fromRGBO(237, 59, 65, 1.0).withOpacity(0.9)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops:const [0.1,1]
      )
  );
  static LinearGradient gradientText=LinearGradient(
      colors: [
        const Color.fromRGBO(29, 161, 242, 1),
        const Color.fromRGBO(0, 60, 197, 1).withOpacity(0.9)
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops:const [0.1,1]
  );

  static BoxDecoration decorationRadiusBorder = BoxDecoration(
    border: Border.all(
        width: 1,
        color: AppColor.grey
    ),
    borderRadius: RadiusBorder.radius_6
  );

  static BoxDecoration deorationColorGrey =BoxDecoration(
      color: const Color.fromRGBO(249, 252, 254, 1),
      borderRadius: RadiusBorder.radius_6
  );

  static BoxDecoration borderGrey = BoxDecoration(border: Border.all(width: 1,color: AppColor.grey),borderRadius: RadiusBorder.radius_6);
  static returnBorderColorRadius(Color colors,BorderRadius radiusBorder,double width){
    return BoxDecoration(border: Border.all(width:  width, color:colors),borderRadius: radiusBorder,color: Colors.white);
  }


}

class RadiusBorder{
  RadiusBorder._();
  static BorderRadius radius_8 = BorderRadius.circular(8);
  static BorderRadius radius_5 = BorderRadius.circular(5);
  static BorderRadius radius_6 = BorderRadius.circular(6);
  static RoundedRectangleBorder roundedRadius_8 = RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));
  static RoundedRectangleBorder roundedRadius_5 = RoundedRectangleBorder(borderRadius: BorderRadius.circular(5));
  static RoundedRectangleBorder roundedRadius_6 = RoundedRectangleBorder(borderRadius: BorderRadius.circular(6));

}

class ShadowBox{
  ShadowBox._();

  static BoxShadow boxShadowOne=const BoxShadow(
      color: AppColor.shadowColors,
      spreadRadius: 0,
      blurRadius: 10,blurStyle: BlurStyle.solid,
      offset:Offset(0, 0));

}