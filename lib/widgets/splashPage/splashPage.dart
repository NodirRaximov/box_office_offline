import 'dart:async';
import 'package:box_office_offline/widgets/main/mainPage.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  State<SplashPage> createState() => _SplashPageState(index);
}

class _SplashPageState extends State<SplashPage> {
  _SplashPageState(this.index);

  final int index;

  @override
  void initState() {
    super.initState();
    _updateSize();
    // if(index==0){

    // }else{
    //   Navigator.of(context).pushReplacement(
    //       MaterialPageRoute(builder: (_) => const MainPage(title:""))
    //   );
    // }
  }

  // Future runAnium()async{
  //   return
  // }

  @override
  void dispose() {
    super.dispose();
  }

 late  double _height=100;
 late double _width=100;
  bool _large = false;
  late int _countLogo=0;

  void _updateSize() {
    setState(() {
      if(_countLogo!=5) {
        Timer(const Duration(milliseconds: 1500), () {
          _height = _large ? _height / 0.4 : _height * 0.4;
          _width = _large ? _width / 0.5 : _width * 0.5;
          _large = !_large;
          _countLogo++;
          debugPrint("set height");
          _updateSize();
        });
      }else{
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const MainPage(title: "")));
      }
    });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Center(
  //     child: GestureDetector(
  //       // onTap: () => _updateSize(),
  //       child: Container(
  //         // height: 500,
  //         // width: 500,
  //         color: Colors.amberAccent,
  //         child: AnimatedSize(
  //           curve: Curves.easeIn,
  //           duration: const Duration(seconds: 1),
  //           child: FlutterLogo(size: _size,)
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // _height = MediaQuery.of(context).size.height * 0.4;
    // _width = MediaQuery.of(context).size.width * 0.4;
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.blue,
        child: Center(
          child: AnimatedContainer(
            height: _height,
            width: _width,
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 1500),
            child: Image.asset(
              "assets/shape.png",
              color: Colors.white,
              fit: BoxFit.contain,


            ),
          ),
        ),
      ),
    );
  }
}
