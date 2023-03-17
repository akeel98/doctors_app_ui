import 'package:flutter/material.dart';

class VideoCallScreen extends StatefulWidget {
  final String doctorImage;
  const VideoCallScreen({Key? key, required this.doctorImage}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  bool mic = false;
  bool sound = false;
  bool showBtns = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: InkWell(
        onTap: (){
          setState(() {
            showBtns =! showBtns;
          });
        },
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.doctorImage),
              fit: BoxFit.fill
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  width: size.width * 0.5,
                  height: size.width * 0.5,
                  alignment: Alignment.bottomRight,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("images/pfImage.png")
                    )
                  ),
                ),
              showBtns ==true?
              AnimatedContainer(
                width: double.infinity,
                height: size.height * 0.1 ,
                decoration: BoxDecoration(
                    color: const Color(0xFF242424),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(size.width * 0.05),
                      topRight: Radius.circular(size.width * 0.05),
                    )
                ),
                duration: const Duration(seconds: 1),
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
              ):const SizedBox(),

            ],
          ),
        ),
      )
    );
  }
}
