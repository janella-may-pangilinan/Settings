import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(CupertinoApp(
  debugShowCheckedModeBanner: false,
  theme: CupertinoThemeData(brightness: Brightness.dark),
  home: MyApp(),
));

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
          leading: Text('Settings',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SafeArea(
              child: Column(
                children: [
                  // User Profile Section
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: CupertinoColors.systemGrey4,
                          child: Text(
                            "JP",
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: CupertinoColors.white),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Janella May Pangilinan",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Apple Account, iCloud, and more",
                              style: TextStyle(fontSize: 16, color: CupertinoColors.systemGrey),
                            ),
                          ],
                        ),

                        Spacer(),
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          child: Icon(CupertinoIcons.chevron_right, size: 24, color: CupertinoColors.systemGrey),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  // Backup Warning Message
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: CupertinoColors.systemRed.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.exclamationmark_triangle_fill, color: CupertinoColors.systemRed),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Your iPhone can’t be backed up.',
                            style: TextStyle(color: CupertinoColors.systemRed, fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView(
                      children: [
                        CupertinoListTile(
                          title: Text('Airplane Mode'),
                          onTap: () {
                            setState(() {
                              airplaneMode = !airplaneMode;
                            });
                          },
                          leading: Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey),
                              child: Icon(
                                CupertinoIcons.airplane,
                                color: CupertinoColors.white,
                              )),
                          trailing: CupertinoSwitch(
                              value: airplaneMode,
                              onChanged: (value) {
                                setState(() {
                                  airplaneMode = !airplaneMode;
                                });
                              }),
                        ),
                        CupertinoListTile(
                            title: Text('Wi-Fi'),
                            onTap: () {},
                            additionalInfo: Text('HCC_ICSLab'),
                            leading: Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey),
                                child: Icon(
                                  CupertinoIcons.wifi,
                                  color: CupertinoColors.white,
                                )),
                            trailing: Icon(
                              CupertinoIcons.chevron_right,
                              size: 20,
                              color: Colors.grey,
                            )),
                        CupertinoListTile(
                            title: Text('Bluetooth'),
                            onTap: () {},
                            additionalInfo: Text('On'),
                            leading: Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey),
                                child: Icon(
                                  CupertinoIcons.bluetooth,
                                  color: CupertinoColors.white,
                                )),
                            trailing: Icon(
                              CupertinoIcons.chevron_right,
                              size: 20,
                              color: Colors.grey,
                            )),
                        CupertinoListTile(
                            title: Text('Cellular'),
                            onTap: () {},
                            leading: Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey),
                                child: Icon(
                                  Icons.cell_tower,
                                  color: CupertinoColors.white,
                                )),
                            trailing: Icon(
                              CupertinoIcons.chevron_right,
                              size: 20,
                              color: Colors.grey,
                            )),
                        CupertinoListTile(
                            title: Text('Personal Hotspot'),
                            onTap: () {},
                            leading: Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey),
                                child: Icon(
                                  CupertinoIcons.personalhotspot,
                                  color: CupertinoColors.white,
                                )),
                            additionalInfo: Text('On'),
                            trailing: Icon(
                              CupertinoIcons.chevron_right,
                              size: 20,
                              color: Colors.grey,
                            )),
                      ],
                    ),
                  )
                ],
              )),
        ));
  }
}
