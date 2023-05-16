
import 'dart:async';
import 'package:box_office_offline/model/dropItems.dart';
import 'package:box_office_offline/model/imagesData.dart';
import 'package:box_office_offline/model/profAccauntData.dart';
import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/providers/registerProviders.dart';
import 'package:box_office_offline/ui/ListsFile.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class ProvidersClass extends ChangeNotifier{
  bool _visible = false;

  bool get visible => _visible;

  void visibleshowdialog() {
    if (_visible == true) {
      _visible = false;
    } else {
      _visible = true;
    }
    notifyListeners();
  }

  bool _searchtf = true;
  bool get searchtf => _searchtf;

  void searchTf(tf){
    _searchtf=tf;
    notifyListeners();
  }

  String _genders = "";
  String get genders => _genders;
  String _professions = "";
  String get professions => _professions;
  String _coupons = "";
  String get coupons => _coupons;
  String _regiondrop = "";
  String get regiondrop => _regiondrop;
  String _dateOk = "00/00/0000";
  String get dateOk => _dateOk;

  void dateOkSet(){
    _dateOk="00/00/0000";
    notifyListeners();
  }
  // void setregions(txt){
  //   _regions=txt;
  //   notifyListeners();
  // }
  void setgenders(txt){
    _genders=txt;
    notifyListeners();
  }
  void setprofessions(txt){
    _professions=txt;
    notifyListeners();
  }
  void setcoupons(txt){
    _coupons=txt;
    notifyListeners();
  }
  void setregiondrop(txt){
    _regiondrop=txt;
    notifyListeners();
  }
  void allregisterset(index){
    if(index==0) {
      _genders = "";
      _professions = "";
      _coupons = "";
      _regiondrop = "";
      _dateOk = "00/00/0000";
    }else{
      _genders = "";
      _professions = "";
      _coupons = "";
      _regiondrop = "";
    }
    notifyListeners();
  }
  String statusDrop="";
  void setStatusDrop(txt){
    statusDrop=txt;
    notifyListeners();
  }
  String deliveryDrop="";
  void setDeliveryDrop(txt){
    deliveryDrop=txt;
    notifyListeners();
  }

  final List<ImagesData> _imglistshop = [];
  List<ImagesData> get imglistshop => _imglistshop;
  //
  // void addImgListShop(imgData){
  //   _imglistshop.add(imgData);
  //   notifyListeners();
  // }

  // void deletedImgListShop(index){
  //   _imglistshop.removeAt(index);
  //   notifyListeners();
  // }


  double _prises=0;
  double get prises=>_prises;

  void listprise(){
    _prises=0;
    for (var element in imglistshop) {
      _prises=_prises+(element.price*element.counts);
    }
    notifyListeners();
  }

  int _second=60;
  int get second=>_second;
  void setSecond(){
    _second=60;
    notifyListeners();
  }

  void startTime(bool tf){
    if (tf==false) {
      _second = 0;
    }else {

      Timer(const Duration(seconds: 1), () {
        if (second >0) {
          _second = second - 1;
          startTime(true);
        }
      });
    }
    notifyListeners();
  }

  bool _activIconBtn = true; // phone activate register
  bool get activIconBtn => _activIconBtn; // phone activate register

  void activIconbtn(bol){
    _activIconBtn=bol;
    notifyListeners();
  }

  void restartPositionData(){
    _dateOk="00/00/0000";
    _genders="";
    _professions="";
    _coupons="";
    _regiondrop="";
    _picture="";
    notifyListeners();
  }

  String _picture = "";
  String get picture => _picture;

  void showPicture(String pic) {
    _picture = pic;
    notifyListeners();
  }

  String _numbertv = "";
  String get numbertv => _numbertv;
  String _numberactiv = "";
  String get numberactiv => _numberactiv;

  void numberTv(txt){
    _numbertv=txt;
    notifyListeners();
  }

  bool _activBtn = false; // phone activate pvc cod
  bool get activBtn => _activBtn; // phone activate pvc cod

  void activbtn(bol){
    _activBtn=bol;
    notifyListeners();
  }

  void toast(String txt,context,color){

    showToast(txt,
        context: context,
        animation: StyledToastAnimation.slideFromTop,
        reverseAnimation: StyledToastAnimation.slideToTop,
        position: StyledToastPosition.top,
        startOffset: const Offset(0.0, -3.0),
        reverseEndOffset: const Offset(0.0, -3.0),
        duration: const Duration(seconds:2),
        animDuration: const Duration(seconds: 1),
        curve: Curves.elasticOut,
        backgroundColor: color,
        reverseCurve: Curves.fastOutSlowIn);
    notifyListeners();
  }
  bool _usertf = false; // user icon
  bool get usertf=>_usertf;
  bool _imgAvatartf = false;
  bool get imgAvatartf => _imgAvatartf;
  bool _shopcarttf = false; // shop icon
  bool get shopcarttf => _shopcarttf; // shop icon
  bool _shopcartIcontf = false; //shop icon
  bool get shopcartIcontf =>_shopcartIcontf; //shop icon
  void twotfbtn(index) {
    switch (index) {
      case 4:
        if (usertf == false) {
          _usertf = true;
          // shopcarttf=false;
        } else if (usertf == true) {
          _usertf = false;
        }

        _numbertv = "";
        _numberactiv = "";
        _activBtn = false;
        _activIconBtn = true;
        _imgAvatartf == false;
        if (imglistshop.isEmpty) {
          _shopcarttf = false;
          _shopcartIcontf = false;
        } else {
          _shopcartIcontf = true;
          _shopcarttf = true;
        }
        break;
    }
    notifyListeners();
  }

  bool _showcontext = false;
  bool get showcontext => _showcontext;

  void showContext(showtf){
    _showcontext=showtf;
    notifyListeners();
  }

  bool _userBtnTf = false;
  bool get userBtnTf => _userBtnTf;

  void btnUserTf(boleansed){
    _userBtnTf=boleansed;
    notifyListeners();
  }

  void restartPage(){
    _usertf=false;
    _activIconBtn = true;
    _activBtn = false;
    _shopcarttf = false;
    _shopcartIcontf = false;
    _numbertv = "";
    _numberactiv = "";
    _imgAvatartf = false;
    _visible = false;
    _dateOk="00/00/0000";
    showContext(false);
    btnUserTf(false);
    notifyListeners();
  }

  final List<ProfAccauntData> _profSearchAccaunt = [];
  List<ProfAccauntData> get profSearchAccaunt=>_profSearchAccaunt;

  bool _lottietf=true;
  bool get lottietf=>_lottietf;

  void lottieTf(tf){
    _lottietf=tf;
    notifyListeners();
  }

  List<ProfAccauntData> _profAccaunt = profAccaunts;
  List<ProfAccauntData>get  profAccaunt =>_profAccaunt;

  void backclickProf(){
    for (var element in profAccaunt) {
      if (element.selectProf == true) {
        element.selectProf = false;
      }
    }
    notifyListeners();
  }

  int _countshop = 0;

  int get countshop => _countshop;
  void countAdd(){
    _countshop++;
    notifyListeners();
  }

  void countAddShop(index,tf,PanelProvider panelProvider) {
    _countshop++;
    if(tf==true) {
      imageDList[index].brandOrService=tf;
      imglistshop.add(imageDList[index]);
    }else{
      imageDList[index].brandOrService=tf;
      imageDListProf[index].doctorId=panelProvider.doctorsId;
      notifyListeners();
      imglistshop.add(imageDListProf[index]);
    }
    _shopIndex=index;
    notifyListeners();
  }
  final String _imgs="assets/shoppingcartopen.png";
  String get imgs=>_imgs;
  int _shopIndex = -1;
  int get shopIndex=>_shopIndex;
  void countdeletshopHome(index,id,brendOrService){

    switch(brendOrService) {

      case true:
        if (imglistshop[index].counts == 1) {
          imageDList[id - 1].counts = 1;
          _countshop = _countshop - imglistshop[index].counts;
          imglistshop.remove(imglistshop[index]);
          imageDList[id - 1].img = _imgs;
          _shopIndex = id - 1;
        } else if (imglistshop[index].counts > 1) {
          imglistshop[index].counts--;
          _countshop--;
        }
        break;
      case false:
        if (imglistshop[index].counts == 1) {
          imageDListProf[id - 1].counts = 1;
          _countshop = _countshop - imglistshop[index].counts;
          imglistshop.remove(imglistshop[index]);
          imageDListProf[id - 1].img = _imgs;
          _shopIndex = id - 1;
        } else if (imglistshop[index].counts > 1) {
          imglistshop[index].counts--;
          _countshop--;
        }
        break;
    }
    notifyListeners();

  }


  void countdeletshopbox(index,id,brendOdService){
    ImagesData elementid=ImagesData(id: 0, url: "", title: "", subtitle: "", subtitle2:"", img: "", price:0, data: "", queue: 0, status: "", rowresult: false, brandOrService: true, counts: 0);

    for (var element in imglistshop) {
      if(element.brandOrService==brendOdService){
        if(element.id==id){
          elementid = element;
        }
      }else if(element.brandOrService==brendOdService){
        if(element.id==id){
          elementid = element;
        }
      }
    }

    if(elementid.brandOrService==brendOdService) {
      imglistshop.remove(elementid);
      _countshop = _countshop - elementid.counts;
    }

    switch(brendOdService){
      case true:
        imageDList[index].img=_imgs;
        _shopIndex=id-1;
        debugPrint(" | =>${elementid.counts}");
        imageDList[index].counts=1;
        notifyListeners();
        break;
      case false:
        _shopIndex=id-1;
        debugPrint(" / =>${elementid.counts}");
        imageDListProf[index].img=_imgs;
        imageDListProf[index].counts=1;
        notifyListeners();
        break;
    }
    notifyListeners();
  }
  void numberActiv(txt){
    _numberactiv=txt;
    notifyListeners();
  }
  void imgavatartf(bol){
    _imgAvatartf=bol;
    notifyListeners();
  }
  void registrfalse(){
    numberTv("");
    numberActiv("");
    activIconbtn(true);
    activbtn(false);
    notifyListeners();
  }
  void closeOrOpen(context){
    visibleshowdialog();
    showPicture("");
    if (showcontext == true) {
      showContext(false);
      btnUserTf(false);
    } else {
      showContext(true);
    }
    notifyListeners();
  }
  void shopTfCart(){
    if (imglistshop.isEmpty) {
      _shopcarttf = false;
      _shopcartIcontf = false;
    } else {
      _shopcartIcontf = true;
      _shopcarttf = true;
    }
    notifyListeners();
  }

  DateTime selectedDatePicker = DateTime.now();

  Future<void> selectDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        anchorPoint: const Offset(100, 20),
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2101));
    if (picked != null) {
      selectedDatePicker = picked;
      if(selectedDatePicker.day.toString().length==1) {
        if(selectedDatePicker.month.toString().length==1) {
          _dateOk =
          "0${selectedDatePicker.day}/0${selectedDatePicker
              .month}/${selectedDatePicker.year}";
        }else{
          _dateOk =
          "0${selectedDatePicker.day}/${selectedDatePicker
              .month}/${selectedDatePicker.year}";
        }
      }else if(selectedDatePicker.month.toString().length==1) {
        _dateOk =
        "${selectedDatePicker.day}/0${selectedDatePicker
            .month}/${selectedDatePicker.year}";
      }else {
        _dateOk =
        "${selectedDatePicker.day}/${selectedDatePicker
            .month}/${selectedDatePicker.year}";
      }

    }
    notifyListeners();
  }

  double _detailsposition = 0;
  double get detailsposition => _detailsposition;
  void dxposition(dx) {
    _detailsposition = dx;
    notifyListeners();
  }
  void userTf(bol){
    _usertf=bol;
    notifyListeners();
  }
  void userBtnOpenorClosed(){
    if (showcontext == true) {
      showContext(false);
      userTf(false);
    } else {
      showContext(true);
      userTf(true);
    }
    notifyListeners();
  }
  final List<DropItems> _deliveryList = [
    DropItems(id: 1, icon: true, title: "Delivery"),
    DropItems(id: 2, icon: false, title: "On place"),
  ];
  List<DropItems> get deliveryList =>_deliveryList;
  void setIconDrop(id,context){
    for(var e=0;e<deliveryList.length;e++){
      if(deliveryList[e].id==id){
        deliveryList[e].icon=true;
        toast("Set",context,Colors.grey);
      }else{
        deliveryList[e].icon=false;
      }
    }
    notifyListeners();
  }

  void setShowContainer(context){

    closeOrOpen(context);
    twotfbtn(4);
    shopTfCart();
    allregisterset(0);
    if (context.read<PanelProvider>().aboutScanBarDialog !=
        false) {
      context.read<PanelProvider>().aboutScanBar();
    }
    context.read<RegisterProviders>().picList.clear();
    notifyListeners();
  }

  void returnSortBy(txt){
    imglistshop.sort((a,b)=>a.status.compareTo(b.status));
    notifyListeners();
  }

  List<ImagesData> imageSearchList = [];

  int filterHistory=-1;
  int oldFilterHistory=-1;

  void setFilterHistoryId(id){
    filterHistory=-1;
    for(var i=0;i<filterHistoryList.length;i++){
      if(filterHistoryList[i].id==id){
        filterHistory=i;
      }
    }
    if(filterHistory==-1){
      toast("NotFound", BuildContext, Colors.yellow);
    }else{
      if(oldFilterHistory!=-1){
        filterHistoryList[oldFilterHistory].icon=false;
      }
      filterHistoryList[filterHistory].icon=true;
      oldFilterHistory=filterHistory;
    }
    notifyListeners();
  }

  List<DropItems> filterHistoryList=[
    DropItems(id: 1, icon: false, title: "Завершенные",textStyle: AppTextStyle.blue_14_txt),
    DropItems(id: 2, icon: false, title: "Отмененные",textStyle: AppTextStyle.red_14_txt),
    DropItems(id: 3, icon: false, title: "В процессе",textStyle: AppTextStyle.warning_14_txt),
    DropItems(id: 4, icon: false, title: "В ожидании оплаты",textStyle: AppTextStyle.success_14_txt),
    DropItems(id: 5, icon: false, title: "Непринятые ",textStyle: AppTextStyle.grey_14_txt),
    DropItems(id: 6, icon: false, title: "Возврат",textStyle: AppTextStyle.red_14_txt)
  ];

  void setDropDownValue(indexList,index){
    switch(indexList){
      case 1:
        setregiondrop(regionList[index]);
        break;
      case 2:
        setprofessions(regionList[index]);
        break;
      case 3:
        setcoupons(regionList[index]);
        break;
    }
    notifyListeners();
  }

}