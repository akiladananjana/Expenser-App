import 'package:expenz_app/data/onboarding_data.dart';
import 'package:expenz_app/pages/enter_details_page.dart';
import 'package:expenz_app/pages/front_page.dart';
import 'package:expenz_app/utils/colors.dart';
import 'package:expenz_app/widgets/onboarding_page/custom_button.dart';
import 'package:expenz_app/widgets/onboarding_page/onboarding_card.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  bool isPageIndicatorEnded = false;
  // It contains a page view with 3 pages and a smooth page indicator.
  var _controller = PageController();
  @override
  Widget build(BuildContext context) {
    // This widget is used to display the onboarding page.

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  PageView(
                    controller: _controller,
                    onPageChanged: (value) {
                      if (value == 3) {
                        setState(() {
                          isPageIndicatorEnded = true;
                        });
                      } else {
                        setState(() {
                          isPageIndicatorEnded = false;
                        });
                      }
                    },
                    children: [
                      FrontPage(),
                      OnboardingCard(
                        title: OnboardingData().onboardingList[0].title,
                        description:
                            OnboardingData().onboardingList[0].description,
                        imagePath: OnboardingData().onboardingList[0].imagePath,
                      ),
                      OnboardingCard(
                        title: OnboardingData().onboardingList[1].title,
                        description:
                            OnboardingData().onboardingList[1].description,
                        imagePath: OnboardingData().onboardingList[1].imagePath,
                      ),
                      OnboardingCard(
                        title: OnboardingData().onboardingList[2].title,
                        description:
                            OnboardingData().onboardingList[2].description,
                        imagePath: OnboardingData().onboardingList[2].imagePath,
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment(0, 0.7),
                    child: SmoothPageIndicator(
                      controller: _controller, // PageController
                      count: 4,
                      effect: WormEffect(
                        activeDotColor: kMainColor,
                        dotColor: kGrey,
                      ), // your preferred effect
                      onDotClicked: (index) {},
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    right: 0,
                    left: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: GestureDetector(
                        onTap: () {
                          if (_controller.page == 3) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EnterDetailsPage(),
                              ),
                            );
                          } else {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          }
                        },
                        child: CustomButton(
                          buttonTitle:
                              isPageIndicatorEnded ? "Get Started" : "Next",
                        ),
                      ),
                    ),
                  ),
                  //
                ],
              ),
            ),
          ],
        ),
      ),

      //
    );
  }
}
