import 'package:box_office_offline/model/dropItems.dart';
import 'package:box_office_offline/model/imagesData.dart';
import 'package:box_office_offline/model/profAccauntData.dart';
import 'package:flutter/material.dart';

List<String> regionList = [
  "Tashkent",
  "Toshkent viloyati",
  "Samarqand",
  "Jizzax",
];


List<DropItems> statusList = [
  DropItems(id: 1,
      icon:
      "assets/reserve_drop.png",
      title: "Take"),
  DropItems(id: 2,
      icon:
      "assets/send_drop.png",
      title: "Send"),
  DropItems(id: 3,
      icon:
      "assets/check-circle_drop.png",
      title: "Ready"),
];


List<ImagesData> imageDListProf =  [
  ImagesData(
      brandOrService: false,
      id: 1,
      counts: 1,
      rowresult: false,
      url:
      "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
      title: "Title",
      subtitle: "Subtitle",
      subtitle2: "Subtitle2",
      data: "22.22.22",
      queue: 18,
      status: "В ожидании приема",
      img: "assets/shoppingcartopen.png",
      price: 2000.0),
  ImagesData(
      brandOrService: false,
      id: 2,
      counts: 1,
      rowresult: false,
      url:
      "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
      title: "Title",
      subtitle: "Subtitle",
      subtitle2: "Subtitle2",
      data: "22.22.22",
      queue: 18,
      status: "В ожидании приема",
      img: "assets/shoppingcartopen.png",
      price: 2000.0),
  ImagesData(
      brandOrService: false,
      id: 3,
      counts: 1,
      rowresult: false,
      url:
      "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
      title: "Title",
      subtitle: "Subtitle",
      subtitle2: "Subtitle2",
      data: "22.22.22",
      queue: 18,
      status: "В ожидании оплати",
      img: "assets/shoppingcartopen.png",
      price: 2000.0),
  ImagesData(
      brandOrService: false,
      id: 4,
      counts: 1,
      rowresult: false,
      url:
      "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
      title: "Title",
      subtitle: "Subtitle",
      subtitle2: "Subtitle2",
      data: "22.22.22",
      queue: 18,
      status: "Завнершенние",
      img: "assets/shoppingcartopen.png",
      price: 2000.0),
  ImagesData(
      brandOrService: false,
      id: 5,
      counts: 1,
      rowresult: false,
      url:
      "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
      title: "Title",
      subtitle: "Subtitle",
      subtitle2: "Subtitle2",
      data: "22.22.22",
      queue: 18,
      status: "В ожидании оптали",
      img: "assets/shoppingcartopen.png",
      price: 2000.0),
  ImagesData(
      brandOrService: false,
      id: 6,
      counts: 1,
      rowresult: false,
      url:
      "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
      title: "Title",
      subtitle: "Subtitle",
      subtitle2: "Subtitle2",
      data: "22.22.22",
      queue: 18,
      status: "В ожидании приема",
      img: "assets/shoppingcartopen.png",
      price: 2000.0),
  ImagesData(
      brandOrService: false,
      id: 7,
      counts: 1,
      rowresult: false,
      url:
      "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
      title: "Title",
      subtitle: "Subtitle",
      subtitle2: "Subtitle2",
      data: "22.22.22",
      queue: 18,
      status: "В ожидании приема",
      img: "assets/shoppingcartopen.png",
      price: 2000.0),
  ImagesData(
      brandOrService: false,
      id: 8,
      counts: 1,
      rowresult: false,
      url:
      "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
      title: "Title",
      subtitle: "Subtitle",
      subtitle2: "Subtitle2",
      data: "22.22.22",
      queue: 18,
      status: "В ожидании приема",
      img: "assets/shoppingcartopen.png",
      price: 2000.0),
  ImagesData(
      brandOrService: false,
      id: 9,
      counts: 1,
      rowresult: false,
      url:
      "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
      title: "Title0",
      subtitle: "Subtitle",
      subtitle2: "Subtitle2",
      data: "22.22.22",
      queue: 18,
      status: "В ожидании приема",
      img: "assets/shoppingcartopen.png",
      price: 2000.0),
  ImagesData(
      brandOrService: false,
      id: 10,
      counts: 1,
      rowresult: false,
      url:
      "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
      title: "Title",
      subtitle: "Subtitle",
      subtitle2: "Subtitle2",
      data: "22.22.22",
      queue: 18,
      status: "В ожидании приема",
      img: "assets/shoppingcartopen.png",
      price: 2000.0),
  ImagesData(
      brandOrService: false,
      id: 11,
      counts: 1,
      rowresult: false,
      url:
      "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
      title: "Title0",
      subtitle: "Subtitle",
      subtitle2: "Subtitle2",
      data: "22.22.22",
      queue: 18,
      status: "В ожидании приема",
      img: "assets/shoppingcartopen.png",
      price: 2000.0),
  ImagesData(
      brandOrService: false,
      id: 12,
      counts: 1,
      rowresult: false,
      url:
      "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
      title: "Title0",
      subtitle: "Subtitle",
      subtitle2: "Subtitle2",
      data: "22.22.22",
      queue: 18,
      status: "В ожидании приема",
      img: "assets/shoppingcartopen.png",
      price: 2000.0),
  ImagesData(
      brandOrService: false,
      id: 13,
      counts: 1,
      rowresult: false,
      url:
      "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
      title: "Title",
      subtitle: "Subtitle",
      subtitle2: "Subtitle2",
      data: "22.22.22",
      queue: 18,
      status: "Завершенние",
      img: "assets/shoppingcartopen.png",
      price: 2000.0),
];

