import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'wifi_settings_page.dart';
import 'bluetooth_settings_page.dart';

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
  String connectedWiFi = "vivo V29"; // Default connected Wi-Fi
  String bluetoothStatus = "On"; // Default Bluetooth status

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('Settings')),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Column(
            children: [
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
                      leading: _iconTile(CupertinoIcons.airplane, CupertinoColors.systemOrange),
                      trailing: CupertinoSwitch(
                        value: airplaneMode,
                        onChanged: (value) {
                          setState(() {
                            airplaneMode = value;
                          });
                        },
                      ),
                    ),

                    // Wi-Fi Section
                    CupertinoListTile(
                      title: Text('Wi-Fi'),
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => WiFiSettingsPage(
                              onNetworkSelected: (network) {
                                setState(() {
                                  connectedWiFi = network;
                                });
                              },
                            ),
                          ),
                        );
                      },
                      additionalInfo: Text(connectedWiFi),
                      leading: _iconTile(CupertinoIcons.wifi, CupertinoColors.systemBlue),
                      trailing: Icon(CupertinoIcons.chevron_right, size: 20, color: Colors.grey),
                    ),

                    // Bluetooth Section
                    CupertinoListTile(
                      title: Text('Bluetooth'),
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => BluetoothSettingsPage(
                              onBluetoothToggle: (status) {
                                setState(() {
                                  bluetoothStatus = status;
                                });
                              },
                            ),
                          ),
                        );
                      },
                      additionalInfo: Text(bluetoothStatus),
                      leading: _iconTile(CupertinoIcons.bluetooth, CupertinoColors.systemBlue),
                      trailing: Icon(CupertinoIcons.chevron_right, size: 20, color: Colors.grey),
                    ),

                    // Cellular Section
                    CupertinoListTile(
                      title: Text('Cellular'),
                      onTap: () {},
                      leading: _iconTile(Icons.cell_tower, CupertinoColors.systemGreen),
                      trailing: Icon(CupertinoIcons.chevron_right, size: 20, color: Colors.grey),
                    ),

                    // Personal Hotspot Section
                    CupertinoListTile(
                      title: Text('Personal Hotspot'),
                      onTap: () {},
                      leading: _iconTile(CupertinoIcons.personalhotspot, CupertinoColors.systemGreen),
                      additionalInfo: Text('On'),
                      trailing: Icon(CupertinoIcons.chevron_right, size: 20, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconTile(IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: color),
      child: Icon(icon, color: CupertinoColors.white),
    );
  }
}
