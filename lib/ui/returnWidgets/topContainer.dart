import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/colors/myColors.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopContainer extends StatelessWidget {
  const TopContainer(
      {Key? key,
      this.providers,
      this.providersClass,
      required this.index,
      this.rowIndex})
      : super(key: key);
  final dynamic providers;
  final ProvidersClass? providersClass;
  final dynamic rowIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 3),
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
              borderRadius: RadiusBorder.radius_8,
              boxShadow: <BoxShadow>[
                ShadowBox.boxShadowOne,
              ],
              color: Colors.white),
          height: 60,
          width: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                height: double.maxFinite,
                padding: EdgeInsets.zero,
                child: IconButton(
                  icon: Image.asset(
                    "assets/search_of_on.png",
                    height: 30,
                    width: 30,
                  ),
                  iconSize: 30,
                  color: AppColor.grey,
                  onPressed: () {
                    _searchList(context);
                    providers.searchTf(false);
                    // lottietf;
                  },
                ),
              ),
              Expanded(
                child: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(5, 5, 10, 0),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Поиск',
                          hintStyle: AppTextStyle.grey_16_txt,
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                              onPressed: () {
                                providers.searchTf(true);
                                providersClass!.profSearchAccaunt.clear();
                                providers.tvTextTf2("");
                                providersClass!.lottieTf(true);
                              },
                              icon: const Icon(Icons.close,
                                  color: AppColor.grey))),
                      style: AppTextStyle.grey_16_txt,
                      onChanged: (tvtext) {
                        providers.tvTextTf2(tvtext);
                      },
                    )),
              ),
            ],
          ),
        ),
        index == 1
            ? Container(
                alignment: Alignment.topRight,
                // margin: EdgeInsets.fromLTRB(0, 16, providersClass.visible ? 30 : 60, 0),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: RadiusBorder.radius_8,
                    boxShadow: <BoxShadow>[ShadowBox.boxShadowOne],
                    color: Colors.white),
                child: MaterialButton(
                  padding: EdgeInsets.zero,
                  shape: RadiusBorder.roundedRadius_8,
                  onPressed: () {
                    if (rowIndex == 1) {
                      if (providers.row_vectortfbox == false) {
                        providers.rowVectorBox(true);
                      } else {
                        providers.rowVectorBox(false);
                      }
                    } else {
                      if (providers.row_vectortfCtg == false) {
                        providers.rowVector(true);
                      } else {
                        providers.rowVector(false);
                      }
                    }
                    // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const ExsaplePage()));
                  },
                  child: Image.asset(
                    'assets/row-vertical.png',
                    height: double.maxFinite,
                    width: double.maxFinite,
                  ),
                ),
              )
            : index == 2
                ? Container(
                    // margin: EdgeInsets.fromLTRB(
                    //     15, 16, providersClass.visible ? 30 : 60,
                    //     0),
                    alignment: Alignment.topLeft,
                    height: 60,
                    width: 220,
                    decoration: BoxDecoration(
                        borderRadius: RadiusBorder.radius_8,
                        boxShadow: <BoxShadow>[ShadowBox.boxShadowOne],
                        color: Colors.white),
                    child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Terapevt',
                              border: InputBorder.none,
                              hintStyle: AppTextStyle.grey_16_txt,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  providers.searchTf(true);
                                  providersClass!.profSearchAccaunt.clear();
                                  providers.tvTextTf2("");
                                  providersClass!.lottieTf(true);
                                },
                                splashColor: Colors.red,
                                icon: const Icon(Icons.close_sharp,
                                    color: AppColor.grey),
                              )),
                          controller: TextEditingController(
                              text:
                                  providers.searchtf ? "" : providers.tvText2),
                          style: AppTextStyle.grey_17_txt,
                          onChanged: (tvtext) {
                            providers.tvTextTf2(tvtext);
                          },
                        )),
                  )
                : index == 3
                    ? Row(
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            decoration: DecorationBox.allBoxDecoration,
                            height: 60,
                            width: 60,
                            child: MaterialButton(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              onPressed: () {},
                              child: Image.asset(
                                'assets/filter-remove.png',
                                height: double.maxFinite,
                                width: double.maxFinite,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            margin: const EdgeInsets.only(left: 16, right: 5),
                            height: 60,
                            width: 60,
                            decoration: DecorationBox.allBoxDecoration,
                            child: MaterialButton(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              onPressed: () {},
                              child: Image.asset(
                                'assets/scan-barcode.png',
                                color: Colors.blue,
                                height: double.maxFinite,
                                width: double.maxFinite,
                              ),
                            ),
                          )
                        ],
                      )
                    : Container(),
      ],
    );
  }

  void _searchList(context) {
    Consumer<ProvidersClass>(builder: (context, providersClass, child) {
      return Consumer<PanelProvider>(builder: (context, panelProvider, child) {
        for (var element in providersClass.profAccaunt) {
          if (element.name == panelProvider.tvText2 ||
              element.surname == panelProvider.tvText2) {
            // element.price = 0;
            providersClass.profSearchAccaunt.add(element);
            providersClass.lottieTf(true);
          }
        }
        if (providersClass.profSearchAccaunt.isEmpty) {
          providersClass.lottieTf(false);
        }
        return Container();
      });
    });
  }
}
