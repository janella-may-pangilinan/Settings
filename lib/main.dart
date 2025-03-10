import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'wifi_settings_page.dart';


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
  String selectedWiFi = "HCC_ICSLab"; // Default WiFi network

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
              _buildProfileSection(),
              SizedBox(height: 10),
              _buildBackupWarning(),
              SizedBox(height: 20),
              Expanded(child: _buildSettingsList()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
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
            child: Text("JP", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: CupertinoColors.white)),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Janella May Pangilinan", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text("Apple Account, iCloud, and more", style: TextStyle(fontSize: 16, color: CupertinoColors.systemGrey)),
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
    );
  }

  Widget _buildBackupWarning() {
    return Container(
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
            child: Text('Your iPhone can’t be backed up.', style: TextStyle(color: CupertinoColors.systemRed, fontSize: 16)),
          )
        ],
      ),
    );
  }

  Widget _buildSettingsList() {
    return ListView(
      children: [
        CupertinoListTile(
          title: Text('Airplane Mode'),
          leading: Icon(CupertinoIcons.airplane, color: CupertinoColors.white),
          trailing: CupertinoSwitch(
            value: airplaneMode,
            onChanged: (value) {
              setState(() {
                airplaneMode = value;
              });
            },
          ),
        ),
        CupertinoListTile(
          title: Text('Wi-Fi'),
          additionalInfo: Text(selectedWiFi),
          leading: Icon(CupertinoIcons.wifi, color: CupertinoColors.white),
          trailing: Icon(CupertinoIcons.chevron_right, color: Colors.grey),
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => WiFiSettingsPage(
                  onNetworkSelected: (network) {
                    setState(() {
                      selectedWiFi = network;
                    });
                  },
                ),
              ),
            );
          },
        ),
        CupertinoListTile(
          title: Text('Bluetooth'),
          additionalInfo: Text('On'),
          leading: Icon(CupertinoIcons.bluetooth, color: CupertinoColors.white),
          trailing: Icon(CupertinoIcons.chevron_right, color: Colors.grey),
          onTap: () {},
        ),
        CupertinoListTile(
          title: Text('Cellular'),
          leading: Icon(Icons.cell_tower, color: CupertinoColors.white),
          trailing: Icon(CupertinoIcons.chevron_right, color: Colors.grey),
          onTap: () {},
        ),
        CupertinoListTile(
          title: Text('Personal Hotspot'),
          additionalInfo: Text('On'),
          leading: Icon(CupertinoIcons.personalhotspot, color: CupertinoColors.white),
          trailing: Icon(CupertinoIcons.chevron_right, color: Colors.grey),
          onTap: () {},
        ),
      ],
    );
  }
}
