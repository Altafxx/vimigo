import 'package:flutter/material.dart';
import 'package:vimigo/views/home_page.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, devicType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Vimigo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          scaffoldBackgroundColor: Colors.blueGrey[900],
        ),
        home: const HomePage(),
      );
    });
  }
}
