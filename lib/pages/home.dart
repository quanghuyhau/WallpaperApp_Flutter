import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List Wallpaperimage = [
    "images/wallpaper1.jpg",
    "images/wallpaper2.jpg",
    "images/wallpaper3.jpg"
  ];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              children: [
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(60),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset(
                        "images/img.png",
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(
                  width: 80,
                ),
                Text(
                  "Wallify",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            CarouselSlider.builder(
                itemCount: Wallpaperimage.length,
                itemBuilder: (context, index, realIndex) {
                  final res = Wallpaperimage[index];
                  return buildImage(res, index);
                },
                options: CarouselOptions(
                  autoPlay: true,
                  height: MediaQuery.of(context).size.height / 1.5,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,onPageChanged: (index, reason){
                    setState(() {
                      activeIndex = index;
                    });
                }
                ),
            ),
            SizedBox(height: 20,),
            Center(child: buildIndicator(),)
          ],
        ),
      ),
    );
  }
  Widget buildIndicator()=> AnimatedSmoothIndicator(activeIndex: activeIndex, count: 3,effect:SlideEffect(
    dotWidth: 15,
    dotHeight: 15,
    activeDotColor: Colors.blue
  ));
  
  Widget buildImage(String urlImage, int index) => Container(
        height: MediaQuery.of(context).size.height / 1.5,
        width: MediaQuery.of(context).size.width,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              urlImage,
              fit: BoxFit.cover,
            )),
      );
}