List<ImagesData> imageDList = [
  ImagesData(
      brandOrService: true,
      id: 1,
      url:
      "https://www.pngkit.com/png/detail/10-107249_work-for-a-doctor-memes.png",
      title: "Nodir",
      subtitle: "Subtitle",
      subtitle2: "Subtitle2",
      data: "22.22.22",
      queue: 11,
      status: "Непринятие",
      img: "assets/shoppingcartopen.png",
      price: 20000000,
      rowresult: false,
      counts: 1),
  ImagesData(
      brandOrService: true,
      id: 2,
      counts: 1,
      url:
      "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
      title: "SDFASD",
      subtitle: "Subtitle",
      subtitle2: "Subtitle2",
      data: "22.22.22",
      queue: 1,
      status: "В ожидании оплати",
      img: "assets/shoppingcartopen.png",
      price: 20000,
      rowresult: false),
  ImagesData(
      brandOrService: true,
      id: 3,
      counts: 1,
      url:
      "https://www.pngkit.com/png/detail/10-107249_work-for-a-doctor-memes.png",
      title: "ASFDAS",
      subtitle: "Subtitle",
      subtitle2: "Subtitle2",
      data: "22.22.22",
      queue: 1,
      status: "Завершенние",
      img: "assets/shoppingcartopen.png",
      price: 2000000,
      rowresult: false),
  ImagesData(
      brandOrService: true,
      id: 4,
      counts: 1,
      url:
      "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
      title: "Title",
      subtitle: "ASFAF",
      subtitle2: "Subtitle2",
      data: "22.22.22",
      queue: 1,
      status: "В ожидании приема",
      img: "assets/shoppingcartopen.png",
      price: 20000,
      rowresult: false),
  ImagesData(
      brandOrService: true,
      id: 5,
      counts: 1,
      url:
      "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
      title: "THGR",
      subtitle: "Subtitle",
      subtitle2: "Subtitle2",
      data: "22.22.22",
      queue: 1,
      status: "В процессе",
      img: "assets/shoppingcartopen.png",
      price: 20000,
      rowresult: false),
  ImagesData(
      brandOrService: true,
      id: 6,
      counts: 1,
      url:
      "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
      title: "SHTRH",
      subtitle: "Subtitle",
      subtitle2: "Subtitle2",
      data: "22.22.22",
      queue: 1,
      status: "В ожидании приема",
      img: "assets/shoppingcartopen.png",
      price: 20000,
      rowresult: false),
  ImagesData(
      brandOrService: true,
      id: 7,
      counts: 1,
      url:
      "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
      title: "Title",
      subtitle: "Subtitle",
      subtitle2: "Subtitle2",
      data: "22.22.22",
      queue: 1,
      status: "В ожидании приема",
      img: "assets/shoppingcartopen.png",
      price: 20000,
      rowresult: false),
  ImagesData(
      brandOrService: true,
      id: 8,
      counts: 1,
      url:
      "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
      title: "Title",
      subtitle: "Subtitle",
      subtitle2: "Subtitle2",
      data: "22.22.22",
      queue: 1,
      status: "Отменёние",
      img: "assets/shoppingcartopen.png",
      price: 20000,
      rowresult: false),
  ImagesData(
      brandOrService: true,
      id: 9,
      counts: 1,
      url:
      "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
      title: "Title0",
      subtitle: "Subtitle",
      subtitle2: "Subtitle2",
      data: "22.22.22",
      queue: 1,
      status: "Отменёние",
      img: "assets/shoppingcartopen.png",
      price: 20000,
      rowresult: false),
  ImagesData(
      brandOrService: true,
      id: 10,
      counts: 1,
      url:
      "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
      title: "Title",
      subtitle: "Subtitle",
      subtitle2: "Subtitle2",
      data: "22.22.22",
      queue: 1,
      status: "Завершение",
      img: "assets/shoppingcartopen.png",
      price: 20000,
      rowresult: false),
  ImagesData(
      brandOrService: true,
      id: 11,
      counts: 1,
      url:
      "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
      title: "Title0",
      subtitle: "Subtitle",
      subtitle2: "Subtitle2",
      data: "22.22.22",
      queue: 1,
      status: "В ожидании приема",
      img: "assets/shoppingcartopen.png",
      price: 20000,
      rowresult: false),
  ImagesData(
      brandOrService: true,
      id: 12,
      counts: 1,
      url:
      "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
      title: "Title0",
      subtitle: "Subtitle",
      subtitle2: "Subtitle2",
      data: "22.22.22",
      queue: 1,
      status: "В ожидании приема",
      img: "assets/shoppingcartopen.png",
      price: 20000,
      rowresult: false),
  ImagesData(
      brandOrService: true,
      id: 13,
      counts: 1,
      url:
      "https://images-na.ssl-images-amazon.com/images/I/81aF3Ob-2KL._UX679_.jpg",
      title: "Title",
      subtitle: "Subtitle",
      subtitle2: "Subtitle2",
      data: "22.22.22",
      queue: 1,
      status: "В ожидании приема",
      img: "assets/shoppingcartopen.png",
      price: 20000,
      rowresult: false),
];

