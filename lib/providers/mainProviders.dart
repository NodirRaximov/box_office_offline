import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MainProviders extends ChangeNotifier{

  late Box _box1;
  Box get box1 =>_box1;
  // late Box<List<Employee>> _box2;
  // Box<List<Employee>> get box2 =>_box2;
  bool _isChecked=false;
  bool get isChecked=>_isChecked;

  void createBox(box)async{
    _box1= box;
    getData();
    // notifyListeners();
  }

  bool _isOpenBox1=false;
  bool get isOpenBox1=>_isOpenBox1;

  Future isOpened(txt1,txt2,txt3)async{
    if(isOpenBox1==false){
      _box1=await Hive.openBox(txt1);
      _box1=await Hive.openBox(txt2);
      // _box1=await txt3;
      _isOpenBox1=true;
    }else{
      _box1= Hive.box(txt1);
      _box1= Hive.box(txt2);
    }
    return isOpenBox1;
  }

  void isCheckedSet(){
    if(isChecked){
      _isChecked=false;
    }else{
      _isChecked=true;
    }
    notifyListeners();
  }

  final TextEditingController _login = TextEditingController();
  TextEditingController get login => _login;
  final TextEditingController _password = TextEditingController();
  TextEditingController get password => _password;
  late String compNameBox="";

  void getData() async{
    // if(isChecked==true) {
      if (box1.get("login") != "") {
        _login.text = box1.get("login");
        // _isChecked = true;
      }
      // else{
      //   _login.text = box1.get("login");
      //   _isChecked = false;
      //
      // }
      if (box1.get("pass") != "") {
        _password.text = box1.get("pass");
        // _isChecked = false;
      }
      if(box1.get("compName") !=""){
        compNameBox=box1.get("compName");
      }
      // else{
      //   _password.text = box1.get("pass");
      //
      // }

    // else{
    //   _login.text = "";
    //   _password.text = "";
    //   _isChecked = false;
    // }
    // notifyListeners();
  }

  bool _passwordTF = true;
  bool get passwordTf => _passwordTF;
  void setBoolPassword(){
    _passwordTF=!passwordTf;
    notifyListeners();
  }

  String _dropdownValue = "";
  String get dropdownValue => _dropdownValue;

  final List<String> _list = <String>[
    "Markaziy Poliklinika",
    "Markaziy Temir Yo'l Kilinik Shifoxonasi",
    "Andijon Temir Yo'l shifoxonasi",
    "Qo'qon Temir Yo'l shifoxonasi" ,
    "Markaziy Poliklinika",
    "Markaziy Temir Yo'l Kilinik Shifoxonasi",
    "Andijon Temir Yo'l shifoxonasi",
    "Qo'qon Temir Yo'l shifoxonasi",
    "Markaziy Poliklinika",
    "Markaziy Temir Yo'l Kilinik Shifoxonasi asdgfasdf asdfvsdf sdfsd sdf ",
    "Andijon Temir Yo'l shifoxonasi",
    "Qo'qon Temir Yo'l shifoxonasi"
  ];
  List<String> get list =>_list;

  void textSet(index){
    _dropdownValue = list[index];
    notifyListeners();
  }

  String _selectIndex="";
  String get selectIndex=>_selectIndex;

  void selectint(index){
    _selectIndex=list.first;
    _selectIndex = index;


    notifyListeners();
  }
  late AnimationController _expandController;
  AnimationController get expandController => _expandController;
  late Animation<double> _animation;
  Animation<double> get animation => _animation;


  bool _isShow = false;
  bool get isShow => _isShow;

  void setIsShow(tf){
    _isShow=tf;
    notifyListeners();
  }

  void setAnimation(thiss){
    _expandController=AnimationController(
      vsync: thiss, duration: const Duration(milliseconds: 350));
  _animation = CurvedAnimation(
    parent: expandController,
    curve: Curves.fastOutSlowIn,
  );

    // notifyListeners();
  }

  void toast(context,txt,colors){
    showToast(txt,
        context: context,textStyle: const TextStyle(height: 2,fontSize: 20,color: Colors.white),
        animation: StyledToastAnimation.slideFromTop,
        reverseAnimation: StyledToastAnimation.slideToTop,
        position: StyledToastPosition.top,
        startOffset: const Offset(0.0, -3.0),
        reverseEndOffset: const Offset(0.0, -3.0),
        duration: const Duration(seconds:2),
        animDuration: const Duration(seconds: 1),
        curve: Curves.elasticOut,
        backgroundColor: colors,
        reverseCurve: Curves.fastOutSlowIn);
  }

  void logins(){
    if(isChecked) {
      box1.put("login", _login.text);
      box1.put("pass", _password.text);
      box1.put("compName", compNameBox);
    }else{
      box1.put("login","");
      box1.put("pass","");
      box1.put("compName","");
    }
    notifyListeners();
  }
  // List<Employee> empl=[Employee(1, "asdfa", "asdasf"),Employee(2, "asdfa", "asdasf"),Employee(3, "asdfa", "asdasf")];
  //
  // void addBoxEmployee(box)async{
  //   _box2=box;
  //   _box2.put("employee", empl);
  //   // notifyListeners();
  // }
  // final List<Employee> _employees=[];
  // List<Employee> get employees=>_employees;
  //
  // Future<List<Employee>> getEmployee()async{
  //   var employees=box2.get('employee')!;
  //   for(var u in employees){
  //     var employee=Employee(u.id,u.name,u.phone);
  //     _employees.add(employee);
  //   }
  //   return _employees;
  // }

  bool loginOrRegister=false;

  void setLoginOrRegister(){
    loginOrRegister=!loginOrRegister;
    notifyListeners();
  }

}