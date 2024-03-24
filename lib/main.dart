import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyQrCodeView(),
    );
  }
}

class MyQrCodeView extends StatefulWidget {
  const MyQrCodeView({super.key});

  @override
  State<MyQrCodeView> createState() => _MyQrCodeViewState();
}

class _MyQrCodeViewState extends State<MyQrCodeView> {
  final qrTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('See My Code'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: TextField(
              maxLines: null,
              onChanged: (text) {
                setState(() {});
              },
              controller: qrTextController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter You Code Here',
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: QrImageView(
              data: qrTextController.text,
              version: QrVersions.auto,
              size: 350.0,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    qrTextController.dispose();
    super.dispose();
  }
}
