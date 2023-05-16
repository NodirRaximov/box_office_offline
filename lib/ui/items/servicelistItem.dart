import 'package:box_office_offline/model/imagesData.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceListItem extends StatelessWidget {
  const ServiceListItem({Key? key, required this.index, required this.item, required this.imagesData}) : super(key: key);
  final List<ImagesData> imagesData;
  final int index;
  final ImagesData item;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 550,
      height: 100,
      decoration: DecorationBox.allBoxDecoration,
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(item.url),fit: BoxFit.cover)
          ),
        ),
        title: Text(item.title,style: AppTextStyle.panel_16_txt,),
        subtitle: Column(children: [
          Row(children: [
            retunrNoShimmerText( "В наличии: ", AppTextStyle.grey_13_txt, "${item.counts}", AppTextStyle.success_13_txt),
            SizedBox(width: 5.sp,),
            retunrNoShimmerText( "Срок годности: ${item.data}",AppTextStyle.grey_13_txt, "",null),
            SizedBox(width: 5.sp,),
            retunrNoShimmerText( "Страна: ${item.queue}",AppTextStyle.grey_13_txt, "",null),
          ],),
          SizedBox(height: 5.sp,),
          retunrNoShimmerText( "Место: ${item.queue}",AppTextStyle.grey_13_txt, "",null),
        ],
        ),
        trailing: Container(height: double.maxFinite,
        alignment: Alignment.bottomRight,
        child: Row(children: [
          retunrNoShimmerText(item.price.toString(), AppTextStyle.panel_14_txt, 'UZS', AppTextStyle.grey_13_txt)
        ],),
        ),
      ),
    );
  }
  retunrNoShimmerText(txt,textStyle,String? subtitle,TextStyle? subtitleStyle) {
    return Row(
      children: [
        Text(
          txt,
          style: textStyle,
          maxLines: 1,textAlign: TextAlign.start,
        ),
        Text(
          subtitle!,
          style: subtitleStyle,
        ),
      ],
    );
  }
}
