import 'package:flutter/material.dart';


class AppearanceScreen extends StatefulWidget {
  const AppearanceScreen({Key? key}) : super(key: key);

  @override
  State<AppearanceScreen> createState() => _AppearanceScreenState();
}

class _AppearanceScreenState extends State<AppearanceScreen> {
  bool darkMode = true;
  bool blur = false;
  bool fullScreen = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Appearance"),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("Dark Mode"),
            trailing: Switch(
              value: darkMode,
              onChanged: (bool value) {
                setState(() {
                  darkMode = value;
                });
              },
            ),
          ),
          SizedBox(height: size.height * 0.03),
          ListTile(
            title: const Text("Blur Background"),
            trailing: Switch(
              value: blur,
              onChanged: (bool value) {
                setState(() {
                  blur = value;
                });
              },
            ),
          ),
          SizedBox(height: size.height * 0.03),
          ListTile(
            title: const Text("Full Screen Mode"),
            trailing: Switch(
              value: fullScreen,
              onChanged: (bool value) {
                setState(() {
                  fullScreen = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
