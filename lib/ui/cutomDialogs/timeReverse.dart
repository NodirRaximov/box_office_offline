
import 'dart:async';

import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/providers/registerProviders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimerReverse extends StatefulWidget {
const TimerReverse({Key? key}) : super(key: key);

@override
State<TimerReverse> createState() => _TimerReverseState();
}

class _TimerReverseState extends State<TimerReverse> {
  late Timer _timer;
  int _start = 60;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          timer.cancel();
          setState(() {

          });
        } else {
          _start--;
          setState(() {

          });
        }
      },
    );

  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProviders>(builder:(context,providers,child) {
      return Consumer<ProvidersClass>(builder:(context,providersClass,child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {

                });
              },
              child: const Text("start"),
            ),
            Text("Recent code: ${providersClass.second} sec.")
          ],
        );
      });
    });
  }
}