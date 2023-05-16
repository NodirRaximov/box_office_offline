import 'package:box_office_offline/model/imagesData.dart';
import 'package:box_office_offline/ui/ListsFile.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:box_office_offline/widgets/panelWidgets/getxClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
List<ImagesData> searchList = [];

class CustomDialog extends GetView<GetXClass> {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    // runSearch(value);
                  });
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "Search",
                  suffixIcon: Image.asset('assets/search_of_on.png'),
                ),
                // suffixIconStart: "assets/search_of_on.png",
              ),
              SizedBox(height: 10.sp,),
              Expanded(
                flex: 8,
                child: Obx(() =>  ListView.builder(
                        itemCount: 30,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.network(
                                'url',
                                height: 35.sp,
                                width: 35.sp,
                              ),
                              SizedBox(
                                width: 10.sp,
                              ),
                              Text(
                                  ('title'+" "+'subtitle'+" "+'status'),style: AppTextStyle.panel_14_txt,)
                            ],
                          );
                        })
                ),
              )
            ],
          ),
        ));
  }
}

// class _CustomDialogState extends State<CustomDialog> {
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//   final TextEditingController controller = TextEditingController();
//   String initialCountry = 'UZ';
//   PhoneNumber number = PhoneNumber(isoCode: 'UZ');
//
//   List<ImagesData> list = imageDList;
//
//   @override
//   void initState() {
//     searchList = list;
//     super.initState();
//   }
//
//   void runSearch(String enteredKeyword) {
//     List<ImagesData> results = [];
//     if (enteredKeyword.isEmpty) {
//       results = list;
//     } else {
//       results = list
//           .where((element) => element.title
//               .toLowerCase()
//               .contains(enteredKeyword.toLowerCase()))
//           .toList();
//     }
//     setState(() {
//       searchList = results;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           SizedBox(
//             child: TextFormField(
//               onChanged: (value) {
//                 setState(() {
//                   runSearch(value);
//                 });
//               },
//               decoration: InputDecoration(
//                 border: const OutlineInputBorder(),
//                 labelText: "Search",
//                 suffixIcon: Image.asset('assets/search_of_on.png'),
//               ),
//               // suffixIconStart: "assets/search_of_on.png",
//             ),
//           ),
//           SingleChildScrollView(
//             child: Column(children: [
//               searchList.isNotEmpty
//                   ? ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: searchList.length,
//                       itemBuilder: (context, index) {
//                         return Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Image.network(
//                               searchList[index].url,
//                               height: 35.sp,
//                               width: 35.sp,
//                             ),
//                             SizedBox(
//                               width: 10.sp,
//                             ),
//                             Text(
//                                 "${searchList[index].title} ${searchList[index].subtitle} ${searchList[index].status}")
//                           ],
//                         );
//                       })
//                   : Text(
//                       "Not Data",
//                       style: AppTextStyle.panel_16_txt,
//                     ),
//             ]),
//           )
//         ],
//       ),
//     ));
//   }
//
//   void getPhoneNumber(String phoneNumber) async {
//     PhoneNumber number =
//         await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'UZ');
//
//     setState(() {
//       this.number = number;
//     });
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
// }
