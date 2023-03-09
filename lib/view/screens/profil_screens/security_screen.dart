import 'package:flutter/material.dart';


class SecurityScreen extends StatefulWidget {
    const SecurityScreen({Key? key}) : super(key: key);

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  bool faceId = true;
  bool rememberMe = true;
  bool touchId = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Security"),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("Face Id"),
            trailing: Switch(
              value: faceId,
              onChanged: (bool value) {
                setState(() {
                  faceId = value;
                });
              },
            ),
          ),
          SizedBox(height: size.height * 0.03),
          ListTile(
            title: const Text("Remember Me"),
            trailing: Switch(
              value: rememberMe,
              onChanged: (bool value) {
                setState(() {
                  rememberMe = value;
                });
              },
            ),
          ),
          SizedBox(height: size.height * 0.03),
          ListTile(
            title: const Text("Touch Id"),
            trailing: Switch(
              value: touchId,
              onChanged: (bool value) {
                setState(() {
                  touchId = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
