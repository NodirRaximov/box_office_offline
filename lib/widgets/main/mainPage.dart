import 'package:box_office_offline/providers/mainProviders.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/widgets/main/mainPageLogin/loginWidgets.dart';
import 'package:box_office_offline/widgets/main/mainPageRegister/registerCompanyWidget.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MainPage> createState() => _MainPageState(title);
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  _MainPageState(this.title);

  // late List<Note> notes;
  bool isLoading = false;
  final String title;
  final bool _passwordTF = true;

  bool get passwordTF => _passwordTF;
  late final Box<List<String>> companyBox;

  // late final Box<List<Employee>> employeeBox;
  late MainProviders mainproviders = context.read<MainProviders>();

  @override
  void initState() {
    super.initState();
    // refreshNotes();
    mainproviders.isOpened("login", "pass", "compName");

    // context.read<MainProviders>().addBoxEmployee(Hive.box<List<Employee>>("employee"));
    context.read<MainProviders>().setAnimation(this);
    _runExpandCheck();
    // employeeBox = Hive.box<List<Employee>>("employee");
  }

  // Future refreshNotes()async{
  //   setState(() => isLoading = true);
  //
  //
  //   setState(() =>isLoading = false);
  // }

  // @override
  // void dispose() {
  //   context.read<MainProviders>().expandController.dispose();
  //   super.dispose();
  // }
  void _runExpandCheck() {
    if (context.read<MainProviders>().isShow) {
      context.read<MainProviders>().expandController.forward();
    } else {
      context.read<MainProviders>().expandController.reverse();
    }
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
      return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body:  Consumer<MainProviders>(builder: (context, mainProviders, child) {
          return Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      decoration: DecorationBox.linerGradientNoRadius,
                      alignment: Alignment.center,
                      height: double.maxFinite,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/shape.png",
                                width: 80,
                                height: 90,
                              ),
                              const SizedBox(
                                width: 35,
                              ),
                              Image.asset(
                                "assets/dwed_txt.png",
                                width: 290,
                                height: 90,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 85,
                          ),
                          Image.asset("assets/astronaut.png",
                              height: 300, width: 285),
                          const SizedBox(
                            height: 32,
                          ),
                          const Text(
                            "Welcome to Ecosystem of future",
                            style: TextStyle(
                                fontSize: 28,
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const Text(
                            "Please select your company and log in",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  mainProviders.loginOrRegister
                      ? const LoginWidget(title: '')
                      : const RegisterCompanyWidget()
                ],
              ),
              Positioned(
                  top: 50,
                  right: 50,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Language"),
                  ))
            ],
          );
        })
      );
  }
}
