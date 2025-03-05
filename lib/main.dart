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
  bool airplaneMode = false;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Settings'),
        ),
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: SafeArea(child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                CupertinoListTile(
                    title: Text('Airplane Mode'),
                     leading: Container(
                       padding: EdgeInsets.all(3),
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(5),
                           color: CupertinoColors.systemOrange
                         ),
                         child: Icon(CupertinoIcons.airplane, color: CupertinoColors.white,)),
                )
              ],
            ),
          )
        ],
      )),
    ));
  }
}
