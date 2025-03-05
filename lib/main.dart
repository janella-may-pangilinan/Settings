import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()=>runApp(CupertinoApp(
debugShowCheckedModeBanner: false,
  theme: CupertinoThemeData(
    brightness: Brightness.light
  ),
  home: MyApp(),));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: SafeArea(child: Column(
        children: [

        ],
      )),
    ));
  }
}
