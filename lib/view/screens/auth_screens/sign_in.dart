import 'package:doctors/view/screens/auth_screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/costume_widgets.dart';
import '../home_screens/home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formState = GlobalKey<FormState>();
  bool showPassword = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: Form(
            key: _formState,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.05),
                Hero(
                  tag: "logo",
                  child: Image.asset(
                    "images/logo.png",
                    height: size.width * 0.5,
                    width: size.width * 0.5,
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Text(
                  "Sign in to your account",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width * 0.05,
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                ClipRRect(
                  borderRadius: BorderRadius.circular(size.width * 0.05),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value){
                      if(value =="" && value!.isEmpty){
                        return "This field is required";
                      }
                      else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!)){
                        return "Check your Email";
                      }
                    },
                    decoration: formFieldDecoration(size).copyWith(
                      hintText: "Email",
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                ClipRRect(
                  borderRadius: BorderRadius.circular(size.width * 0.05),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: showPassword,
                    validator: (value){
                      if(value == ""&& value!.isEmpty){
                        return "This field is required";
                      }else if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                          .hasMatch(value!)){
                        return
                          "Your password should contain at least:- \n one uppercase \n one lowercase \n one number \n one special character \n eight characters in length ";
                      }
                    },
                    decoration: formFieldDecoration(size).copyWith(
                        hintText: "Password",
                        suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          icon: showPassword
                              ?
                          const Icon(Icons.visibility,color: Colors.blue)
                              :
                          const Icon(Icons.visibility_off,color: Colors.blue),
                        )
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                costumeButton(size: size, onPressed: () async{
                  final prefs =await SharedPreferences.getInstance();
                  final sharedEmail = prefs.getString("email");
                  final sharedPass =  prefs.getString("password");
                  if(_formState.currentState!.validate()){

                  }
                }, title: "Sign in"),
                SizedBox(height: size.height * 0.03),
                Text(
                  "or continue with",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: size.width * 0.04,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    continueWith(
                      size: size,
                      image: 'images/icons/google.png',
                      text: 'Google',
                    ),
                    SizedBox(width: size.width * 0.03),
                    continueWith(
                      size: size,
                      image: 'images/icons/facebook.png',
                      text: 'Facebook',
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: size.width * 0.04,
                        ),
                      ),
                      TextButton(
                        onPressed:(){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>const SignUpScreen()));
                        },
                        child:Text(
                        "sign up",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: size.width * 0.04,
                          ),
                        ),
                      ),
                    ]
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


}
