import 'package:box_office_offline/providers/mainProviders.dart';
import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/providers/registerProviders.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/buttons/material_buttons.dart';
import 'package:box_office_offline/ui/colors/myColors.dart';
import 'package:box_office_offline/ui/returnWidgets/buildDropListOptions.dart';
import 'package:box_office_offline/ui/text/text.dart';
import 'package:box_office_offline/ui/text/textFormFieldes.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:box_office_offline/widgets/home/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key,required this.title}) : super(key: key);
  final String title;

  @override
  State<LoginWidget> createState() => _LoginWidgetState(title: title);
}

class _LoginWidgetState extends State<LoginWidget> with SingleTickerProviderStateMixin{
  _LoginWidgetState({required this.title});
  final bool isLoading = false;
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
    var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    return Consumer<ProvidersClass>(builder: (context, providersClass, child) {
      return Consumer<MainProviders>(builder: (context, mainProviders, child) {
      return Consumer<RegisterProviders>(builder: (context, registerProvider, child) {
        return Expanded(
          child: Container(
                color: Colors.white12,
                height: double.maxFinite,
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RecurrenceText(
                            style: AppTextStyle.panel_32_txt,
                            str: "Log in",
                            margin: const EdgeInsets.only(left: 30)),
                        const SizedBox(
                          height: 12,
                        ),
                        RecurrenceText(
                            style: AppTextStyle.grey_17_txt,
                            str: "Please login to access your account.",
                            margin: const EdgeInsets.only(left: 30)),
                        Stack(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              height: 50.sp,
                              margin:
                              const EdgeInsets.fromLTRB(30, 32, 30, 12),
                              padding: const EdgeInsets.only(
                                  left: 12, right: 50, top: 15),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: AppColor.grey),
                                  borderRadius: BorderRadius.circular(6)),
                              child: GestureDetector(
                                onTap: () {
                                  mainProviders
                                      .setIsShow(!mainProviders.isShow);
                                  _runExpandCheck();
                                  setState(() {});
                                },
                                child: SizedBox(
                                  width:
                                  MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    mainProviders.compNameBox,
                                    textAlign: TextAlign.left,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyle.black_17_txt_w4,
                                  ),
                                ),
                              ),
                            ),
                            mainProviders.compNameBox != ""
                                ? Positioned(
                                left: 45,
                                top: 40,
                                child: SizedBox(
                                  height: 60,
                                  child: GestureDetector(
                                    child: const Text(
                                      "Select Company",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10),
                                    ),
                                    onTap: () {
                                      mainProviders.setIsShow(
                                          !mainProviders.isShow);
                                      _runExpandCheck();
                                      setState(() {});
                                    },
                                  ),
                                ))
                                : Positioned(
                                left: 40,
                                top: 50,
                                bottom: 10,
                                right: 5,
                                child: SizedBox(
                                    height: 50,
                                    child: GestureDetector(
                                      child: Text(
                                        "Select Company",
                                        style: AppTextStyle.grey_16_txt,
                                      ),
                                      onTap: () {
                                        mainProviders.setIsShow(
                                            !mainProviders.isShow);
                                        _runExpandCheck();
                                        setState(() {});
                                      },
                                    ))),
                            Positioned(
                              right: 40,
                              top: 17,
                              bottom: 0,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  onPressed: () {
                                    mainProviders
                                        .setIsShow(!mainProviders.isShow);
                                    _runExpandCheck();
                                    setState(() {});
                                  },
                                  icon:
                                  // isShow
                                  //     ? const Icon(
                                  //   Icons.keyboard_arrow_up_outlined,
                                  //   size: 30,
                                  //   color: AppColor.panelBlack,
                                  // )
                                  //     :
                                  Image.asset(
                                    "assets/arrow-down.png",
                                    color: AppColor.panelBlack,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        TextFormFiledes(
                          labelTx: "Login",
                          keyType: TextInputType.text,
                          textController: mainProviders.login,
                          providers: mainProviders,
                          height: 50.sp,
                          edgeInsets:
                          const EdgeInsets.fromLTRB(30, 12, 30, 10),
                          obScuereText: false,
                          formater: registerProvider.maskText,
                        ),
                        TextFormFiledes(
                          labelTx: "Password",
                          keyType: TextInputType.number,
                          textController: mainProviders.password,
                          providers: mainProviders,
                          height: 50.sp,
                          edgeInsets:
                          const EdgeInsets.fromLTRB(30, 12, 30, 0),
                          suffixIconThree: mainProviders.passwordTf
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          obScuereText: mainProviders.passwordTf,
                          onPressedThree: () {
                            mainProviders.setBoolPassword();
                          },
                          formater: RegisterProviders().maskText,
                        ),
                        Container(
                            height: 70,
                            margin: const EdgeInsets.only(
                              left: 30,
                              right: 30,
                            ),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Checkbox(
                                        checkColor: Colors.white,
                                        side: const BorderSide(
                                            width: 1, color: Colors.blue),
                                        shape: RadiusBorder.roundedRadius_5,
                                        fillColor:
                                        MaterialStateProperty.resolveWith(
                                            getColor),
                                        value: mainProviders.isChecked,
                                        onChanged: (value) {
                                          mainProviders.isCheckedSet();
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Remember Me",
                                      style: AppTextStyle.grey_12_txt,
                                    )
                                  ],
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Forget password?",
                                      style: AppTextStyle.blue_16_txt,
                                    ))
                              ],
                            )),
                        MaterialButtons(
                          gr: false,
                          gradientText: DecorationBox.gradientText,
                          text: 'Login',
                          textColor: Colors.white,
                          shape: RadiusBorder.roundedRadius_6,
                          width: width,
                          decoration: DecorationBox.linerGradientDecoration,
                          height: 60,
                          padding: EdgeInsets.zero,
                          margin: const EdgeInsets.only(left: 30, right: 30),
                          onPressed: () {
                            if(mainProviders.isChecked) {
                              mainProviders.toast(context,"Chek",Colors.blue);
                              mainProviders.logins();
                              context.read<PanelProvider>().onPressedTf(0);
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (_) => const HomePage()));
                            }else{
                              mainProviders.toast(context,"Chek Remember Me",Colors.red);
                            }
                          },
                          textStyle: AppTextStyle.white_17_txt_w5,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 30.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account? ",
                                style: AppTextStyle.grey_17_txt,
                              ),
                              TextButton(
                                  onPressed: () {mainProviders.setLoginOrRegister();},
                                  child: Text(
                                    "Sent request",
                                    style: AppTextStyle.blue_18_txt,
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.39,
                        left: 10,
                        right: 10,
                        child: Column(
                          children: [
                            SizeTransition(
                                axisAlignment: 1.0,
                                sizeFactor: mainProviders.animation,
                                child: Container(
                                    height:
                                    MediaQuery.of(context).size.height *
                                        0.30,
                                    margin: const EdgeInsets.only(
                                        bottom: 10, left: 25, right: 25),
                                    padding:
                                    const EdgeInsets.only(bottom: 10),
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 4,
                                            color: Colors.black26,
                                            offset: Offset(0, 4))
                                      ],
                                    ),
                                    child: SingleChildScrollView(
                                        child: BuildDropListOptions.buildDropListOptions(
                                          mainProviders.list,
                                          context,
                                        ))
                                )
                            ),
                          ],
                        )),
                  ],
                ),
              )
        );
      });
      });
    });
  }
}
