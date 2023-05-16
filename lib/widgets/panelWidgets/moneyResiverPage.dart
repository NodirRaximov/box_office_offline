import 'package:box_office_offline/model/profAccauntData.dart';
import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/ui/ListsFile.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/cutomDialogs/moneyPayContainer/moneyShowDialogPay.dart';
import 'package:box_office_offline/ui/returnWidgets/topContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:steps_indicator/steps_indicator.dart';

class MoneyRecivePage extends StatefulWidget {
  const MoneyRecivePage({Key? key}) : super(key: key);

  @override
  State<MoneyRecivePage> createState() => _MoneyRecivePageState();
}

class _MoneyRecivePageState extends State<MoneyRecivePage> {

  bool searchtf = true;
  bool backtf = false;
  String tvText = "";
  String tvText2 = "";
  bool lottietf = true;

  List<ProfAccauntData> profAccaunt = [];
  var indexTab=0;

  @override
  Widget build(BuildContext context) {
    profAccaunt = context.read<ProvidersClass>().profAccaunt;
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Consumer<ProvidersClass>(builder: (context, providersClass, child) {
        return Consumer<PanelProvider>(builder: (context,panelProviders,child) {
          return Container(
            color: Colors.white,
            padding: EdgeInsets.only(left: 16.sp,top: 16.sp,right:providersClass.visible?20.sp:64.sp ),
            child: Column(children: [
              TopContainer(index: 3,providers: panelProviders,providersClass: providersClass,),
              providersClass.imglistshop.isNotEmpty
                  ? panelProviders.moneyRecive
                  ? Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top:10),
                // padding:EdgeInsets.only(left: 15, right: providersClass.visible?30:60,),
                height: height * 0.887,
                child: Stack(
                  children: [
                    SizedBox(
                      height: height,
                      child: Card(
                        elevation: 10,
                        child: Container(
                          height: 100,
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width,
                          child: StepsIndicator(
                            selectedStep: indexTab,
                            nbSteps: providersClass.imglistshop.length,
                            doneStepColor: Colors.blue,
                            doneLineColor: Colors.red,
                            lineLength: Expanded(child: Container(height: 10,color: Colors.blue,),).flex*width/providersClass.imglistshop.length/10,
                            undoneLineColor: Colors.grey,
                            isHorizontal: true,
                            doneStepWidget: Container(
                              height: 30,
                              width: 30,
                              alignment: Alignment.topLeft,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.red),
                              child: IconButton(
                                  onPressed: (){

                                  },padding: EdgeInsets.zero,
                                  alignment: Alignment.center,
                                  icon: const Icon(Icons.check,color: Colors.white,)),
                            ), // Custom Widget
                            unselectedStepWidget: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey),
                              child: IconButton(onPressed: (){

                              }, padding: EdgeInsets.zero,
                                  alignment: Alignment.center,icon: const Icon(Icons.not_interested,color: Colors.white,)),
                            ), // Custom Widget
                            selectedStepWidget: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.blue),
                              child: IconButton(onPressed: (){
                                indexTab++;
                                setState(() {

                                });
                              }, padding: EdgeInsets.zero,
                                  alignment: Alignment.center,icon: const Icon(Icons.question_mark_sharp,color: Colors.white,)),), // Custom Widget

                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 15,
                        right: providersClass.visible?30:60,
                        child: MaterialButton(
                          onPressed: () {
                            panelProviders.moneyRecives();
                            indexTab=0;
                          },
                          color: Colors.blue,
                          minWidth: 200,
                          height: 60,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: const Text(
                            "ЗАКРЫТЬ",
                            style: TextStyle(color: Colors.white),
                          ),
                        ))
                  ],
                ),
              )
                  : Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 10.sp),
                  child: GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate:
                      SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: (height)*(width-40)/(providersClass.visible?3500:3800),
                          childAspectRatio:providersClass.visible?widthToHeight(width, height)
                              ? 1 / 1.075.spMin
                              :1/1.3
                              :widthToHeight(width, height)
                              ?6/6.7.spMin
                              :6/6.9.spMin,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8),
                      itemCount: searchtf
                          ? providersClass.imglistshop.length
                          : providersClass.imglistshop.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        return Container(
                          margin: EdgeInsets.only(top: 3.sp,left: 3.sp,right: 3.sp),
                          decoration: DecorationBox.allBoxDecoration,
                          child: MaterialButton(
                            shape:RadiusBorder.roundedRadius_8,
                            onPressed: () {
                              panelProviders.moneyRecives();
                            },
                            child: Stack(
                              children: [
                                Container(
                                  height: height*0.35,
                                  margin:const EdgeInsets.only(top: 8,left: 5,right: 5),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  providersClass
                                                      .imglistshop[index].title,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontSize: 20),
                                                  maxLines: 1,
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                ),
                                                const Text(
                                                  "Готовиться",
                                                  style: TextStyle(
                                                      color: Colors
                                                          .orangeAccent),
                                                ),
                                              ],
                                            ),
                                            Container(
                                                alignment:
                                                Alignment.topLeft,
                                                height: 40,
                                                width: 40,
                                                child: TextButton(
                                                    onPressed: () {
                                                      panelProviders
                                                          .moneyRecives();
                                                    },
                                                    child: const Icon(
                                                      Icons
                                                          .visibility_outlined,
                                                      size: 25,
                                                      color: Colors.black45,
                                                    )))
                                          ],
                                        ),
                                        Container(
                                            padding: const EdgeInsets.only(
                                                top: 10),
                                            child: Text(
                                              "У кого: ${profAccaunt[index]
                                                  .surname} ${profAccaunt[index]
                                                  .name}/${profAccaunt[index]
                                                  .position}",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.7)),
                                            )),
                                        Container(
                                            padding: const EdgeInsets.only(
                                                top: 5),
                                            child: Text(
                                              "Заказов: ${providersClass
                                                  .imglistshop[index].counts}",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.7)),
                                            )),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Text(
                                                "Внесено: ${providersClass
                                                    .imglistshop[index]
                                                    .price} сум",
                                                style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.7)),
                                              ),
                                              providersClass.imglistshop[index]
                                                  .price != 0
                                                  ? Image.asset(
                                                "assets/money-recive.png",
                                                color: Colors.blue,
                                                height: 25,
                                                width: 25,
                                              )
                                                  : Container(),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          "Сумма: ${providersClass
                                              .imglistshop[index].price} сум",
                                          style: TextStyle(
                                              color: Colors.redAccent
                                                  .withOpacity(0.7)),
                                        ),
                                        Container(
                                            padding: const EdgeInsets.only(
                                                top: 5),
                                            child: Text(
                                              "Клиент: ${profAccaunt[index]
                                                  .surname} ${profAccaunt[index]
                                                  .name}",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.7)),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top:widthToHeight(width, height)?163:192,
                                  left: 3,
                                  right: 3,
                                  child: Container(
                                    padding:
                                    const EdgeInsets.only(top: 15),
                                    alignment: Alignment.bottomCenter,
                                    child: MaterialButton(
                                      height: 36,
                                      minWidth: (width-10) * 0.18,
                                      onPressed: () {
                                        debugPrint("$width");
                                        debugPrint("$height");
                                        panelProviders.onPressedTf(0);
                                        panelProviders.country;
                                        // providersClass.visibleshowdialog();
                                      },
                                      color: Colors.blue,
                                      child: const Text(
                                        "Add offer",
                                        style: TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: widthToHeight(width, height)?223:248,
                                  left: 3,
                                  right: 3,
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    child: MaterialButton(
                                      height: 36,
                                      minWidth: width * 0.18,
                                      onPressed: () {
                                        MoneyShowDialogPay(
                                            brandOrService:providersClass.imglistshop[index].brandOrService,
                                            index:index);
                                      },
                                      color: const Color.fromRGBO(
                                          43, 203, 186, 1),
                                      child: const Text(
                                        "Pay order",
                                        style: TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              )
                  : SizedBox(
                width: width,
                height: height * 0.887,
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset("assets/astronaut-in-tea-break.json"),
                    const Text(
                      "Корзина пустая", style: TextStyle(fontSize: 22),)
                  ],
                ),
              ),
            ]),
          );
        }
        );
      }),
    );
  }

}
bool widthToHeight(width,height){
  setState(() {});
  if(width-height<500){
    setState(() {});
    return true;
  }else{
    setState(() {});
    return  false;
  }
}
