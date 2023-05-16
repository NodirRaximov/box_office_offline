import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/widgets/panelWidgets/qrCodeScanPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutScanBarDialog extends StatelessWidget {
  const AboutScanBarDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PanelProvider>(builder: (context,panelProvider,child){
      return Stack(alignment: Alignment.center,
        children: [
          panelProvider.aboutScanBarDialog?GestureDetector(
            onTap: ()=>panelProvider.aboutScanBar(),
            child: Container(
              alignment: Alignment.center,
              color:const Color.fromARGB(170, 0, 0, 0),
            ),
          ):Container(),
          panelProvider.aboutScanBarDialog?
          Container(
            alignment:Alignment.center,
            margin:const EdgeInsets.fromLTRB(40, 200, 40, 200),
            padding: const EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height*0.5,
            width: MediaQuery.of(context).size.width*0.4,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin:const EdgeInsets.fromLTRB(65, 0, 0, 0),
                  ),
                  const SizedBox.square(child: Text("Scan QR CODE",style: TextStyle(fontSize: 25),),),
                  MaterialButton(height: 50,minWidth: 50,
                    onPressed: (){
                      panelProvider.aboutScanBar();
                    },shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)), child: Image.asset("assets/close-circle.png"),)
                ],),
              const Expanded(child: QrCodeScanPage())
            ],),)
              :Container()
        ],);
    });
  }
}
