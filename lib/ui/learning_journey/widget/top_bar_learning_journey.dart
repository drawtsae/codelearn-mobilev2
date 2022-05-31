import 'package:boilerplate/constants/assets.dart';
import 'package:flutter/material.dart';

class TopbarLearningJourney extends StatelessWidget {
  const TopbarLearningJourney({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 200,
                child: ClipRRect(
                  child: Image.asset(
                    Assets.journey,
                    fit: BoxFit.cover,
                    width: size.width,
                  ),
                ),
              ),
              SizedBox(height: 25)
            ],
          ),
        ],
      ),
    );
  }
}
