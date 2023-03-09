import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

import '../../widgets/costume_widgets.dart';

class NotificationsScreen extends StatefulWidget {
   NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool sound = true;
  bool vibrate = true;
  bool newTips = true;
  bool newService = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Notifications"),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("Sound"),
            trailing: Switch(
              value: sound,
              onChanged: (bool value) {
                setState(() {
                  sound = value;
                });
              },
            ),
          ),
          SizedBox(height: size.height * 0.03),
          ListTile(
            title: const Text("Vibrate"),
            trailing: Switch(
              value: vibrate,
              onChanged: (bool value) {
                setState(() {
                  vibrate = value;
                });
              },
            ),
          ),
          SizedBox(height: size.height * 0.03),
          ListTile(
            title: const Text("New Tips Available"),
            trailing: Switch(
              value: newTips,
              onChanged: (bool value) {
                setState(() {
                  newTips = value;
                });
              },
            ),
          ),
          SizedBox(height: size.height * 0.03),
          ListTile(
            title: const Text("New Service Available"),
            trailing: Switch(
              value: newService,
              onChanged: (bool value) {
                setState(() {
                  newService = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
