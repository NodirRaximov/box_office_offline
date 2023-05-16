import 'package:box_office_offline/model/imagesData.dart';
import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/items/allItemsShop/allListItems/boxListItems.dart';
import 'package:box_office_offline/ui/items/allItemsShop/allListItems/categoryListItems.dart';
import 'package:box_office_offline/ui/items/allItemsShop/allListItems/profListItems.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AllListItems extends StatelessWidget {
  const AllListItems(
      {Key? key,
      this.imageDList,
      this.imageSearchList,
      required this.indexWidget,
      this.doctorId})
      : super(key: key);

  final List<ImagesData>? imageDList;
  final List<ImagesData>? imageSearchList;
  final int indexWidget;
  final int? doctorId;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Consumer<ProvidersClass>(builder: (context, providersClass, child) {
      return GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: (height) *
                  (width - 40) /
                  (providersClass.visible ? 3000 : 3600),
              childAspectRatio: providersClass.visible
                  ? widthToHeight(width, height)
                      ? 1 / 1.15.spMin

                      /// visible show to table
                      : 1 / 0.9

                  /// visible show to desktob
                  : widthToHeight(width, height)
                      ? 7.5 / 9.1.spMin

                      /// visible hide to table
                      : 7.5 / 7.1.spMin,

              /// visible hide to desktob
              crossAxisSpacing: 8,
              mainAxisSpacing: 8),
          itemCount: providersClass.searchtf
              ? imageDList!.length
              : imageSearchList!.length,
          itemBuilder: (BuildContext ctx, int index) {
            return indexWidget == 1
                ? BoxListItems(
                    index: index,
                  )
                : indexWidget == 2
                    ? ProfListItems(index: index)
                    : indexWidget == 3
                        ? CategoryListItems(index: index)
                        : Container();
          });
    });
  }

  bool widthToHeight(width, height) {
    if (width - height < 500) {
      return true;
    } else {
      return false;
    }
  }

  Container returnImg(image, context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
      height: 114.sp,
      child: ClipRRect(
        borderRadius: RadiusBorder.radius_8,
        child: SizedBox.fromSize(
            child: Image.network(
          image,
          fit: BoxFit.fill,
        )),
      ),
    );
  }
}

bool widthToHeight(width, height) {
  if (width - height < 500) {
    return true;
  } else {
    return false;
  }
}

Container returnImg(image, context) {
  return Container(
    margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
    height: 114.sp,
    child: ClipRRect(
      borderRadius: RadiusBorder.radius_8,
      child: SizedBox.fromSize(
          child: Image.network(
        image,
        fit: BoxFit.fill,
      )),
    ),
  );
}
