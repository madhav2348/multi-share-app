import '/widget/Local/local_scanner.dart';

import 'package:flutter/material.dart';

class LocalRecieverScreen extends StatelessWidget {
  const LocalRecieverScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          child: LocalScannerWidget()),
    );
  }
}
