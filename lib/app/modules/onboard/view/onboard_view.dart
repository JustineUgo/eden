import 'package:eden/app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(Images.onboard1), fit: BoxFit.cover)),
              ),
            ),
            Container(
              width: Get.width,
              height: Get.height / 8,
              color: AppTheme.green,
              padding: EdgeInsets.symmetric(horizontal: Dimensions.unit * 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(
                        3,
                        (index) => Padding(
                              padding: EdgeInsets.only(right: Dimensions.unit),
                              child: const CircleAvatar(radius: 6, backgroundColor: AppTheme.white),
                            )),
                  ),
                  Container(
                    padding: EdgeInsets.all(Dimensions.unit * 4),
                    decoration: BoxDecoration(
                      color: AppTheme.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("SIGN UP", key: Key('signup')),
                        SizedBox(width: 5),
                        Icon(CupertinoIcons.chevron_forward),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
