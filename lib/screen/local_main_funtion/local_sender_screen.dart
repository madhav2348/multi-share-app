import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_data/notifier/share_notifier.dart';

class LocalSenderScreen extends StatelessWidget {
  const LocalSenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final jsonConvert = Provider.of<ShareMapOfData>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: Padding(
            padding: EdgeInsets.only(left: 40, right: 40, bottom: 90),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: QrImageView(
                      data: jsonConvert.theDataList.toString(),
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
          )),
    );
  }
}
