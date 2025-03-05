import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()=>runApp(CupertinoApp(
debugShowCheckedModeBanner: false,
  theme: CupertinoThemeData(
    brightness: Brightness.dark
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
                     onTap: (){
                     },
                     leading: Container(
                       padding: EdgeInsets.all(3),
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(5),
                           color: CupertinoColors.systemOrange
                         ),
                         child: Icon(CupertinoIcons.airplane, color: CupertinoColors.white,)),

                  trailing: CupertinoSwitch(value: airplaneMode, onChanged: (value){
                    setState(() {
                      airplaneMode = !airplaneMode;
                    });
                  }),
                ),
                CupertinoListTile(
                  title: Text('Wi-Fi'),
                  onTap: (){
                    setState(() {
                      airplaneMode = !airplaneMode;
                    });
                  },
                  additionalInfo: Text('HCC_ICSLab'),
                  leading: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: CupertinoColors.systemBlue
                      ),
                      child: Icon(CupertinoIcons.wifi, color: CupertinoColors.white,)),

                  trailing: Icon(CupertinoIcons.chevron_right, size: 20, color: Colors.grey,)
                ),

                CupertinoListTile(
                    title: Text('Bluetooth'),
                    onTap: (){
                    },
                    additionalInfo: Text('On'),
                    leading: Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: CupertinoColors.systemBlue
                        ),
                        child: Icon(CupertinoIcons.bluetooth, color: CupertinoColors.white,)),

                    trailing: Icon(CupertinoIcons.chevron_right, size: 20, color: Colors.grey,)
                ),

                CupertinoListTile(
                    title: Text('Cellular'),
                    onTap: (){
                    },

                    leading: Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: CupertinoColors.systemGreen
                        ),
                        child: Icon(Icons.cell_tower, color: CupertinoColors.white,)),

                    trailing: Icon(CupertinoIcons.chevron_right, size: 20, color: Colors.grey,)
                ),

                CupertinoListTile(
                    title: Text('Personal Hotspot'),
                    onTap: (){
                    },

                    leading: Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: CupertinoColors.systemGreen
                        ),
                        child: Icon(CupertinoIcons.personalhotspot, color: CupertinoColors.white,)),
                      additionalInfo: Text('On') ,
                    trailing: Icon(CupertinoIcons.chevron_right, size: 20, color: Colors.grey,)
                ),
              ],
            ),
          )
        ],
      )),
    ));
  }
}
