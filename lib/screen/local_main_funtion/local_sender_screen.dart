import 'package:flutter/material.dart';
import '/widget/Local/local_scanner.dart';

class LocalSenderScreen extends StatelessWidget {
  const LocalSenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: LocalScannerWidget(),
      ),
    );
  }
}
