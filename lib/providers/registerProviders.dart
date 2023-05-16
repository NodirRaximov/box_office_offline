import 'dart:async';
import 'package:box_office_offline/model/profAccauntData.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterProviders with ChangeNotifier {
  final maskFormaterers = MaskTextInputFormatter(mask: '##');
  final maskFormaterPhone = MaskTextInputFormatter(mask: '## ###-##-##');
  final maskFormaterPassport = MaskTextInputFormatter(mask: '##############');
  final pvcmask = MaskTextInputFormatter(mask: '# # # # # #');
  final maskText = MaskTextInputFormatter(mask: '');

  final List<String> picList = [];

  void picListAdd(pic) {
    picList.add(pic);
    notifyListeners();
  }
  String numFirst="0";
  String profName = "";

  String profSurName = "";

  ProfAccauntData profaccauntAdd = ProfAccauntData(selectProf: false,queue: 0, id: ProvidersClass().profAccaunt.length+1);


  void saveOrCancel() {
    profName = "";
    profSurName = "";
    picList.clear();
    notifyListeners();
  }

  void addUser(providersClass) {
    profaccauntAdd = ProfAccauntData(
      id: ProvidersClass().profAccaunt .length+1,
      url: providersClass.picture,
      name: profName,
      surname: profSurName,
      lastname: "Sobirovich",
      timeWork: providersClass.dateOk,
      position: providersClass.professions,
      reception: providersClass.dateOk,
      selectProf: false, queue: 18,
    );
    notifyListeners();
  }

  bool showDImg=false;
  void imgShowD(tf){
    showDImg=tf;
    notifyListeners();
  }

  void accauntProfAdd(profAc, context) {
    profaccauntAdd = profAc;
    context.read<ProvidersClass>().profAccaunt.add(profAc);
    notifyListeners();
  }

  late AnimationController controller;

  void accauntProfDeleted(id) {
    profaccauntAdd = ProfAccauntData(id:id,selectProf: false,name: "",surname: "",lastname: "",queue: 18);
    notifyListeners();
  }
  var ind=0;

  late Timer timer;
  int start = 60;

  void startTimer(secd) {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
          (timer) {
        if (start == 0) {
          if(secd==60){
            start=60;
          }
          // timer.cancel();
        } else {
          start--;
        }
      },
    );
    notifyListeners();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  var onPressed = VoidCallback;

  void userAccaunt(profAccaunt) {
    profaccauntAdd = profAccaunt;
    notifyListeners();
  }

  bool allPositionsData(context, providersClass) {
    var dateAll = false;
    if (profName != "") {
      if (profSurName != "") {
        if (providersClass.dateOk != "") {
          if (providersClass.regiondrop != "") {
            if (providersClass.professions != "") {
              if (providersClass.picture != "") {
                dateAll = true;
                notifyListeners();
              } else {
                dateAll = false;
                notifyListeners();
              }
            }
          }
        }
      }
    }

    return dateAll;
  }
  bool widthToHeight(width,height){
    if(width-height<500){
      return true;
    }else{
      return  false;
    }
  }
  void subscrib(ind, String newText) {
    if(ind==0){
      if(newText.substring(0,2)=="90"||newText.substring(0,2)=="91"||newText.substring(0,2)=="92"
          ||newText.substring(0,2)=="93"||newText.substring(0,2)=="94"||newText.substring(0,2)=="95"
          ||newText.substring(0,2)=="96"||newText.substring(0,2)=="97"||newText.substring(0,2)=="98"
          ||newText.substring(0,2)=="99"||newText.substring(0,2)=="70"||newText.substring(0,2)=="71") {
        numFirst = "9";
        ind++;
      }
    }
    notifyListeners();
  }
}