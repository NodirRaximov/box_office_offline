import 'package:box_office_offline/model/imagesData.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/items/allItemsShop/allLineListItems/boxLineListItems.dart';
import 'package:box_office_offline/ui/items/allItemsShop/allLineListItems/profLineListItems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class AllLineListItems extends StatelessWidget {
  const AllLineListItems(
      {Key? key,

      this.imageDList,
      this.imageSearchList,
      required this.indexWidget})
      : super(key: key);


  final List<ImagesData>? imageDList;
  final List<ImagesData>? imageSearchList;
  final int indexWidget;

  bool widthToHeight(width, height) {
    if (width - height < 500) {
      return true;
    } else {
      return false;
    }
  }

  // Future apicall() async{
  //   // if(id==1) {
  //   http.Response response;
  //   response = await http.get(Uri.https('reqres.in', 'api/users'));
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       // stringResponse = response.body;
  //       mapResponse = json.decode(response.body);
  //       listResponse = mapResponse['data'];
  //     });
  //   }
  //   return listResponse;
  //   // }else{
  //   //   http.Response response;
  //   //   response = await http.get(Uri.https('reqres.in', 'api/users?page=$id'));
  //   //   if (response.statusCode == 200) {
  //   //     setState(() {
  //   //       // stringResponse = response.body;
  //   //       mapResponse = json.decode(response.body);
  //   //       listResponse = mapResponse['data'];
  //   //     });
  //   //   }
  //   //   return listResponse;
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Consumer<ProvidersClass>(builder: (context, providersClass, child) {
      return FutureBuilder(
        // future: apicall(),
          builder: (context, snapshoot) {
            if (snapshoot.data == null) {
              return GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: (height) *
                          (width - 40) /
                          (providersClass.visible ? 800 : 1500),
                      childAspectRatio: providersClass.visible
                          ? widthToHeight(width, height)
                          ? 10 / 2.3.spMin

                      /// visible show to table
                          : 10 / 1.8.spMin

                      /// visible show to desktob
                          : widthToHeight(width, height)
                          ? 10 / 2.5.spMin

                      /// visible hide to table
                          : 10 / 1.8.spMin,

                      /// visible hide to desktob
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemCount: providersClass.searchtf
                      ? imageDList!.length
                      : imageSearchList!.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return indexWidget == 1
                        ? BoxLineListItems(index: index)
                        : indexWidget == 2
                        ? ProfLineListItems(index: index)
                        : Container();
                  });
            } else {
              return Container();
            }
          });
    });
  }

  retunrShimmerText(
      txt, textStyle, String? subtitle, TextStyle? subtitleStyle) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[350]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: RadiusBorder.radius_5),
        child: Row(
          children: [
            Text(
              txt,
              style: textStyle,
              maxLines: 1,
              textAlign: TextAlign.start,
            ),
            Text(
              subtitle!,
              style: subtitleStyle,
            ),
          ],
        ),
      ),
    );
  }

  retunrNoShimmerText(
      txt, textStyle, String? subtitle, TextStyle? subtitleStyle) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: RadiusBorder.radius_5),
      child: Row(
        children: [
          Text(
            txt,
            style: textStyle,
            maxLines: 1,
            textAlign: TextAlign.start,
          ),
          Text(
            subtitle!,
            style: subtitleStyle,
          ),
        ],
      ),
    );
  }
}
