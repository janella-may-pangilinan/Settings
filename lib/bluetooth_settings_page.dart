import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:async';

class BluetoothSettingsPage extends StatefulWidget {
  final Function(bool) onBluetoothToggle;

  const BluetoothSettingsPage({super.key, required this.onBluetoothToggle});

  @override
  State<BluetoothSettingsPage> createState() => _BluetoothSettingsPageState();
}

class _BluetoothSettingsPageState extends State<BluetoothSettingsPage> {
  bool bluetoothEnabled = false;
  bool isLoading = false;

  List<Map<String, dynamic>> pairedDevices = [
    {"name": "AirPods Pro", "connected": true},
  ];

  List<String> availableDevices = [];
  final List<String> foundDevices = ["Car Audio", "Wireless Headphones", "Sony WH-1000XM5", "JBL Speaker", "Galaxy Buds"];

  void toggleBluetooth(bool value) {
    setState(() {
      bluetoothEnabled = value;
      isLoading = value;
      availableDevices.clear();
    });

    widget.onBluetoothToggle(value);

    if (value) {
      // Simulate device scanning
      Timer(const Duration(seconds: 3), () {
        setState(() {
          availableDevices.addAll(foundDevices);
          isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text("Bluetooth")),
      child: SafeArea(
        child: Column(
          children: [
            /// 🔹 Bluetooth Header
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: CupertinoColors.darkBackgroundGray,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  const Icon(CupertinoIcons.bluetooth, size: 50, color: CupertinoColors.systemBlue),
                  const SizedBox(height: 10),
                  const Text("Bluetooth", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: CupertinoColors.white)),
                  const SizedBox(height: 5),
                  const Text(
                    "Connect to accessories for streaming music, making phone calls, and gaming.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: CupertinoColors.systemGrey),
                  ),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {}, // Placeholder action
                    child: const Text("Learn more...", style: TextStyle(color: CupertinoColors.systemBlue, fontSize: 14)),
                  ),
                ],
              ),
            ),

            /// 🔹 Bluetooth Toggle
            CupertinoListTile(
              title: const Text("Bluetooth"),
              trailing: CupertinoSwitch(
                value: bluetoothEnabled,
                onChanged: toggleBluetooth,
              ),
            ),

            /// 🔹 Bluetooth Info Text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Text(
                "AirDrop, AirPlay, Find My, and Location Services use Bluetooth.",
                style: TextStyle(color: CupertinoColors.systemGrey, fontSize: 12),
              ),
            ),

            if (bluetoothEnabled) ...[
              /// 🔹 Paired Devices
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text("MY DEVICES", style: TextStyle(color: CupertinoColors.systemGrey, fontSize: 14)),
              ),
              Column(
                children: pairedDevices.map((device) {
                  return CupertinoListTile(
                    title: Text(device["name"]),
                    additionalInfo: Text(device["connected"] ? "Connected" : "Not Connected"),
                    leading: Icon(
                      device["connected"] ? CupertinoIcons.check_mark_circled : CupertinoIcons.device_phone_portrait,
                      color: device["connected"] ? CupertinoColors.activeBlue : CupertinoColors.systemGrey,
                    ),
                  );
                }).toList(),
              ),

              /// 🔹 Available Devices (Loading + Devices)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text("OTHER DEVICES", style: TextStyle(color: CupertinoColors.systemGrey, fontSize: 14)),
              ),
              if (isLoading)
                const CupertinoActivityIndicator(radius: 10)
              else
                Column(
                  children: availableDevices.map((device) {
                    return CupertinoListTile(
                      title: Text(device),
                      additionalInfo: Row(
                        children: [
                          const Text("Not Connected", style: TextStyle(color: CupertinoColors.systemGrey)),
                          const SizedBox(width: 8),
                          /// 🔹 "ⓘ" Icon inside a blue circle (iOS-style)
                          Container(
                            width: 22,
                            height: 22,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: CupertinoColors.systemBlue,
                            ),
                            child: const Icon(
                              CupertinoIcons.info,
                              color: CupertinoColors.white,
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                      leading: const Icon(CupertinoIcons.device_phone_portrait, color: CupertinoColors.systemGrey),
                    );
                  }).toList(),
                ),
            ],
          ],
        ),
      ),
    );
  }
}
