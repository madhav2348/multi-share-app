import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '/screen/Local/local_view_download.dart';
import '/notifier/share_notifier.dart';
import '/model/data_model.dart';

class LocalScannerWidget extends StatelessWidget {
  LocalScannerWidget({super.key});
  final MobileScannerController controller = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    final mapingdata = Provider.of<ShareMapOfData>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 400,
              height: 400,
              child: MobileScanner(
                controller: controller,
                fit: BoxFit.contain,
                onDetect: (codes) {
                  if (codes.raw != null) {
                    Vibration.vibrate(duration: 100);
                    Map<String, dynamic> scanned_data =
                        jsonDecode(codes.raw.toString());
                    mapingdata.addToMap(scanned_data);
                    print('mapingdata.theDataList' +
                        mapingdata.theDataList[0]['data']);
                    Navigator.push(
                      (context),
                      MaterialPageRoute(
                        builder: (context) => const LocalViewDownload(),
                      ),
                    );
                  }
                },
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text('Scan QR Code of this app only'),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
