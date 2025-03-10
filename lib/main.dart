import 'package:flutter/cupertino.dart';
import 'wifi_settings_page.dart';
import 'bluetooth_settings_page.dart';

void main() => runApp(const CupertinoApp(
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
  String connectedWiFi = "vivo V29"; // Default Wi-Fi
  bool bluetoothEnabled = false;
  bool cellularEnabled = false;
  bool hotspotEnabled = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black, // iPhone-style dark theme
      child: CustomScrollView(
        slivers: [
          // 🔹 Navigation Bar (iPhone-style)
          CupertinoSliverNavigationBar(
            backgroundColor: CupertinoColors.black,
            largeTitle: const Text("Settings", style: TextStyle(color: CupertinoColors.white)),
            border: null,
          ),

          SliverToBoxAdapter(
            child: Column(
              children: [
                // 🔹 Search Bar (Now at the Top)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: CupertinoSearchTextField(
                    placeholder: "Search",
                    style: const TextStyle(color: CupertinoColors.white),
                    backgroundColor: CupertinoColors.darkBackgroundGray,
                  ),
                ),

                // 🔹 Profile Section (Apple ID)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: CupertinoColors.darkBackgroundGray,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            width: 60,
                            height: 60,
                            color: CupertinoColors.systemGrey, // Placeholder for Profile Pic
                            child: const Icon(CupertinoIcons.person_alt, size: 40, color: CupertinoColors.white),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Nick Dela Cruz",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: CupertinoColors.white)),
                            Text("Apple ID, iCloud, Media & Purchases",
                                style: TextStyle(fontSize: 14, color: CupertinoColors.systemGrey)),
                          ],
                        ),
                        const Spacer(),
                        const Icon(CupertinoIcons.chevron_forward, color: CupertinoColors.systemGrey),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // 🔹 Settings List (First Section)
                _buildSettingsSection([
                  _buildSettingItem("Airplane Mode", CupertinoIcons.airplane, CupertinoColors.systemOrange,
                      trailing: CupertinoSwitch(
                        value: airplaneMode,
                        onChanged: (value) {
                          setState(() {
                            airplaneMode = value;
                          });
                        },
                      )),
                  _buildSettingItem("Wi-Fi", CupertinoIcons.wifi, CupertinoColors.systemBlue,
                      subtitle: connectedWiFi,
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
                      }),
                  _buildSettingItem("Bluetooth", CupertinoIcons.bluetooth, CupertinoColors.systemBlue,
                      subtitle: bluetoothEnabled ? "On" : "Not Connected", // ✅ Fixed Bluetooth Status
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => BluetoothSettingsPage(
                              onBluetoothToggle: (enabled) {
                                setState(() {
                                  bluetoothEnabled = enabled;
                                });
                              },
                            ),
                          ),
                        );
                      }),
                  _buildSettingItem("Cellular", CupertinoIcons.device_phone_portrait, CupertinoColors.systemGreen,
                      subtitle: cellularEnabled ? "On" : "Off",
                      onTap: () {
                        setState(() {
                          cellularEnabled = !cellularEnabled;
                        });
                      }),
                  _buildSettingItem("Personal Hotspot", CupertinoIcons.link, CupertinoColors.systemGreen,
                      subtitle: hotspotEnabled ? "On" : "Off",
                      onTap: () {
                        setState(() {
                          hotspotEnabled = !hotspotEnabled;
                        });
                      }),
                  _buildSettingItem("Battery", CupertinoIcons.battery_100, CupertinoColors.systemGreen),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Function to Build Settings Sections
  Widget _buildSettingsSection(List<Widget> items) {
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.darkBackgroundGray, // iPhone-style dark background
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(children: items),
    );
  }

  // 🔹 Function to Build Individual Setting Item
  Widget _buildSettingItem(String title, IconData icon, Color color,
      {String? subtitle, Widget? trailing, VoidCallback? onTap}) {
    return CupertinoListTile(
      title: Text(title, style: const TextStyle(color: CupertinoColors.white)),
      subtitle: subtitle != null ? Text(subtitle, style: const TextStyle(color: CupertinoColors.systemGrey)) : null,
      leading: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Icon(icon, color: CupertinoColors.white),
      ),
      trailing: trailing ?? const Icon(CupertinoIcons.chevron_forward, color: CupertinoColors.systemGrey),
      onTap: onTap,
    );
  }
}
