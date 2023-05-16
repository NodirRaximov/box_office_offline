import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScanPage extends StatefulWidget {
  const QrCodeScanPage({Key? key}) : super(key: key);

  @override
  State<QrCodeScanPage> createState() => _QrCodeScanPageState();
}

class _QrCodeScanPageState extends State<QrCodeScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  late QRViewController controller;


  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height*0.4,
              width: MediaQuery.of(context).size.width*0.4,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width*0.4,
                height: MediaQuery.of(context).size.height * 0.09,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                    color: Color.fromARGB(179, 40, 43, 44)),
                child: Center(
                  child: (result != null)
                      ? Text(
                    'Barcode Type: ${describeEnum(result!.format)}  Data: ${result!.code}',maxLines: 3, style: const TextStyle(color: Colors.white,fontSize: 20),)
                      :const Text('Scan a code',style: TextStyle(color: Colors.white,fontSize: 18)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
