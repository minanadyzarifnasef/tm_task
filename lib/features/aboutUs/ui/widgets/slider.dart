import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamweelytask/core/constants/dimensions_constants.dart';

class AdvertisementSlider extends StatelessWidget {
  AdvertisementSlider({super.key});
  final List<String> slider = [
    "https://www.tamweely.com.eg/assets/images/banner/NewttMob.png",
    "https://www.tamweely.com.eg/assets/images/banner/S1.png",
    "https://www.tamweely.com.eg/assets/images/banner/S2.png",
    "https://www.tamweely.com.eg/assets/images/banner/S3.png",
    "https://www.tamweely.com.eg/assets/images/banner/S4.png",
    "https://www.tamweely.com.eg/assets/images/banner/S5.png",
    "https://www.tamweely.com.eg/assets/images/banner/S6.png",
    "https://www.tamweely.com.eg/assets/images/banner/S7.jpg",
    "https://www.tamweely.com.eg/assets/images/banner/S8.png",
    "https://www.tamweely.com.eg/assets/images/banner/S9.png",
    "https://www.tamweely.com.eg/assets/images/banner/S10.png",
    "https://www.tamweely.com.eg/assets/images/banner/S11.png",

    
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 145.h,
        autoPlay: true,
        aspectRatio: 1,
        viewportFraction:1,
        animateToClosest: false,
        padEnds: false,
      ),
      items: slider.map((slide) {
        return Container(
         // margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(slide), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(radius)
          ),
        );
      }).toList(),

    );
  }
}
