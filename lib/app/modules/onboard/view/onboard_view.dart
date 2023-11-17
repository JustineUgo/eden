import 'package:eden/app/modules/home/controller/home_controller.dart';
import 'package:eden/app/modules/onboard/controller/onboard_controller.dart';
import 'package:eden/app/routes/routes.dart';
import 'package:eden/app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardScreen extends GetView<OnboardController> {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>().connectToAbly();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              key: const Key('onboard-screen'),
              child: GestureDetector(
                onHorizontalDragUpdate: (details) {
                  // Swiping in right direction.
                  if (details.delta.dx > 0) controller.onSwipe(isLeft: false);

                  // Swiping in left direction.
                  if (details.delta.dx < 0) controller.onSwipe(isLeft: true);
                },
                onTapDown: (details) => controller.isSwipping(true),
                child: Obx(() {
                  return Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(controller.onboardImage.value), fit: BoxFit.cover),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppTheme.lightGreen.withOpacity(.2), AppTheme.green],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: OnboardContent(controller: controller),
                    ),
                  );
                }),
              ),
            ),
            OnboardBottom(controller: controller),
          ],
        ),
      ),
    );
  }
}

class OnboardBottom extends StatelessWidget {
  const OnboardBottom({
    super.key,
    required this.controller,
  });

  final OnboardController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height / 10,
      color: AppTheme.green,
      padding: EdgeInsets.symmetric(horizontal: Dimensions.unit * 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: List.generate(
                3,
                (index) => Padding(
                      padding: EdgeInsets.only(right: Dimensions.unit * 2),
                      child: Obx(() {
                        return CircleAvatar(radius: 4, backgroundColor: index == controller.index.value ? AppTheme.white : AppTheme.lightGreen.withOpacity(.5));
                      }),
                    )),
          ),
          GestureDetector(
            onTap: () => Get.offAndToNamed(Paths.auth),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: Dimensions.unit * 3, horizontal: Dimensions.unit * 6),
              decoration: BoxDecoration(
                color: AppTheme.white.withOpacity(.2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SIGN UP",
                    key: const Key('signup'),
                    style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: AppTheme.white),
                  ),
                  const SizedBox(width: 5),
                  const Icon(CupertinoIcons.arrow_right, size: 14, color: AppTheme.white),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.controller,
  });

  final OnboardController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Dimensions.unit * 8, bottom: Dimensions.unit * 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() {
            return Text(
              controller.onboardContent[controller.index.value]!,
              style: GoogleFonts.montserrat(fontWeight: FontWeight.w700, fontSize: 40, color: AppTheme.white),
            );
          }),
          const SizedBox(height: 5),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.",
            style: GoogleFonts.montserrat(fontSize: 15, color: AppTheme.white),
          ),
        ],
      ),
    );
  }
}
