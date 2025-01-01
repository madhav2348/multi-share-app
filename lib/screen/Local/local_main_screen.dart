import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:provider/provider.dart';

import '/screen/Local/local_entry.dart';
import '/notifier/theme_notifier.dart';
import '../local_main_funtion/local_reciever_screen.dart';

class LocalMainScreen extends StatelessWidget {
  const LocalMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themer = Provider.of<ThemeChanger>(context);
    
    return Scaffold(
      appBar: AppBar(
        actions: [
          AdvancedSwitch(
            width: 65,
            activeColor: Colors.black12,
            inactiveChild: const Text('Light'),
            activeChild: const Text('Dark'),
            initialValue: themer.themeMode == ThemeMode.dark,
            onChanged: (value) {
              themer.toggle(value);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>const LocalEntryScreen(),
                    ),
                  ),
                  child: const Text('Sender/Scanner'),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>const LocalRecieverScreen(),
                    ),
                  ),
                  child: const Text('Receiver/QR Code'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
