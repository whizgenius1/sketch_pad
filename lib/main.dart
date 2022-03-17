import 'package:sketch_pad/drawing_page.dart';
import 'package:sketch_pad/general_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: GeneralProvider()),
      ],
      child: MaterialApp(
        title: 'Drawing App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DrawingPage(),
      ),
    );
  }
}
