import 'package:flutter/material.dart';
import 'package:music_app_ui/Intropages/Onboarding_items.dart';
import 'package:music_app_ui/Pages/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final controller = OnboardingItems();
  final pageController = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Colors.white,
        height: 120,
        child: isLastPage? getStarts() :Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          TextButton(onPressed: () => pageController.jumpToPage(controller.items.length-1), 
          child: const Text("Skip", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),

           SmoothPageIndicator(controller: pageController, 
          count: controller.items.length,
          onDotClicked: (index) => pageController.animateToPage(index, 
          duration:const Duration(milliseconds: 600), curve: Curves.easeIn),
          effect: const WormEffect(
            dotHeight: 12,
            dotWidth: 12,
            activeDotColor: Colors.purple
          ),
          ),

           TextButton(onPressed: ()=> pageController.nextPage(
            duration: const Duration(milliseconds: 600), curve: Curves.easeIn), 
          child: const Text("Next", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
        ],),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30.0),
        child: PageView.builder(
            onPageChanged: (index) => setState(() => isLastPage = controller.items.length -1 == index),
            itemCount: controller.items.length,
            controller: pageController,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    controller.items[index].image,
                    width: 350,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          controller.items[index].title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          controller.items[index].description,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
  // Get start Button

    Widget getStarts() {
      return TextButton(onPressed: () async {
        final pres = await SharedPreferences.getInstance();
        pres.setBool("onboarding", true);
        
        if(!mounted)return;
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()));
      },
       child: Container(
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(12)
        ),
        width: MediaQuery.of(context).size.width * .9,
        height: 55,
        child: const Center(
          child: Text("Get Started", style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),),
        )));
    }

}
