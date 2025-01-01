import 'package:provider/provider.dart';
import '/notifier/add_and_convert_notifier.dart';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class LocalQrCodeWidget extends StatelessWidget {
  const LocalQrCodeWidget({super.key});


  @override
  Widget build(BuildContext context) {
    final jsonConvert = Provider.of<AddAndConvertData>(context);
     return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, bottom: 90),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: QrImageView(
                data: jsonConvert.getJson,
                version: 4,
                size: 200,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text('Only scan by this app scanner'),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
