// import 'package:flutter/material.dart';
// import 'package:uog/src/constant/colors.dart';
//
// class QrCodeScreen extends StatelessWidget {
//   const QrCodeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Scan QR Code",
//           style: TextStyle(
//               fontWeight: FontWeight.bold, color: AppColors.primaryColor),
//         ),
//       ),
//       body: ListView(children: [
//         Stack(
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height * 0.8,
//               decoration: BoxDecoration(color: AppColors.blackColor),
//               // child: ,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Center(
//                 child: Container(
//                   height: MediaQuery.of(context).size.height * 0.4,
//                   decoration: BoxDecoration(
//                       color: AppColors.scaffoldBackground,
//                       borderRadius: BorderRadius.circular(8)),
//                 ),
//               ),
//             )
//           ],
//         ),
//         Padding(
//           padding: const EdgeInsets.fromLTRB(20.0, 10, 20, 20),
//           child: Text("Align the QR code within the frame to scan it.", style: TextStyle(fontSize: 15, ),),
//         ),
//       ]),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';
import 'package:uog/src/constant/colors.dart';
import 'package:uog/src/students/dashboard/qrcode/qr_result.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  bool isFlashOn = false;
  bool isFrontCamera = false;
  bool isScanCompleted = false;
  MobileScannerController cameraController = MobileScannerController();

  void closeScreen() {
    isScanCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Scan QR Code",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: AppColors.primaryColor),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            setState(() {
              isFlashOn = !isFlashOn;
            });
            cameraController.toggleTorch();
          },
          icon: Icon(
            Icons.flash_on,
            color: isFlashOn ? Colors.grey : Colors.black,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isFrontCamera = !isFrontCamera;
                });
                cameraController.switchCamera();
              },
              icon: Icon(
                Icons.flip_camera_android,
                color: isFrontCamera ? Colors.grey : Colors.black,
              )),
        ],
      ),
      body: Container(
          child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Stack(
                children: [
                  MobileScanner(
                    allowDuplicates: true,
                    controller: cameraController,
                    onDetect: (barcode, args) {
                      if (!isScanCompleted) {
                        isScanCompleted = true;
                        String code = barcode.rawValue ?? "";
                        RegExp regExp = RegExp(r"ID No: (\d+)");
                        Match? match = regExp.firstMatch(code);
                        String? studentId;
                        if (match != null && match.groupCount > 0) {
                          studentId = match.group(1);
                        }

                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return QRResult(
                            // code: studentId ?? "Unknown Student ID",
                            closeScreen: closeScreen,
                          );
                        }));
                      }
                    },
                  ),
                  QRScannerOverlay(
                    overlayColor: Colors.white38,
                    borderColor: Colors.white,
                    borderRadius: 20,
                    borderStrokeWidth: 5,
                    scanAreaWidth: 250,
                    scanAreaHeight: 250,
                  )
                ],
              )),
          const Padding(
            padding: EdgeInsets.fromLTRB(20.0, 10, 20, 20),
            child: Text(
              "Align the QR code within the frame to scan it.",
              style: TextStyle(
                fontSize: 13,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
