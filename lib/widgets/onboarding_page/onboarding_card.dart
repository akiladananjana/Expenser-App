import 'package:expenz_app/utils/colors.dart';
import 'package:flutter/material.dart';

class OnboardingCard extends StatelessWidget {
  /// This widget is used to display the onboarding card in the onboarding page.

  final String title;
  final String description;
  final String imagePath;

  const OnboardingCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width * 0.6,
            //
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: kDefaultIconDarkColor,
            ),
          ),
          SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: kGrey,
            ),
          ),
          //
        ],
      ),
    );
  }
}
