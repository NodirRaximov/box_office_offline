
import 'package:box_office_offline/model/dayListOfMonth.dart';
import 'package:box_office_offline/model/imagesData.dart';
import 'package:box_office_offline/model/stockGoodsList.dart';
import 'package:box_office_offline/model/timeListToDay.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:flutter/material.dart';

class DateAndTimeProvider extends ChangeNotifier {
  List<TimeListToDay> _timelisttoday = [];

  List<TimeListToDay> get timelisttoday => _timelisttoday;

  List<DayListOfMonth> _daylistofmonth = [];

  List<DayListOfMonth> get daylistofmonth => _daylistofmonth;

  void getDayAndTime() {
    goodslist(ProvidersClass().imglistshop);
    _daylistofmonth = dayList;
    _timelisttoday = dateList;
    notifyListeners();
  }

  void clearDayAndTimeList() {
    stockGoodsList.clear();
    daylistofmonth.clear();
    timelisttoday.clear();
    notifyListeners();
  }

  final DateTime _datatime = DateTime.now();

  DateTime get datatime => _datatime;

  List<StockGoodsList> _stockGoodsList = [];

  List<StockGoodsList> get stockGoodsList => _stockGoodsList;

  final List<TimeListToDay> _dateList = [];

  List<TimeListToDay> get dateList => _dateList;

  final List<DayListOfMonth> _dayList = [];

  List<DayListOfMonth> get dayList => _dayList;

  void timelist(int scanminut) {
    int minute = 0;
    int oldhour = 0;
    int oldminute = 0;
    _dateList.clear();
    for (var i = 0; i < 20; i++) {
      if (i == 0) {
        _dateList.add(TimeListToDay(id: i + 1, hour: 08, minute: 00, idDay: i));
        oldhour = _dateList[i].hour;
        oldminute = _dateList[i].minute;
      } else if (oldminute < 60) {
        minute = _dateList[i - 1].minute + scanminut;
        if (minute < 60) {
          _dateList.add(TimeListToDay(
              id: i + 1,
              hour: oldhour,
              minute: minute > 60 ? (60 - minute) : minute,
              idDay: i));
          oldhour = _dateList[i].hour;
          oldminute = _dateList[i].minute;
        } else {
          oldhour++;
          minute = minute - 60;
          _dateList.add(TimeListToDay(
              id: i + 1,
              hour: oldhour,
              minute: minute > 60 ? (60 - minute) : minute,
              idDay: i));
          oldhour = _dateList[i].hour;
          oldminute = _dateList[i].minute;
        }
      } else if (oldminute == 60) {
        _dateList.add(TimeListToDay(
            id: i + 1,
            hour: oldhour++,
            minute: scanminut != 60 ? scanminut : 0,
            idDay: i));
        oldhour = _dateList[i].hour;
        oldminute = _dateList[i].minute;
      }
    }
    // dateList;
    notifyListeners();
  }

String selectData="";
  void daylist() {
    selectData =
        "${datatime.day.toString().length == 1 ? 0.toString() + datatime.day.toString() : datatime.day}.${datatime.month.toString().length == 1 ? 0.toString() + datatime.month.toString() : datatime.month}.${datatime.year}";
    int oldday = 0;
    int oldmonth = 0;
    int oldyear = 0;
    int oldweek = 0;
    _dayList.clear();
    for (int i = 0; i < 10; i++) {
      if (i == 0) {
        _dayList.add(DayListOfMonth(
            id: i + 1,
            day: datatime.day,
            month: datatime.month,
            year: datatime.year,
            weekDay: weekday(datatime.weekday)));
        oldday = _dayList[i].day;
        oldmonth = _dayList[i].month;
        oldyear = _dayList[i].year;
        oldweek = datatime.weekday;
        debugPrint("if=>1");
        debugPrint("${_dayList[i].month}");
      } else if (oldmonth <= 12) {
        if (oldmonth == 2) {
          if (oldday < 28) {
            if (oldweek == 7) {
              oldweek = 1;
            } else {
              oldweek++;
            }
            _dayList.add(DayListOfMonth(
                id: i + 1,
                day: (oldday + 1),
                month: oldmonth,
                year: oldyear,
                weekDay: weekday(oldweek)));
            oldday = _dayList[i].day;
            oldmonth = _dayList[i].month;
            oldyear = _dayList[i].year;
            oldweek = oldweek;
          } else {
            if (oldmonth + 1 < 12) {
              if (oldweek == 7) {
                oldweek = 1;
              } else {
                oldweek++;
              }
              _dayList.add(DayListOfMonth(
                  id: i + 1,
                  day: 1,
                  month: oldmonth + 1,
                  year: oldyear,
                  weekDay: weekday(oldweek)));
              oldday = _dayList[i].day;
              oldmonth = _dayList[i].month;
              oldyear = _dayList[i].year;
              oldweek = oldweek;
            } else {
              if (oldweek == 7) {
                oldweek = 1;
              } else {
                oldweek++;
              }
              _dayList.add(DayListOfMonth(
                  id: i + 1,
                  day: 1,
                  month: 1,
                  year: oldyear + 1,
                  weekDay: weekday(oldweek)));
              oldday = _dayList[i].day;
              oldmonth = _dayList[i].month;
              oldyear = _dayList[i].year;
              oldweek = oldweek;
            }
          }
        } else if (oldday < 31) {
          if (oldweek == 7) {
            oldweek = 1;
          } else {
            oldweek++;
          }
          _dayList.add(DayListOfMonth(
              id: i + 1,
              day: (oldday + 1),
              month: oldmonth,
              year: oldyear,
              weekDay: weekday(oldweek)));
          oldday = _dayList[i].day;
          oldmonth = _dayList[i].month;
          oldyear = _dayList[i].year;
          oldweek = oldweek;
        } else {
          if (oldmonth + 1 < 12) {
            if (oldweek == 7) {
              oldweek = 1;
            } else {
              oldweek++;
            }
            _dayList.add(DayListOfMonth(
                id: i + 1,
                day: 1,
                month: oldmonth + 1,
                year: oldyear,
                weekDay: weekday(oldweek)));
            oldday = _dayList[i].day;
            oldmonth = _dayList[i].month;
            oldyear = _dayList[i].year;
            oldweek = oldweek;
          } else {
            if (oldweek == 7) {
              oldweek = 1;
            } else {
              oldweek++;
            }
            _dayList.add(DayListOfMonth(
                id: i + 1,
                day: 1,
                month: 1,
                year: oldyear + 1,
                weekDay: weekday(oldweek)));
            oldday = _dayList[i].day;
            oldmonth = _dayList[i].month;
            oldyear = _dayList[i].year;
            oldweek = oldweek;
          }
        }
        debugPrint("if=>2");
      } else {
        if (oldweek == 7) {
          oldweek = 1;
        } else {
          oldweek++;
        }
        _dayList.add(DayListOfMonth(
            id: i + 1,
            day: 1,
            month: 1,
            year: oldyear + 1,
            weekDay: weekday(oldweek)));
        oldday = _dayList[i].day;
        oldmonth = _dayList[i].month;
        oldyear = _dayList[i].year;
        oldweek = oldweek;
      }
    }

    // dayList;
    notifyListeners();
  }

