import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/ui/ListsFile.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/returnWidgets/topContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ResiverPage extends StatefulWidget {
  const ResiverPage({Key? key}) : super(key: key);

  @override
  State<ResiverPage> createState() => _ResiverPageState();
}

class _ResiverPageState extends State<ResiverPage> {
  bool searchtf=true;
  bool backtf=false;
  String tvText = "";
  String tvText2 = "";
  bool lottietf=true;

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

  void _searchList(){
    setState(() {
      for (var element in imageDList) {
        imageDList.add(element);
        lottietf=true;
      }
      if(imageDList.isEmpty) {
        lottietf = false;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProvidersClass>(builder:(context,providersClass,child){
     return Consumer<PanelProvider>(builder:(context,panelProvider,child){
        return Container(
          color: Colors.white,
          padding:EdgeInsets.only(left: 16.sp,top:16.sp,right: providersClass.visible?20.sp:64.sp,),
          // color: const Color.fromRGBO(247, 248, 252, 1.0),
          child: Column(
            children: [
              TopContainer(index: 3,providers: panelProvider,providersClass: providersClass,),
              Expanded(
                child: GridView.builder(
                    padding:const EdgeInsets.only(top: 10,),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        childAspectRatio: 6/7,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8
                    ),
                    itemCount: searchtf? imageDList.length:imageDList.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return Container(
                        margin: EdgeInsets.only(top: 3.sp,left: 3.sp,right: 3.sp),
                        decoration: DecorationBox.allBoxDecoration,
                        child: MaterialButton(
                          padding: const EdgeInsets.fromLTRB(10,10, 10, 10),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          onPressed: () =>panelProvider.aboutScanBar(),
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(imageDList[index].title,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),maxLines: 1,overflow: TextOverflow.ellipsis,),
                                          const Text("Готовиться",style: TextStyle(color: Colors.orangeAccent),),
                                        ],),
                                      Container(
                                          alignment: Alignment.topLeft,
                                          height: 40,
                                          width: 40,
                                          child: TextButton(onPressed: (){}, child: const Icon(Icons.visibility_outlined,size: 25,color: Colors.black45,)))
                                    ],),
                                  Container(
                                      padding:const EdgeInsets.only(top: 10),
                                      child: Text("У кого: ${providersClass.profAccaunt[index].surname} ${providersClass.profAccaunt[index].name}/${providersClass.profAccaunt[index].position}",style: TextStyle(color: Colors.black.withOpacity(0.7)),)
                                  ),
                                  Container(
                                      padding:const EdgeInsets.only(top: 5),
                                      child: Text("Заказов: ${imageDList[index].counts}",style: TextStyle(color: Colors.black.withOpacity(0.7)),)
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(child: Text("Внесено: ${imageDList[index].price} сум",style: TextStyle(color: Colors.black.withOpacity(0.7)),)),
                                        SizedBox(width: 15.sp,),
                                        SizedBox(child: imageDList[index].price!=0?Image.asset("assets/money-recive.png",color: Colors.blue,height: 25,width: 25,):Container()),
                                      ],),
                                  ),
                                  Text("Сумма: ${imageDList[index].price} сум",style: TextStyle(color: Colors.redAccent.withOpacity(0.7)),),
                                  Container(
                                      padding:const EdgeInsets.only(top: 5),
                                      child: Text("Клиент: ${providersClass.profAccaunt[index].surname} ${providersClass.profAccaunt[index].name}",style: TextStyle(color: Colors.black.withOpacity(0.7)),)),
                                ],),
                              Positioned(
                                bottom: 50, left: 0, right: 0,
                                child: Container(
                                  padding:const EdgeInsets.only(top: 15),
                                  alignment: Alignment.bottomCenter,
                                  child: MaterialButton(minWidth: MediaQuery.of(context).size.width*0.18,
                                    onPressed: (){},
                                    color: Colors.blue,
                                    child: const Text("Add offer",style: TextStyle(color:Colors.white),),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom:0, left: 0, right: 0,
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  child: MaterialButton(minWidth: MediaQuery.of(context).size.width*0.18,
                                    onPressed: (){},
                                    color: const Color.fromRGBO(43, 203, 186, 1),
                                    child: const Text("Pay order",style: TextStyle(color:Colors.white),),
                                  ),
                                ),
                              ),
                            ],),
                        ),
                      );
                    }),
              ),
            ],),
        );
      });
      }),
    );
  }
}
