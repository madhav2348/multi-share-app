import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_data/model/single_model.dart';
import 'package:share_data/screen/local_main_funtion/local_sender_screen.dart';
import '/screen/Local/local_view_download.dart';
import '/notifier/add_and_convert_notifier.dart';

class LocalEntryScreen extends StatefulWidget {
  const LocalEntryScreen({super.key});

  @override
  State<LocalEntryScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LocalEntryScreen> {
  TextEditingController keyValue = TextEditingController();
  // TextEditingController pairedValue = TextEditingController();

  // final List<RefrenceModel> refModel = [
  //   RefrenceModel(keyField: '', pairedField: '')
  // ];

  final List<SingleModel> singleModel = [SingleModel(data: '')]; // i think i dont need it as Provider is proviging the way to save data
  // void onSave(String key, String value) {
  //   refModel.add(RefrenceModel(keyField: key, pairedField: value));
  // }

  void onSaveSingle(String data) {
    singleModel.add(SingleModel(data: data));
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
    final model = Provider.of<AddAndConvertData>(context);
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
                            singleModel[index] = SingleModel(data: value);
                          },
                        ),
                        // TextField(
                        //   controller: keyValue,
                        //   decoration: InputDecoration(
                        //     label: Text(
                        //       'Value',
                        //       style: Theme.of(context).textTheme.headlineLarge,
                        //     ),
                        //   ),
                        //   onChanged: (value) {
                        //     singleModel[index] = SingleModel(data: value);
                        //   },
                        // ),
                      ],
                    );
                  }),
              ElevatedButton(
                onPressed: () {
                  // onSave(keyValue.text, pairedValue.text);
                  // model.addDataToRefModel(RefrenceModel(
                  //     keyField: keyValue.text, pairedField: pairedValue.text));
                  onSaveSingle(keyValue.text);
                  model.addDataToSingleModel(SingleModel(data: keyValue.text));
                },
                child: const Text('Add'),
              ),
              ElevatedButton(
                onPressed: () {
                  // onSave(keyValue.text, pairedValue.text);
                  // model.addDataToRefModel(RefrenceModel(
                  //     keyField: keyValue.text, pairedField: pairedValue.text));
                  onSaveSingle(keyValue.text);
                  model.addDataToSingleModel(SingleModel(data: keyValue.text));
                  onShare();
                },
                child: const Text('Share'),
              ),
            ],
          ),
        ));
  }
}