  String _week = "";

  String get week => _week;

  String weekday(int weekDay) {
    switch (weekDay) {
      case 1:
        _week = "ПН";
        weekDay++;
        break;
      case 2:
        _week = "ВТ";
        weekDay++;
        break;
      case 3:
        _week = "СР";
        weekDay++;
        break;
      case 4:
        _week = "ЧТ";
        weekDay++;
        break;
      case 5:
        _week = "ПТ";
        weekDay++;
        break;
      case 6:
        _week = "СБ";
        weekDay++;
        break;
      case 7:
        _week = "ВС";
        weekDay++;
        break;
    }
    return week;
  }

  int selectedAccountId = 0;

  void selectProf(int proAccountId) {
    selectedAccountId = proAccountId;
    notifyListeners();
  }

  int selectDayId=1;

  void selectedDay(dayId) {
    selectTimeId=0;
    selectDayId=dayId;
    notifyListeners();
  }


  String selectDayText(selectId){
   var month=daylistofmonth[selectId-1].month.toString().length==1
        ?0.toString()+daylistofmonth[selectId-1].month.toString()
       :daylistofmonth[selectId-1].month.toString();
   notifyListeners();
   return month;
  }

  void goodslist(List<ImagesData> imgshoplist) {
    for(var i =0;i<imgshoplist.length;i++){
      _stockGoodsList.add(StockGoodsList(id: i+1, stock: imgshoplist[i].data));
    }
    notifyListeners();
  }

  int selectStockId = -1;

  void selectStockGoods(stockId) {
    selectStockId=stockId;
    notifyListeners();
  }

  int selectTimeId=-1;

  void selectTime(timeId) {
    selectTimeId=timeId;
    notifyListeners();
  }

}
