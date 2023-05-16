import 'package:box_office_offline/ui/cutomDialogs/getCodePVC.dart';
import 'package:box_office_offline/ui/returnWidgets/homePageWidgets/animationSize.dart';
import 'package:box_office_offline/ui/returnWidgets/homePageWidgets/leftPanel.dart';
import 'package:box_office_offline/providers/historyProvider.dart';
import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/providers/registerProviders.dart';
import 'package:box_office_offline/widgets/panelWidgets/boxWidget.dart';
import 'package:box_office_offline/widgets/panelWidgets/categoryWidget.dart';
import 'package:box_office_offline/widgets/panelWidgets/customDialog.dart';
import 'package:box_office_offline/widgets/panelWidgets/moneyResiverPage.dart';
import 'package:box_office_offline/widgets/panelWidgets/myProf.dart';
import 'package:box_office_offline/widgets/panelWidgets/profWidget.dart';
import 'package:box_office_offline/widgets/panelWidgets/resiverPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

String selectedValue = "";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const List<Widget> _pages = <Widget>[
    BoxWidget(),
    ProfWidget(),
    CategoryWidget(),
    CustomDialog(),
    ResiverPage(),
    MoneyRecivePage(),
    MyProf(),
    // ScanQrWidget(cameras: [],),
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, WindowListener {
  bool searchtf = true;

  late AnimationController expandController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    expandController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 350));
    animation = CurvedAnimation(parent: expandController, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    super.dispose();
    windowManager.removeListener(this);
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    expandController.dispose();
  }

  @override
  bool onWindowMaximize() {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    onWindowMaximize();
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body:
            Consumer<ProvidersClass>(builder: (context, providersClass, child) {
          return Consumer<RegisterProviders>(
              builder: (context, registerProv, child) {
            return Consumer<HistoryProvider>(
                builder: (context, historyProv, child) {
              return Consumer<PanelProvider>(
                  builder: (context, panelProvider, child) {
                return Container(
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          /// left panel
                          const LeftPanel(),
                          Expanded(child: Consumer<PanelProvider>(
                              builder: (context, provider, child) {
                            return HomePage._pages.elementAt(provider.country);
                          })),

                          /// AnimatedSize in Container
                          const AnimationSizeContainer()
                        ],
                      ),

                      registerProv.showDImg
                          ? GetCodePVC(
                              providersClass: providersClass,
                              providers: registerProv,
                              onPressed: () {})
                          : Container()
                    ],
                  ),
                );
              });
            });
          });
        }));
  }
}
