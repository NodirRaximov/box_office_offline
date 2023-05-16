import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/providers/registerProviders.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({
    Key? key,
    this.cameras,
  }) : super(key: key);

  final List<CameraDescription>? cameras;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late final CameraController _cameraController;
  late XFile picture;

  // Future<void> task() async {
  //   await _cameraController.initializeCameras();
  //   await _cameraController.isDesktop;
  //   debugPrint("${_cameraController.isDesktop}")
  //   await _cameraController.is_camera_active;
  //   await _cameraController.initializeCamera(
  //     setState: setState,
  //   );
  //   await _cameraController.activateCamera(
  //     setState: setState,
  //     mounted: () {
  //       return mounted;
  //     },
  //   );
  // }
  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // task();
    initCamera(widget.cameras![0]);
  }

  // Future takePicture() async {
  //   if (!_cameraController.value.isInitialized) {
  //     debugPrint("eroorrrvfdv$picture");
  //     return null;
  //   }
  //   if (_cameraController.value.isTakingPicture) {
  //     debugPrint("eroorrrvfdv$picture");
  //     return null;
  //   }
  //   try {
  //     await _cameraController.setFlashMode(FlashMode.off);
  //     await _cameraController.takePicture().then((picture) {
  //       context.read<ProvidersClass>().showPicture(picture.path);
  //       Navigator.pop(context);
  //       debugPrint("eroorrrvfdv$picture");
  //     });
  //   } on CameraException catch (e) {
  //     debugPrint('Error occured while taking picture: $e');
  //     debugPrint("eroorrrvfdv$picture");
  //     return null;
  //   }
  // }

  Future initCamera(CameraDescription cameraDescription) async {
    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);
    try {
      await _cameraController.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Camera(
  //       cameraController: _cameraController,
  //       onCameraNotInit: (context) {
  //         return const SizedBox.shrink();
  //       },
  //       onCameraNotSelect: (context) {
  //         return const SizedBox.shrink();
  //       },
  //       onCameraNotActive: (context) {
  //         return const SizedBox.shrink();
  //       },
  //       onPlatformNotSupported: (context) {
  //         return const SizedBox.shrink();
  //       },
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       onPressed: () async {
  //         if (kDebugMode) {
  //           print(
  //             _cameraController.action_change_camera(
  //               camera_id: 1,
  //               setState: setState,
  //               mounted: () {
  //                 return mounted;
  //               },
  //               onCameraNotInit: () {},
  //               onCameraNotSelect: () {},
  //               onCameraNotActive: () {},
  //             ),
  //           );
  //         }
  //       },
  //       child: const Icon(
  //         Icons.add_circle_outline_sharp,
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Consumer<ProvidersClass>(builder: (context, providersClass, child) {
      return Consumer<RegisterProviders>(builder: (context, registerProv, child) {
        return Scaffold(body: SafeArea(
          child: Stack(children: [
            (_cameraController.value.isInitialized)
                ? SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: CameraPreview(_cameraController))
                : Container(
                color: Colors.black,
                child: const Center(child: CircularProgressIndicator())),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                      color: Color.fromARGB(179, 40, 43, 44)),
                  child: IconButton(
                    onPressed: () async {
                      final img =
                      await _cameraController.takePicture().then((value) => {
                        providersClass
                            .showPicture(value.path),
                       registerProv
                            .picListAdd(value.path),
                        Navigator.pop(context),
                      });
                      debugPrint("$img");
                    },
                    iconSize: 40,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.circle, color: Colors.white),
                  )),
            )
          ]),
        ));
      });
    });
  }
}
