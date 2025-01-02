import 'package:flutter/material.dart';
import '/widget/Local/local_qr_widget.dart';

class LocalSenderScreen extends StatelessWidget {
  const LocalSenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding:  EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: LocalQrCodeWidget()
      ),
    );
  }
}
