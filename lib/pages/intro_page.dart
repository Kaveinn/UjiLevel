import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:marquee/marquee.dart';
import '../components/my_button.dart';

class IntroPage extends StatelessWidget {
  IntroPage({Key? key}) : super(key: key);

  final List<String> images = [
    'lib/images/coklat.jpg',
    'lib/images/oreo.jpg',
    'lib/images/stro.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height:
                      10.0), // Add some space between the text and the carousel
              CarouselSlider(
                items: images.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                        ),
                        child: Image.asset(
                          item,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),
              SizedBox(
                  height:
                      56.0), // Add some space between the carousel and the marquee
              Container(
                height: 50, // Set height for the Marquee widget
                child: Marquee(
                  text: '𝔭𝔬𝔫𝔷 𝔤𝔞𝔯𝔞𝔤𝔢' * 1,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  scrollAxis: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  blankSpace: 20.0,
                  velocity: 100.0,
                  pauseAfterRound: Duration(seconds: 1),
                  startPadding: 10.0,
                  accelerationDuration: Duration(seconds: 1),
                  accelerationCurve: Curves.linear,
                  decelerationDuration: Duration(milliseconds: 500),
                  decelerationCurve: Curves.easeOut,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "𝙗𝙪𝙠𝙖𝙣 𝙠𝙖𝙪𝙢 𝙢𝙚𝙣𝙙𝙖𝙣𝙜 𝙢𝙚𝙣𝙙𝙞𝙣𝙜",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(height: 25),
              MyButton(
                onTap: () => Navigator.pushNamed(context, '/shop_page'),
                child: Text(
                    "Shop Now"), // You can replace this with a child widget
              ),
            ],
          ),
        ),
      ),
    );
  }
}
