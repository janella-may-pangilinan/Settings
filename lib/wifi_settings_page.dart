import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WiFiSettingsPage extends StatefulWidget {
  final Function(String) onNetworkSelected;

  WiFiSettingsPage({super.key, required this.onNetworkSelected});

  @override
  _WiFiSettingsPageState createState() => _WiFiSettingsPageState();
}

class _WiFiSettingsPageState extends State<WiFiSettingsPage> {
  bool wifiEnabled = false;
  bool enableWAPI = true;
  String? connectedNetwork;

  List<Map<String, dynamic>> wifiNetworks = [
    {"name": "!!", "secured": true},
    {"name": "_FREE Smart WiFi @HCC", "secured": false},
    {"name": "Haha", "secured": true},
    {"name": "OPPO Reno12 Pro 5G", "secured": true},
    {"name": "realme 6", "secured": false},
    {"name": "#GigaSmartWiFi", "secured": true},
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      navigationBar: CupertinoNavigationBar(
        middle: Text("Wi-Fi"),
        previousPageTitle: "Settings",
        backgroundColor: CupertinoColors.black.withOpacity(0.9),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// WLAN Header Card
              _buildWiFiHeader(),

              /// Apps Using WLAN & Cellular
              CupertinoListTile(
                title: Text("Apps Using WLAN & Cellular"),
                trailing: Icon(CupertinoIcons.chevron_forward, color: CupertinoColors.systemGrey),
                onTap: () {}, // Add navigation
              ),

              /// Enable WAPI Toggle
              CupertinoListTile(
                title: Text("Enable WAPI"),
                trailing: CupertinoSwitch(
                  value: enableWAPI,
                  onChanged: (value) {
                    setState(() {
                      enableWAPI = value;
                    });
                  },
                ),
              ),

              /// Show Wi-Fi Networks when enabled
              if (wifiEnabled) _buildWiFiNetworks(),
            ],
          ),
        ),
      ),
    );
  }

  /// 📌 Wi-Fi Header
  Widget _buildWiFiHeader() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: CupertinoColors.darkBackgroundGray,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(CupertinoIcons.wifi, size: 50, color: CupertinoColors.systemBlue), // 🔵 Wi-Fi icon
            SizedBox(height: 10),
            Text("WLAN",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: CupertinoColors.white)),
            SizedBox(height: 5),
            Text(
              "Connect to WLAN, view available networks, and manage settings for joining networks and nearby hotspots.",
              style: TextStyle(fontSize: 14, color: CupertinoColors.systemGrey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 3),
            GestureDetector(
              onTap: () {}, // Add navigation for "Learn more..."
              child: Text("Learn more...", style: TextStyle(fontSize: 14, color: CupertinoColors.activeBlue)),
            ),
            SizedBox(height: 10),
            CupertinoListTile(
              title: Text("WLAN"),
              trailing: CupertinoSwitch(
                value: wifiEnabled,
                onChanged: (value) {
                  setState(() {
                    wifiEnabled = value;
                    if (!wifiEnabled) {
                      connectedNetwork = null; // 🛑 Hide connected network when Wi-Fi is OFF
                    }
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Text(
                "AirDrop, AirPlay, Notify When Left Behind, and improved location accuracy require WLAN.",
                style: TextStyle(fontSize: 12, color: CupertinoColors.systemGrey2),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 📌 Wi-Fi Networks List
  Widget _buildWiFiNetworks() {
    return Column(
      children: [
        /// Show **Connected Network** if there is one
        if (connectedNetwork != null) ...[
          _buildSectionTitle("MY NETWORKS"),
          _buildWiFiTile(connectedNetwork!, true, true),
        ],

        /// Available Networks
        _buildSectionTitle("OTHER NETWORKS"),
        ...wifiNetworks.map((network) {
          return _buildWiFiTile(network["name"], network["secured"], false);
        }).toList(),
      ],
    );
  }

  /// 📌 Section Title
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(title, style: TextStyle(color: CupertinoColors.systemGrey, fontSize: 14)),
    );
  }

  /// 📌 Wi-Fi Tile with **Lock** & **Info** Icon
  Widget _buildWiFiTile(String name, bool secured, bool isConnected) {
    return CupertinoListTile(
      title: Text(name, style: TextStyle(fontWeight: isConnected ? FontWeight.bold : FontWeight.normal)),
      onTap: () {
        setState(() {
          connectedNetwork = name;
        });
        widget.onNetworkSelected(name);
      },
      leading: Icon(
        CupertinoIcons.wifi,
        color: CupertinoColors.systemBlue, // 🔵 Wi-Fi icon
      ),
      additionalInfo: Row(
        children: [
          if (secured) Icon(CupertinoIcons.lock, size: 16, color: CupertinoColors.systemGrey), // 🔒 Lock icon
          SizedBox(width: 6),
          Icon(CupertinoIcons.info, size: 18, color: CupertinoColors.systemBlue), // ⓘ Info icon
        ],
      ),
    );
  }
}
