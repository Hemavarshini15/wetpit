import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class about_page extends StatefulWidget {
  const about_page({Key? key}) : super(key: key);

  @override
  State<about_page> createState() => _about_pageState();
}

class _about_pageState extends State<about_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Card(child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(child: Column(children: [
              SvgPicture.asset("assets/Logo.svg"),
            SizedBox(height: 25,),
              Text("The Application has been made on Dart programming lanuage with the Framework of Flutter,\n\nThe Application was made by\nS.Hemavarshini, 20MID0205 \nUnder the Guidence of Professor \nR. Rajkumar \nfor the course of\nIOS DEVELOPMENT EXC1084 ",
              style: GoogleFonts.novaCut(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 25,),
              Text("Technical Details,\nIDE used :Android Studio,\nProgramming Language:Dart\nFramework: Flutter\nAPI:OpenWeatherMap\n(https://openweathermap.org/)\nThe app logo was made in Figma\n\n\nLibraries used \n\ncupertino_icons:1.0.2\nhttp:0.13.4\ngoogle_fonts:2.3.2\nflutter_svg:1.0.3\ngeolocator:8.2.1\n\nThankyou For taking the time to read this\n",
                style: GoogleFonts.novaCut(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 25,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [SizedBox(width: 15,),
                  FlatButton( shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),onPressed: (){
                    Navigator.pop(context);
                  }, color: Colors.deepPurple,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Back",style: GoogleFonts.novaFlat(fontSize: 18,fontWeight:FontWeight.bold,color: Colors.white)),
                            Icon(Icons.arrow_back_ios_outlined,color: Colors.white,)
                          ],
                        ),
                      )),SizedBox(width: 15,)
                ],
              ),

            ],),),
          ),),
        ),
      ),backgroundColor: Colors.deepPurple,
    );
  }
}
