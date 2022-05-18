import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_project/main.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';

class opening_pg extends StatefulWidget {
  const opening_pg({Key? key}) : super(key: key);

  @override
  State<opening_pg> createState() => _opening_pgState();
}

class _opening_pgState extends State<opening_pg> {

  void chk_loc_service()async{
    bool isLocationServiceEnabled  = await Geolocator.isLocationServiceEnabled();
    if(!isLocationServiceEnabled)
      {
        await Geolocator.openAppSettings();
        await Geolocator.openLocationSettings();
      }
  }


  @override
  void initState()
  {
    chk_loc_service();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment:MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/Logo.svg"),
            SizedBox(height: 15,),
            Text("a Weather Application made with flutter",style: GoogleFonts.novaRound(fontSize: 15,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,color: Colors.white),),
            SizedBox(height: 150,),
            FlatButton(color: Colors.purple,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                onPressed: (){

              Navigator.push(context, MaterialPageRoute(builder:(context)=>MainPage()));

            }, child:
            Padding(padding: const EdgeInsets.all(10),child: Text("Open",style: GoogleFonts.novaRound(fontWeight: FontWeight.bold,fontSize: 20 ,color: Colors.white),)))
          ],
        ),
      )),
      backgroundColor: Colors.purpleAccent,
    );
  }
}
