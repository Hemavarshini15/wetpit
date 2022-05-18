import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:the_project/about_app_page.dart';
import 'package:the_project/opening_page.dart';
import 'package:geolocator/geolocator.dart';



void main() {
  runApp(MaterialApp(title:"WetPit",debugShowCheckedModeBanner: false,home:opening_pg()));
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final ApiKey='apikey';
  var City="Vellore";
  
  
  var Units="metric";
  var __redits="pxfuel.com, openweathermap.com ";

  var main_weather;
  var weather_description;
  var temprature;
  var humidity;
  var temp_feels_like;
  var min_temp;
  var max_temp;
  var Country;
  bool is_raining=false;
  bool is_dataloading =true;





  void get_weather_data ()async
  {

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    double lat=position.latitude;
    double lon=position.longitude;
    var Api_query={'lat':lat.toString(),'lon':lon.toString(),'appid':ApiKey,'units':Units};
    final uri_for_req=Uri.https('api.openweathermap.org', '/data/2.5/weather',Api_query);
    final temp=await http.get(uri_for_req);
    var data=json.decode(temp.body);
    // here we parse the data into a form we will be using in app
    print(data);
    main_weather=data['weather'][0]['main'];
    weather_description=data['weather'][0]['description'];
    temprature=data['main']['temp'];
    humidity=data['main']['humidity'];
    temp_feels_like=data['main']['feels_like'];
    max_temp=data['main']['temp_max'];
    min_temp=data['main']['temp_min'];
    Country=data['sys']['country'];
    City=data['sys']['name'].toString();
    City="Kātpādi";
    is_raining=false;
    if(main_weather=="Rain")
      {
        is_raining=true;
        main_weather="Rainy";
      }
    if(main_weather=="Clouds")
      {
           main_weather="Cloudy";
      }
    is_dataloading=false;
    setState((){});

  }
  @override
  void initState()
  {
    get_weather_data();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: Drawer(
      child:
      Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Text("WetPit",style: GoogleFonts.novaFlat(fontSize: 70,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,color: Colors.white)),
            SizedBox(height: 10,),
            ListTile(
              leading: Text("More About The Application",style: GoogleFonts.novaFlat(fontSize: 15,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,color: Colors.white)),
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder:(context)=>about_page()));
              },
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
            SizedBox(height: 100,),
            FlatButton(color: Colors.deepPurpleAccent,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),onPressed: (){

              Navigator.push(context, MaterialPageRoute(builder:(context)=>opening_pg()));

            }, child:
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text("Back",style: GoogleFonts.novaRound(fontWeight: FontWeight.bold,fontSize: 20 ,color: Colors.white)),
            ))
          ],
        ),
      ),
      backgroundColor: is_raining?Colors.lightBlue:Colors.amberAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
    ),
        body:
    Center(
      child: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Card(color: Colors.deepPurpleAccent,
          child:
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: (is_dataloading)?CircularProgressIndicator(color: Colors.white,):Column(
              children: [
                SizedBox(height: 10,),
                (is_raining)?SvgPicture.asset('assets/Union_2.svg'):SvgPicture.asset('assets/Union.svg'),
                SizedBox(height: 15,),
                //Text("Today's Weather at ${City},${Country} is"),
                Text("Today's Weather at ${City},${Country} is\n",style: GoogleFonts.novaFlat(fontSize: 18,fontWeight:FontWeight.bold,color: Colors.white),),
                Text("${main_weather}",style: GoogleFonts.novaFlat(fontSize: 35,fontWeight:FontWeight.bold,
                color:is_raining?Colors.lightBlue:Colors.white)),
                Text("${weather_description}",style: GoogleFonts.novaFlat(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.white)),
                Text("\nTemprature ${temprature}°C\nFeels Like ${temp_feels_like}°C",style: GoogleFonts.novaFlat(fontSize: 25,fontWeight:FontWeight.bold,color: Colors.white)),
                Text("Max Temprature ${max_temp}°C\nMin Temprature${min_temp}°C ",style: GoogleFonts.novaFlat(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.white)),
                Text("Humidity ${humidity}%\n",style: GoogleFonts.novaFlat(fontSize: 20,fontWeight:FontWeight.bold,color: Colors.white)),
                SizedBox(height: 15,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [SizedBox(width: 15,),
                    FlatButton(onPressed: (){
                      is_dataloading=true;
                      get_weather_data();

                      setState((){});
                    }, color: Colors.deepPurple,
                        child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Refresh",style: GoogleFonts.novaFlat(fontSize: 18,fontWeight:FontWeight.bold,color: Colors.white)),
                          Icon(Icons.refresh_sharp,color: Colors.white,)
                        ],
                      ),
                    )),SizedBox(width: 15,)
                  ],
                ),
                Text("Data provided by openweathermap via its api ",style: GoogleFonts.oswald(fontSize: 12,color: Colors.white),),
                SizedBox(height: 30,),

              ],
            ),
          ),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        ),
      ),
    ),
    backgroundColor: (is_raining)?Colors.lightBlue:Colors.amberAccent);
  }
}
