import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/notifier/add_and_convert_notifier.dart';
import '/model/data_model.dart';

import '/screen/Local/local_main_screen.dart';

class LocalEntryScreen extends StatefulWidget {
  const LocalEntryScreen({super.key});

  @override
  State<LocalEntryScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LocalEntryScreen> {
  TextEditingController keyValue = TextEditingController();
  TextEditingController pairedValue = TextEditingController();

  final List<RefrenceModel> refModel = [];

  final _form = GlobalKey<FormState>();
  void onSave() {
    if (_form.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LocalMainScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Fill the required field')));
    }
  }

  @override
  void dispose() {
    keyValue.dispose();
    pairedValue.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AddAndConvertData>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.black38),
          width: 350,
          height: 400,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _form,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Share',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: keyValue,
                    decoration: InputDecoration(
                      hintText: 'Key',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Please enter Something';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: pairedValue,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Value',
                    ),
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Please Enter Something';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () {
                      onSave();
                      RefrenceModel(
                          keyField: keyValue.text,
                          pairedField: pairedValue.text);
                    },
                    child: const Text('Add'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      onSave();
                      model.addData(
                        RefrenceModel(
                            keyField: keyValue.text,
                            pairedField: pairedValue.text),
                      );
                    },
                    child: const Text('Share'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