List<ProfAccauntData> profAccaunts = [
  ProfAccauntData(
    id: 1,
      queue:12,
      selectProf: false,
      url:
      "https://wallpapercave.com/wp/wp2789215.jpg",
      name: "Nodir",
      surname: "Raximov",
      lastname: "Sobirjon o'g'li",
      position: "Bosh Shifokor",
      reception: "navbat bilan",
      timeWork: "8:00 - 16:00"
  ),
  ProfAccauntData(
    id: 2,
      queue:12,
      selectProf: false,
      url:
      "https://www.pngkit.com/png/detail/10-107249_work-for-a-doctor-memes.png",
      name: "Nodirjon",
      surname: "Raximov",
      lastname: "Sobirjon o'g'li",
      position: "Bosh Shifokor",
      reception: "navbat bilan",
      timeWork: "8:00 - 16:00"
  ),
  ProfAccauntData(
    id: 3,
      queue:12,
      selectProf: false,
      url:
      "https://howigotjob.com/wp-content/uploads/2021/07/storyblocks-happy-doctor-standing-with-a-laptop_S8lrSrNa-z-SBI-325536810-scaled.jpg",
      name: "Nodir",
      surname: "Raximov",
      lastname: "Sobirjon o'g'li",
      position: "Bosh Shifokor",
      reception: "navbat bilan",
      timeWork: "8:00 - 16:00"
  ),
  ProfAccauntData(
    id: 4,
      queue:12,
      selectProf: false,
      url:
      "https://www.pngkit.com/png/detail/10-107249_work-for-a-doctor-memes.png",
      name: "Nodirjon",
      surname: "Raximov",
      lastname: "Sobirjon o'g'li",
      position: "Bosh Shifokor",
      reception: "navbat bilan",
      timeWork: "8:00 - 16:00"
  ),
  ProfAccauntData(
    id: 5,
      queue:12,
      selectProf: false,
      url:
      "https://www.pngkit.com/png/detail/10-107249_work-for-a-doctor-memes.png",
      name: "Nodir",
      surname: "Raximov",
      lastname: "Sobirjon o'g'li",
      position: "Bosh Shifokor",
      reception: "navbat bilan",
      timeWork: "8:00 - 16:00"
  ),
  ProfAccauntData(
    id: 6,
      queue:12,
      selectProf: false,
      url:
      "https://www.pngkit.com/png/detail/10-107249_work-for-a-doctor-memes.png",
      name: "Nodirjon",
      surname: "Raximov",
      lastname: "Sobirjon o'g'li",
      position: "Bosh Shifokor",
      reception: "navbat bilan",
      timeWork: "8:00 - 16:00"
  ),
  ProfAccauntData(
    id: 7,
      queue:12,
      selectProf: false,
      url:
      "https://www.pngkit.com/png/detail/10-107249_work-for-a-doctor-memes.png",
      name: "Nodir",
      surname: "Raximov",
      lastname: "Sobirjon o'g'li",
      position: "Bosh Shifokor",
      reception: "navbat bilan",
      timeWork: "8:00 - 16:00"
  ),
  ProfAccauntData(
    id: 8,
      queue:12,
      selectProf: false,
      url:
      "https://www.pngkit.com/png/detail/10-107249_work-for-a-doctor-memes.png",
      name: "Nodir",
      surname: "Raximov",
      lastname: "Sobirjon o'g'li",
      position: "Bosh Shifokor",
      reception: "navbat bilan",
      timeWork: "8:00 - 16:00"
  ),
  ProfAccauntData(
    id: 9,
      queue:12,
      selectProf: false,
      url:
      "https://www.pngkit.com/png/detail/10-107249_work-for-a-doctor-memes.png",
      name: "Nodir",
      surname: "Raximov",
      lastname: "Sobirjon o'g'li",
      position: "Bosh Shifokor",
      reception: "navbat bilan",
      timeWork: "8:00 - 16:00"
  ),
  ProfAccauntData(
    id: 10,
      queue:12,
      selectProf: false,
      url:
      "https://www.pngkit.com/png/detail/10-107249_work-for-a-doctor-memes.png",
      name: "Nodir",
      surname: "Raximov",
      lastname: "Sobirjon o'g'li",
      position: "Bosh Shifokor",
      reception: "navbat bilan",
      timeWork: "8:00 - 16:00"
  ),
  ProfAccauntData(
    id: 11,
      queue:12,
      selectProf: false,
      url:
      "https://www.pngkit.com/png/detail/10-107249_work-for-a-doctor-memes.png",
      name: "Nodirjon",
      surname: "Raximov",
      lastname: "Sobirjon o'g'li",
      position: "Bosh Shifokor",
      reception: "navbat bilan",
      timeWork: "8:00 - 16:00"
  ),
  ProfAccauntData(
    id: 12,
      queue:12,
      selectProf: false,
      url:
      "https://www.pngkit.com/png/detail/10-107249_work-for-a-doctor-memes.png",
      name: "Nodir",
      surname: "Raximov",
      lastname: "Sobirjon o'g'li",
      position: "Bosh Shifokor",
      reception: "navbat bilan",
      timeWork: "8:00 - 16:00"
  ),
  ProfAccauntData(
    id: 13,
      queue:12,
      selectProf: false,
      url:
      "https://www.pngkit.com/png/detail/10-107249_work-for-a-doctor-memes.png",
      name: "Nodir",
      surname: "Raximov",
      lastname: "Sobirjon o'g'li",
      position: "Bosh Shifokor",
      reception: "navbat bilan",
      timeWork: "8:00 - 16:00"
  ),

];
@override
void setState(Null Function() param0){
  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        // _dateOk =
        // "${selectedDate.day}/0${selectedDate.month}/${selectedDate.year}";
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text(
        //       "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
        // ));
      });
    }
  }

}

