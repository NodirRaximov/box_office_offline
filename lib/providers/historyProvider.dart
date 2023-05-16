import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class HistoryProvider extends ChangeNotifier{
  bool dialogshow = false;

  bool historyOfVisits=false;

  void setHistoryListTf(){
  historyOfVisits=!historyOfVisits;
  notifyListeners();

  }

  void increment() {
   dialogshow=!dialogshow;
    notifyListeners();
  }

  void incrementfalse(){
    dialogshow = false;
    notifyListeners();
  }



  int indexOfOffer=0;

  void aboutTheOffer(index){
    indexOfOffer=index;
    notifyListeners();
  }

  int _indexOfDoctor=0;
  int get indexOfDoctor=>_indexOfDoctor;

  void aboutTheDoctor(index){
    _indexOfDoctor=index;
    notifyListeners();
  }
  int _resultIndex=-1;
  int get resultIndex=>_resultIndex;
  int _oldresultIndex=-1;
  int get oldresultIndex=>_oldresultIndex;
  void visitsOfHistory(index,imglistshop){
    _resultIndex=index;
    if (oldresultIndex!=resultIndex) {
      for (var element in imglistshop) {
        if (element.rowresult == true) {
          element.rowresult = false;
          historyOfVisits=false;
        }
      }
      if (imglistshop[index].rowresult == false) {
        imglistshop[resultIndex].rowresult = true;
        historyOfVisits=true;
        _oldresultIndex = resultIndex;
      }
    }else if(imglistshop[oldresultIndex].rowresult==true){
      imglistshop[resultIndex].rowresult = false;
      historyOfVisits=false;
    }else{
      imglistshop[oldresultIndex].rowresult=true;
      historyOfVisits=true;
    }
    notifyListeners();
  }


}