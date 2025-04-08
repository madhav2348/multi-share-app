import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_data/notifier/share_notifier.dart';
import 'package:share_data/screen/local_main_funtion/local_sender_screen.dart';

class LocalEntryScreen extends StatefulWidget {
  const LocalEntryScreen({super.key});

  @override
  State<LocalEntryScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LocalEntryScreen> {
  TextEditingController keyValue = TextEditingController();

  final List<String> singleModel =
      []; // i think i dont need it as Provider is proviging the way to save data

  void onSaveSingle(String data) {
    if (!singleModel.contains(data)) {
      singleModel.add(data);
    } else {
      return;
    }
  }

  void onShare() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LocalSenderScreen(),
      ),
    );
  }

  @override
  void dispose() {
    keyValue.dispose();
    // pairedValue.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ShareMapOfData>(context);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.black38),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListView.builder(
                  itemCount: singleModel.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        TextField(
                          controller: keyValue,
                          decoration: InputDecoration(
                            label: Text(
                              'Key',
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                          ),
                          onChanged: (value) {
                            singleModel[index] = value;
                          },
                        ),
                      ],
                    );
                  }),
              ElevatedButton(
                onPressed: () {
                  onSaveSingle(keyValue.text);
                  model.addToMap(keyValue.text);
                  onShare();
                },
                child: const Text('Share'),
              ),
            ],
          ),
        ));
  }
}
