import 'package:doctors/view/widgets/costume_widgets.dart';
import 'package:flutter/material.dart';

import '../../../consts/colors.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Contact Us"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text("Full Name", style: TextStyle(fontSize: size.width * 0.05)),
              SizedBox(height: size.width * 0.03),
              ClipRRect(
                borderRadius: BorderRadius.circular(size.width * 0.05),
                child: TextFormField(
                  decoration: contactFormStyle(hint: 'Full Nme'),
                ),
              ),
              SizedBox(height: size.width * 0.08),
              Text("Email", style: TextStyle(fontSize: size.width * 0.05)),
              SizedBox(height: size.width * 0.03),
              ClipRRect(
                borderRadius: BorderRadius.circular(size.width * 0.05),
                child: TextFormField(
                  decoration: contactFormStyle(hint: 'Email').copyWith(
                    suffixIcon: const Icon(Icons.email,color: Colors.grey)
                  ),
                ),
              ),
              SizedBox(height: size.width * 0.08),
              Text("Message", style: TextStyle(fontSize: size.width * 0.05)),
              SizedBox(height: size.width * 0.03),
              ClipRRect(
                borderRadius: BorderRadius.circular(size.width * 0.05),
                child: TextFormField(
                  maxLines: 10,
                  decoration: contactFormStyle(hint: 'Message')
                ),
              ),
              SizedBox(height: size.width * 0.08),
              costumeButton(size: size, onPressed: (){}, title: "Send Message")
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration contactFormStyle({required String hint}) {
    return InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: MyColors().hintsColor,),
        filled: true,
        fillColor: MyColors().canvasColor,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyColors().blueColor)));
  }
}
