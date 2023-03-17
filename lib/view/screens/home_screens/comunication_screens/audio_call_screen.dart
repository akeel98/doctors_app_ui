import 'package:doctors/consts/colors.dart';
import 'package:flutter/material.dart';

class VoiceCallScreen extends StatefulWidget {
  final String doctorName;
  final String doctorImg;
  const VoiceCallScreen({Key? key, required this.doctorName, required this.doctorImg}) : super(key: key);

  @override
  State<VoiceCallScreen> createState() => _VoiceCallScreenState();
}

class _VoiceCallScreenState extends State<VoiceCallScreen> {
  bool mic = false;
  bool sound = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          const Expanded(child: SizedBox()),
          Text(widget.doctorName,style: TextStyle(
              color: Colors.white,
              fontSize: size.width * 0.06,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.03),
          Text("calling...",style: TextStyle(
            color: Colors.grey,
            fontSize: size.width * 0.05,
          ),),
          const Expanded(child: SizedBox()),
          CircleAvatar(
            radius: size.width * 0.28,
            backgroundImage: NetworkImage(widget.doctorImg),
          ),
          const Expanded(child: SizedBox()),
          Container(
            width: double.infinity,
            height: size.height * 0.1 ,
            decoration: BoxDecoration(
              color: const Color(0xFF242424),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(size.width * 0.05),
                topRight: Radius.circular(size.width * 0.05),
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(size.width * 0.02),
                    decoration:const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.call_end_outlined,color: Colors.white),
                  ),
                ),
                IconButton(onPressed: (){
                  setState(() {
                    mic = ! mic;
                  });
                }, icon:mic? const Icon(Icons.mic,color: Colors.white,):const Icon(Icons.mic_off,color: Colors.white,)),
                InkWell(
                  onTap: (){
                    setState(() {
                      sound =!sound;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(size.width * 0.02),
                    decoration: BoxDecoration(
                      color:sound == true? Colors.grey:Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset("images/volume.png",color: Colors.white, height: size.width * 0.055),
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
