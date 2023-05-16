import 'package:box_office_offline/providers/providersClass.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:money_input_formatter/money_input_formatter.dart';

class PanelProvider extends ChangeNotifier {
  int _country = 0;

  int get country => _country;
  bool _boxtf = true; // click box widget button
  bool get boxtf => _boxtf; // click box widget button
  bool _proftf = false; // click prof widget button
  bool get proftf => _proftf; // click prof widget button
  bool _cattf = false; // click category widget button
  bool get cattf => _cattf; // click category widget button
  bool _reservetf = false; // click reserve widget button
  bool get reservetf => _reservetf; // click reserve widget button
  bool _recivetf = false; // click recive widget button
  bool get recivetf => _recivetf; // click recive widget button
  bool _qrtf = false;

  bool get qrtf => _qrtf;
  bool _logo = false;

  bool get logo => _logo;

  void onPressedTf(index) {
    _country = index;
    switch (index) {
      case 0:
        _boxtf = true;
        _proftf = false;
        _cattf = false;
        _qrtf = false;
        _reservetf = false;
        _recivetf = false;
        _logo = false;
        // shopcarttf = false;
        // usertf = false;
        // _visible = false;
        break;
      case 1:
        _proftf = true;
        _cattf = false;
        _qrtf = false;
        _boxtf = false;
        _reservetf = false;
        _recivetf = false;
        _logo = false;
        // shopcarttf = false;
        // usertf = false;
        // _visible = false;
        break;
      case 2:
        _cattf = true;
        _qrtf = false;
        _boxtf = false;
        _proftf = false;
        _reservetf = false;
        _recivetf = false;
        _logo = false;
        // shopcarttf = false;
        // usertf = false;
        // _visible = false;
        break;
      case 3:
        _qrtf = true;
        _boxtf = false;
        _proftf = false;
        _cattf = false;
        _reservetf = false;
        _recivetf = false;
        _logo = false;
        // shopcarttf = false;
        // usertf = false;
        // _visible = false;
        break;
      case 4:
        _reservetf = true;
        _recivetf = false;
        _qrtf = false;
        _boxtf = false;
        _proftf = false;
        _cattf = false;
        _logo = false;
        // shopcarttf = false;
        // usertf = false;
        // _visible = false;
        break;
      case 5:
        _reservetf = false;
        _recivetf = true;
        _qrtf = false;
        _boxtf = false;
        _proftf = false;
        _cattf = false;
        _logo = false;
        // shopcarttf = false;
        // usertf = false;
        // _visible = false;
        break;
      case 6:
        _logo = true;
        _reservetf = false;
        _recivetf = false;
        _qrtf = false;
        _boxtf = false;
        _proftf = false;
        _cattf = false;
        break;
    }
    notifyListeners();
  }

  bool _searchtf = true;

  bool get searchtf => _searchtf;

  void searchTf(tf) {
    _searchtf = tf;
    notifyListeners();
  }

  bool _backtf = false;

  bool get backtf => _backtf;

  void backTf(tf) {
    _backtf = tf;
    notifyListeners();
  }

  String _tvText = "";

  String get tvText => _tvText;

  void tvTextTf(txt) {
    _tvText = txt;
    notifyListeners();
  }

  String _tvText2 = "";

  String get tvText2 => _tvText2;

  void tvTextTf2(txt) {
    _tvText2 = txt;
    notifyListeners();
  }

  bool _accauntIdTf = true;

  bool get accauntIdTf => _accauntIdTf;

  void accauntidTf(tf) {
    _accauntIdTf = tf;
    notifyListeners();
  }

  String _profOId = "";

  String get profOId => _profOId;
  int _doctorsId = 0;

  int get doctorsId => _doctorsId;

  void profOid(txt, id) {
    _profOId = txt;
    _doctorsId = id;
    notifyListeners();
  }

  bool _row_vectortfCtg = true;

  bool get row_vectortfCtg => _row_vectortfCtg;

  void rowVector(tf) {
    _row_vectortfCtg = tf;
    notifyListeners();
  }

  bool _row_vectortfbox = true;

  bool get row_vectortfbox => _row_vectortfbox;

  void rowVectorBox(tf) {
    _row_vectortfbox = tf;
    notifyListeners();
  }

  bool _itemstf = false;

  bool get itemstf => _itemstf;

  void itemsTf() {
    _itemstf = !itemstf;
    notifyListeners();
  }

  bool isOpenProfInfo = true;

  void profInfotf(tf) {
    isOpenProfInfo = tf;
    notifyListeners();
  }

  bool aboutScanBarDialog = false;

  void aboutScanBar() {
    aboutScanBarDialog = !aboutScanBarDialog;
    notifyListeners();
  }

  bool moneyRecive = false;

  void moneyRecives() {
    moneyRecive = !moneyRecive;
    notifyListeners();
  }

  var text = "";

  final maskFormaterUZSOne =
      MaskTextInputFormatter(mask: '### ### ### ### ### ###');
  final maskFormaterUZSTwo =
      MaskTextInputFormatter(mask: '## ### ### ### ### ###');
  final maskFormaterUZSThree =
      MaskTextInputFormatter(mask: '# ### ### ### ### ###');
  final moneyFormater = MoneyInputFormatter();

  MaskTextInputFormatter setmoney(String txt) {
    var returnmask = maskFormaterUZSOne;
    var mon = txt.length % 3;
    switch (mon.bitLength) {
      case 1:
        returnmask = maskFormaterUZSThree;
        debugPrint("three");
        break;
      case 2:
        returnmask = maskFormaterUZSTwo;
        debugPrint("two");

        break;
      case 0:
        returnmask = maskFormaterUZSOne;
        debugPrint("one");

        break;
    }
    return returnmask;
  }

  bool statisticRow = false;

  void setStatisticRow(tf) {
    statisticRow = tf;
    notifyListeners();
  }
  bool statisticBrandRow = false;

  void setStatisticBrandRow(tf) {
    statisticBrandRow = tf;
    notifyListeners();
  }

  bool userProfStatic = false;

  void setUserProfStatic(tf) {
    userProfStatic = tf;
    notifyListeners();
  }

  bool moneyPayButton = false;

  void setMoneyPayButton(){
    moneyPayButton=!moneyPayButton;
    notifyListeners();
  }
  void setFalseMoneyPayButton(){
    moneyPayButton=false;
    notifyListeners();
  }

}
