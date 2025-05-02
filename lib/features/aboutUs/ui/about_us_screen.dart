import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamweelytask/core/theming/widgets/subtitle_text.dart';
import 'package:tamweelytask/core/theming/widgets/title_text.dart';
import 'package:tamweelytask/features/aboutUs/ui/widgets/slider.dart';
import '../../../core/constants/dimensions_constants.dart';
import '../../../core/theming/widgets/appbar.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
class AboutUsScreen extends StatefulWidget {
   AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
   final double latitude =  30.064296680056206;

   final double longitude = 31.227821748867846;

 final mapController = MapController();

 List<Marker> markers = [
   
 ];
 @override
  void initState() {
   markers=[
     Marker(
       point: LatLng(latitude, longitude),
       width: 40,
       height: 40,
       child: Icon(Icons.location_on, color: Colors.red, size: 40),
     ),
   ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: GradientAppBar(title: "about_us".tr(),back: true,),
      body: Container(
        width: width.w,height: height.h,
        padding:EdgeInsets.all(edge),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AdvertisementSlider(),
              SizedBox(height: edge,),
              TitleText(text: "company_overview".tr(),fontSize: 18,),
              SubTitleText(text:  "company_overview_mess".tr(),align: TextAlign.start,),
              SizedBox(height: edge,),

              TitleText(text: "our_mission".tr(),fontSize: 18,),
              SubTitleText(text:  "our_mission_mess".tr(),align: TextAlign.start,),

              SizedBox(height: edge,),

              TitleText(text: "our_vision".tr(),fontSize: 18,),
              SubTitleText(text:  "our_vision_mess".tr(),align: TextAlign.start,),
              SizedBox(height: edge,),
              Container(
                width: width.w,height: width.w,color: Colors.grey,
                child: FlutterMap(
                  mapController: mapController,

                  options: MapOptions(
                    initialCenter: LatLng(latitude, longitude),
                    initialZoom: 16.0,

                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: ['a', 'b', 'c'],
                    ),
                    MarkerLayer(markers: markers),
                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
