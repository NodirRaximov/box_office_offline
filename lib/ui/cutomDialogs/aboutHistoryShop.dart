import 'package:box_office_offline/providers/historyProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class AboutHistoryShop extends StatelessWidget {
  const AboutHistoryShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProvidersClass>(builder: (context,providersClass,child){
      return Consumer<HistoryProvider>(builder: (context,historyProvider,child){
        return Stack(alignment: Alignment.center,
            children: [
              historyProvider.dialogshow
                  ? GestureDetector(
                onTap: () {
                  historyProvider.increment();
                  historyProvider.indexOfOffer = 0;
                },
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  color: const Color.fromARGB(160, 0, 0, 0),
                ),
              )
                  : Container(),
              historyProvider.dialogshow ?
              Container(
                margin: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                alignment: Alignment.topLeft,
                height: MediaQuery.of(context).size.height * 0.95,
                width: MediaQuery.of(context).size.width * 0.88,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white,),
                child: Stack(
                  children: [
                    Column(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(65, 0, 0, 0),
                            ),
                            const SizedBox.square(child: Text(
                              "О предложении", style: TextStyle(fontSize: 25),),),
                            MaterialButton(
                              height: 50,
                              minWidth: 50,
                              onPressed: () {
                                historyProvider.increment();
                                historyProvider.indexOfOffer = 0;
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              child: Image.asset("assets/close-circle.png"),)
                          ],),
                        Expanded(
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                              child: SingleChildScrollView(
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: List.generate(
                                                  providersClass.imglistshop.length, (index) =>
                                                  Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 150,
                                                        width: 150,
                                                        child: InkWell(
                                                          onTap: () {
                                                            historyProvider.aboutTheOffer(index);
                                                          },
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius
                                                                    .circular(10),
                                                                image: DecorationImage(
                                                                    image: NetworkImage(
                                                                        providersClass.imglistshop[index].url))
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      historyProvider.indexOfOffer == index
                                                          ? Container(height: 5,
                                                        width: 150,
                                                        decoration: const BoxDecoration(
                                                            borderRadius: BorderRadius
                                                                .vertical(
                                                                top: Radius
                                                                    .circular(5)),
                                                            color: Colors.blue),)
                                                          : Container(),
                                                    ],
                                                  )
                                              )
                                          ),
                                        ),
                                        Container(
                                          height: 1,
                                          width: MediaQuery.of(context).size.width *
                                              (providersClass.imglistshop.length / 10),
                                          color: Colors.blue,),
                                        Container(
                                            padding: const EdgeInsets.all(10),
                                            child: Text("${providersClass.imglistshop[historyProvider.indexOfOffer]
                                                .title} ${providersClass.imglistshop[historyProvider.indexOfOffer]
                                                .subtitle}",
                                                textAlign: TextAlign.start,
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.normal))),
                                        Container(
                                            padding: const EdgeInsets.all(5),
                                            child: const Text("Параметры:",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(fontSize: 18,
                                                    fontWeight: FontWeight.bold))),
                                        Container(
                                            padding: const EdgeInsets.all(5),
                                            child: Text(
                                                "Дата производства: ${providersClass.imglistshop[historyProvider.indexOfOffer].data}",
                                                textAlign: TextAlign.start)),
                                        Container(
                                            padding: const EdgeInsets.all(5),
                                            child: Text(
                                                "Оптический зум: ${providersClass.imglistshop[historyProvider.indexOfOffer].counts}",
                                                textAlign: TextAlign.start)),
                                        Container(
                                            padding: const EdgeInsets.all(5),
                                            child: Text(
                                                "Автофокус: ${providersClass.imglistshop[historyProvider.indexOfOffer].queue} zoom",
                                                textAlign: TextAlign.start)),
                                        Container(
                                            padding: const EdgeInsets.all(5),
                                            child: const Text(
                                                "Упаковка: Superbox... еще",
                                                textAlign: TextAlign.start)),
                                        Container(
                                            padding: const EdgeInsets.all(5),
                                            child: const Text("Описание:",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(fontSize: 18,
                                                fontWeight: FontWeight.bold,),)),
                                        Container(
                                            padding: const EdgeInsets.all(5),
                                            child: const ReadMoreText(
                                              "Hurmatli ODILOV FARXAD RAVSHANOVICH, 3709940 -sonli lot bo'yicha auksion/tanlovda ishtirok etish uchun arizalar qabul qilish vaqti yakunlanganini ma`lum qilamiz. 3709940-sonli lot bo`yicha elektron savdo 01.12.2022 yil 10:00da o`tkaziladi.",
                                              textAlign: TextAlign.start,
                                              trimLines: 1,
                                              trimMode: TrimMode.Line,
                                              trimCollapsedText: " еще",
                                              trimExpandedText: " ^ close",
                                              moreStyle: TextStyle(fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blue),)),
                                        Container(
                                            padding: const EdgeInsets.all(5),
                                            child: const Text("Общая информация:",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(fontSize: 18,
                                                    fontWeight: FontWeight.bold))),
                                        Container(
                                            padding: const EdgeInsets.all(5),
                                            child: Text(
                                                "В наличии: ${providersClass.imglistshop[historyProvider.indexOfOffer].price} piece",
                                                textAlign: TextAlign.start)),
                                        Container(
                                            padding: const EdgeInsets.all(5),
                                            child: const Text(
                                                "Место: Полка слева где фотоапараты ",
                                                textAlign: TextAlign.start)),
                                        Container(
                                            padding: const EdgeInsets.all(5),
                                            child: Text(
                                                "Дата поступления: ${providersClass.imglistshop[historyProvider.indexOfOffer].data}",
                                                textAlign: TextAlign.start)),
                                        Container(
                                            padding: const EdgeInsets.all(5),
                                            child: const Text(
                                                "Ответственные специалисты:",
                                                textAlign: TextAlign.start)),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: List.generate(
                                                  providersClass.imglistshop.length, (index) =>
                                                  Column(
                                                    children: [
                                                      Container(
                                                        alignment: Alignment.topLeft,
                                                        height: historyProvider.indexOfDoctor == index ? 70 : 60,
                                                        width: historyProvider.indexOfDoctor == index ? 90 : 60,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: NetworkImage(
                                                                    providersClass.imglistshop[index].url)
                                                            ),
                                                            borderRadius: BorderRadius
                                                                .circular(30)
                                                        ),
                                                        child: InkWell(onTap: () {
                                                          historyProvider.aboutTheDoctor(index);
                                                        },),
                                                      ),
                                                      historyProvider.indexOfDoctor == index
                                                          ? const Text(
                                                          "Мариам Азимова",
                                                          textAlign: TextAlign.center)
                                                          : const Text(""),
                                                    ],
                                                  )
                                              )
                                          ),
                                        ),
                                      ])
                              ),
                            )
                        ),
                      ],),
                    Positioned(right: 0, top: 0, bottom: 0,
                      child:  Container(
                        width: 30, height: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              stops: const [0.0, 0.3, 0.5, 0.7, 1],
                              colors: [
                                Colors.black12.withOpacity(0.0),
                                Colors.black12.withOpacity(0.03),
                                Colors.black12.withOpacity(0.07),
                                Colors.black12.withOpacity(0.1),
                                const Color.fromARGB(50, 0, 0, 0)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.topRight),
                        ),
                      ),
                    ),
                    Positioned(left: 0, top: 0, bottom: 0,
                      child:  Container(
                        width: 30, height: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              stops: const [0.1, 0.3, 0.5, 0.7, 1],
                              colors: [
                                const Color.fromARGB(50, 0, 0, 0),
                                Colors.black12.withOpacity(0.1),
                                Colors.black12.withOpacity(0.07),
                                Colors.black12.withOpacity(0.03),
                                Colors.black12.withOpacity(0.0),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.topRight),
                        ),
                      ),
                    ),
                  ],
                ),)
                  : Container()
            ]);
      });
    });
  }
}
