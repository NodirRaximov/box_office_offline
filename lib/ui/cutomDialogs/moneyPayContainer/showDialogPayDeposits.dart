import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowDialogPayDeposits extends StatelessWidget {
  const ShowDialogPayDeposits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProvidersClass>(builder: (context,providersClass,child) {
      return Consumer<PanelProvider>(builder: (context, panelProvider, child) {
       return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                alignment: Alignment.centerLeft,
                child: const Text("Name of:", style: TextStyle(fontSize: 22,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500),)),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.65,
              padding: const EdgeInsets.only(right: 10, top: 15),
              child: Expanded(flex: 5,
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 5),
                    height: 60,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromRGBO(247, 248, 252, 1),),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,),
                      style: const TextStyle(fontSize: 20),
                      keyboardType: TextInputType.number,
                    ),
                  )),
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.65,
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 10),
              child: Row(children: [
                const Expanded(flex: 2,
                    child: Text("ДЕПОЗИТ", style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w400),)),
                Expanded(flex: 4,
                    child: Container(
                      margin: const EdgeInsets.only(right: 15),
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 5),
                      height: 60,
                      width: 238,
                      decoration: DecorationBox.allBoxDecoration,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,),
                        style: const TextStyle(fontSize: 20),
                        keyboardType: TextInputType.number,
                      ),
                    )
                ),
                Container(
                    padding: const EdgeInsets.only(
                        left: 15, right: 10, top: 5),
                    height: 60,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromRGBO(247, 248, 252, 1),),
                    child: Row(
                      children: [
                        const Expanded(flex: 1,
                            child: Text("sdfs.jpeg",
                              overflow: TextOverflow.ellipsis,)),
                        Container(
                          alignment: Alignment.centerRight,
                          width: 40,
                          child: TextButton(
                            onPressed: () {

                            },
                            child: Image.asset(
                                "assets/doc_download.png"),
                          ),
                        ),
                      ],
                    )
                ),
              ],),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                height: 60,
                minWidth: 250,
                color: Colors.blue,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("PAY", style: TextStyle(
                    color: Colors.white, fontSize: 20),),
              ),
            )
          ],);
      });
    });
  }
}
