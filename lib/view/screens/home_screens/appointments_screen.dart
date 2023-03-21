import 'package:doctors/consts/colors.dart';
import 'package:flutter/material.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Your appointments",
          style: TextStyle(
              fontSize: size.width * 0.06, fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: ListView(
          children: [
            appointmentCart(
              size: size,
              img: "https://media.istockphoto.com/id/1307543555/photo/mature-doctor-and-nurse-discussing-patient-case.jpg?s=612x612&w=0&k=20&c=Dgqeft9EWUcrfNk_JBDv-6r1TVYX3kmCbwn1FMQ9TjA=",
              name: "DR.Steven M. Davis",
              specialist: '"Internal Medicine"',
              date: "Sun,june,2023,09:30AM-10:00AM",
            ),
            SizedBox(height: size.height * 0.02),
            appointmentCart(
              size: size,
              img: "https://media.istockphoto.com/id/1189303727/photo/doctor-in-conversation-with-pharmaceutical-representative.jpg?s=612x612&w=0&k=20&c=NdQrlgXamRqipTKJZ8iFmnGnDThGSRkV4pDbdgA0Nj0=",
              name: "DR.Kevin P. Fizer",
              specialist: "Oncologist",
              date: "Tus,april,2023,10:30AM-11:00AM",
            ),
            SizedBox(height: size.height * 0.02),
            appointmentCart(
              size: size,
              img:  "https://media.istockphoto.com/id/1161336374/photo/portrait-of-confident-young-medical-doctor-on-blue-background.jpg?s=612x612&w=0&k=20&c=zaa4MFrk76JzFKvn5AcYpsD8S0ePYYX_5wtuugCD3ig=",
              name: "DR.Kenny L. Brown",
              specialist: "Pulmonologist",
              date: "Wed,july,2023,05:30AM-06:00PM",
            ),
            SizedBox(height: size.height * 0.02),
            appointmentCart(
              size: size,
              img:   "https://media.istockphoto.com/id/1372002650/photo/cropped-portrait-of-an-attractive-young-female-doctor-standing-with-her-arms-folded-in-the.jpg?s=612x612&w=0&k=20&c=o1QtStNsowOU0HSof6xQ_jZMglU8ZK565gHd655U6S4=",
              name:  "DR.Paula L. Johnson",
              specialist: "Endocrinologist",
              date: "Wed,july,2023,05:30AM-06:00PM",
            ),
          ],
        ),
      ),
    );
  }

  Container appointmentCart(
      {required Size size,
      required String img,
      required String name,
      required String specialist,
      required String date,
      }) {
    return Container(
      width: size.width,
      height: size.height * 0.26,
      padding: EdgeInsets.only(
        left: size.width * 0.01,
        top: size.width * 0.02,
      ),
      decoration: BoxDecoration(
        color: MyColors().blueColor,
        borderRadius: BorderRadius.circular(size.width * 0.05),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              width: size.width * 0.14,
              height: size.width * 0.14,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.width * 0.05),
                  image: DecorationImage(
                      image: NetworkImage(img),
                      fit: BoxFit.cover)),
            ),
            title: Text(name),
            subtitle: Text(
              specialist,
              style: TextStyle(color: Colors.grey, fontSize: size.width * 0.04),
            ),
          ),
          Container(
            width: size.width,
            height: size.height * 0.07,
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            decoration: BoxDecoration(
                color: const Color(0xFF004ED5),
                borderRadius: BorderRadius.circular(size.width * 0.05)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const Icon(Icons.timer_outlined, color: Colors.grey),
                Text(
                  date,
                  style:const TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                "Cancel Appointment!!",
                style: TextStyle(
                  color: Colors.black,
                ),
              ))
        ],
      ),
    );
  }
}
