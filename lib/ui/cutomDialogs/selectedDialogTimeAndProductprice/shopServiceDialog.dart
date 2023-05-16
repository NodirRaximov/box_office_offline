import 'package:box_office_offline/providers/dateAndTimeProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/colors/myColors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopServiceDialog {
  ShopServiceDialog._();

  static serviceDialog(context){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Consumer<ProvidersClass>(builder: (context,providersClass,child){
            return Consumer<DateAndTimeProvider>(builder: (context,dateProvider,child){
              return AlertDialog(
                title: SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Stack(children: <Widget>[
                    const Positioned(
                        top: 8,
                        left: 1,
                        right: 1,
                        bottom: 1,
                        child: Text("Select time",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 25))),
                    Positioned(
                        top: 0,
                        right: 2,
                        child: IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              Navigator.pop(context);
                            }))
                  ]),
                ),
                contentPadding:
                const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                              textAlign: TextAlign.start, "Shifokor tanlang:")),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.28,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: providersClass.profAccaunt.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: const EdgeInsets.all(5),
                                width: 200,
                                decoration: providersClass.profAccaunt[index]
                                    .id == dateProvider.selectedAccountId?DecorationBox.allBoxDecorationBorderBlue:DecorationBox.allBoxDecoration,
                                child: MaterialButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    onPressed: () {
                                      dateProvider.selectProf(providersClass.profAccaunt[index].id);

                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              10, 20, 10, 10),
                                          height: 90,
                                          width: 90,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 3,
                                                  color: providersClass.profAccaunt[index]
                                                      .id == dateProvider.selectedAccountId
                                                      ? Colors.blue
                                                      : Colors.white),
                                              borderRadius:
                                              BorderRadius.circular(50),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      "${providersClass.profAccaunt[index].url}"),
                                                  fit: BoxFit.cover)),
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 5, 5, 5),
                                            width: double.maxFinite,
                                            child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "${("${providersClass.profAccaunt[index].surname} ${providersClass.profAccaunt[index].name}")} ",
                                                      style: TextStyle(
                                                          color: providersClass.profAccaunt[index]
                                                              .id == dateProvider.selectedAccountId
                                                              ? Colors.blue
                                                              : AppColor.panelBlack,
                                                          fontWeight:
                                                          FontWeight.w500,
                                                          fontSize: 16),
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      textAlign: TextAlign.start,
                                                      maxLines: 1),
                                                  Container(
                                                    padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 5, 0, 3),
                                                    child: Text(
                                                      "${providersClass.profAccaunt[index].position}",
                                                      style: const TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 127, 146, 160),
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 0, 0),
                                                    child: Row(children: [
                                                      const Text("Qabul: ",
                                                          style: TextStyle(
                                                            color: Color.fromARGB(
                                                                255,
                                                                127,
                                                                146,
                                                                160),
                                                          )),
                                                      Text(
                                                        "${providersClass.profAccaunt[index].reception} ",
                                                        style: const TextStyle(
                                                            color: Color.fromARGB(
                                                                255,
                                                                127,
                                                                146,
                                                                160),
                                                            fontSize: 12),
                                                      ),
                                                      Text(
                                                        "(32)",
                                                        style: TextStyle(
                                                            color: Colors.blue
                                                                .withOpacity(0.8),
                                                            fontSize: 12),
                                                      )
                                                    ]),
                                                  ),
                                                  Container(
                                                    padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 3, 0, 3),
                                                    child: Row(children: [
                                                      const Text("Ish vaqti: ",
                                                          style: TextStyle(
                                                            color: Color.fromARGB(
                                                                255,
                                                                127,
                                                                146,
                                                                160),
                                                          )),
                                                      Text(
                                                        "${providersClass.profAccaunt[index].timeWork}",
                                                        style: TextStyle(
                                                            color: Colors.blue
                                                                .withOpacity(0.8),
                                                            fontSize: 12),
                                                      ),
                                                    ]),
                                                  ),
                                                ]),
                                          ),
                                        ),
                                      ],
                                    )),
                              );
                            }),
                      ),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                                "Uchrashuv kunini tanlang: ${dateProvider.selectData.toString().substring(3)}"),
                            IconButton(
                              onPressed: () {},
                              icon:
                              const Icon(Icons.keyboard_arrow_down, size: 25),
                              padding: const EdgeInsets.only(bottom: 3),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.07,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: dateProvider.daylistofmonth.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                  height: 80,
                                  width: 80,
                                  child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 5, top: 5, bottom: 5),
                                      decoration: dateProvider.selectDayId == dateProvider.daylistofmonth[index].id
                                          ? DecorationBox.linerGradientShadow
                                          : BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [ShadowBox.boxShadowOne],
                                          borderRadius:
                                          RadiusBorder.radius_8),
                                      child: MaterialButton(
                                        shape: RadiusBorder.roundedRadius_8,
                                        onPressed: () {
                                          dateProvider.selectedDay(dateProvider.daylistofmonth[index].id);
                                        },
                                        child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                textAlign: TextAlign.center,
                                                "${dateProvider.daylistofmonth[index].day}",
                                                style: TextStyle(
                                                    fontSize: 23,
                                                    color: dateProvider.selectDayId == dateProvider.daylistofmonth[index].id
                                                        ? Colors.white
                                                        : Colors.black),
                                              ),
                                              Text(
                                                  textAlign: TextAlign.center,
                                                  dateProvider.daylistofmonth[index].weekDay,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: dateProvider.selectDayId == dateProvider.daylistofmonth[index].id
                                                          ? Colors.white
                                                          : Colors.black)),
                                            ]),
                                      )));
                            }),
                      ),
                      SizedBox(
                        height: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("Uchrashuv vaqtini tanlang: "),
                            Text("${dateProvider.daylistofmonth[dateProvider.selectDayId-1].day}.${dateProvider.selectDayText(dateProvider.selectDayId)}.${dateProvider.daylistofmonth[dateProvider.selectDayId-1].year}"),
                            IconButton(
                              onPressed: () {},
                              padding: const EdgeInsets.only(bottom: 3),
                              icon:
                              const Icon(Icons.keyboard_arrow_down, size: 25),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: dateProvider.daylistofmonth[dateProvider.selectDayId-1].weekDay == "ВС"
                            ? MediaQuery.of(context).size.height * 0.1
                            : 200,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 80,
                                childAspectRatio: 3 / 4,
                                crossAxisSpacing: 6,
                                mainAxisSpacing: 6),
                            itemCount: dateProvider.timelisttoday.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return dateProvider.daylistofmonth[dateProvider.selectDayId-1].weekDay != "ВС"
                                  ? Container(
                                  decoration: dateProvider.selectTimeId == dateProvider.timelisttoday[index].id
                                      ? DecorationBox.linerGradientShadow
                                      : BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: RadiusBorder.radius_8,
                                      boxShadow: [
                                        ShadowBox.boxShadowOne
                                      ]),
                                  child: MaterialButton(
                                    onPressed: () {
                                      dateProvider.selectTime(dateProvider.timelisttoday[index].id);
                                    },
                                    shape: RadiusBorder.roundedRadius_8,
                                    child: Container(
                                        alignment: Alignment.center,
                                        child:
                                        // providersClass.oldidday==index?Image.network(imglistshop[0].url):
                                        Text(
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: dateProvider.selectTimeId == dateProvider.timelisttoday[index].id
                                                    ? Colors.white
                                                    : Colors.black87),
                                            "${dateProvider.timelisttoday[index].hour.toString().length == 1 ? "0${dateProvider.timelisttoday[index].hour}" : dateProvider.timelisttoday[index].hour} : ${dateProvider.timelisttoday[index].minute.toString().length == 1 ? "0${dateProvider.timelisttoday[index].minute}" : dateProvider.timelisttoday[index].minute}")),
                                  ))
                                  : Container();
                            }),
                      ),
                      Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          height: 40,
                          width: 120,
                          decoration: DecorationBox.linerGradientShadow,
                          child: MaterialButton(
                              shape: RadiusBorder.roundedRadius_5,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Tanlash",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white))))
                    ],
                  ),
                ),
              );
            });
          });
        });
  }



}

