import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Privacy Policy"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Column(
          children: [
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nec hendrerit turpis, a bibendum risus. Cras et erat non tortor ornare"),
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nec hendrerit turpis, a bibendum risus. Cras et erat non tortor ornare"),
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nec hendrerit turpis, a bibendum risus. Cras et erat non tortor ornare"),
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nec hendrerit turpis, a bibendum risus. Cras et erat non tortor ornare"),
            SizedBox(height: size.width * 0.05),
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nec hendrerit turpis, a bibendum risus. Cras et erat non tortor ornare"),
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nec hendrerit turpis, a bibendum risus. Cras et erat non tortor ornare"),
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nec hendrerit turpis, a bibendum risus. Cras et erat non tortor ornare"),
            SizedBox(height: size.width * 0.05),
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nec hendrerit turpis, a bibendum risus. Cras et erat non tortor ornare"),
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nec hendrerit turpis, a bibendum risus. Cras et erat non tortor ornare"),
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nec hendrerit turpis, a bibendum risus. Cras et erat non tortor ornare"),
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nec hendrerit turpis, a bibendum risus. Cras et erat non tortor ornare"),
          ],
        ),
      ),
    );
  }
}
