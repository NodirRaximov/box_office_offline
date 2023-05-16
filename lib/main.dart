import 'dart:io';

import 'package:box_office_offline/providers/historyProvider.dart';
import 'package:box_office_offline/providers/dateAndTimeProvider.dart';
import 'package:box_office_offline/providers/mainProviders.dart';
import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/providers/registerProviders.dart';
import 'package:box_office_offline/widgets/splashPage/splashPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  // await Hive.openBox<List<Employee>>("employee");
  await Hive.openBox<List<String>>("nameCompany");
  await Hive.openBox<String>("loginData");
  // await DBHelper().initDatabase();
  // await openDatabase(document.path,version:1,onCreate:Database.execute('CREATE TABLE employee (id INTEGER PRIMARY KEY, name TEXT, phone TEXT)'));
  await Hive.initFlutter();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

  // runApp(const MyApp());

  runApp(MultiProvider(
    providers: providers,
    child: const MyApp(),
  ));
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => MainProviders()),
  ChangeNotifierProvider(create: (_) => ProvidersClass()),
  ChangeNotifierProvider(create: (_) => RegisterProviders()),
  ChangeNotifierProvider(create: (_) => PanelProvider()),
  ChangeNotifierProvider(create: (_) => HistoryProvider()),
  ChangeNotifierProvider(create: (_) => DateAndTimeProvider()),
  // RepositoryProvider(
  //   create: (context) => UserRepository(pageId: 2),
  //   child: const HomePages(),
  // )
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.z
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const SplashPage(index: 0));
        });
  }
}
