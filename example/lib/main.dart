import 'package:custom_text_field/inset_field_shadow.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inset Field Shadow Example',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Inset Field Shadow Example'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InsetFieldShadow(
              margin: const EdgeInsets.all(12.0),
              padding: const EdgeInsets.all(3.0),
              controller: TextEditingController(),
              hint: 'Enter your text',
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field is empty";
                }
                return null;
              },
              label: const Text('Label'),
              prefix: const Icon(Icons.text_fields),
              suffix: const Icon(Icons.check),
            ),
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {}
                },
                child: const Text("Validate"))
          ],
        ),
      ),
    );
  }
}
