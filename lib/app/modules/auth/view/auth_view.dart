import 'package:eden/app/routes/routes.dart';
import 'package:eden/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreen extends GetView {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    key: const Key('logo'),
                    height: Dimensions.unit * 30,
                    width: Dimensions.unit * 30,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20), image: const DecorationImage(image: AssetImage(Images.icon), fit: BoxFit.cover)),
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.unit * 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Log in',
                          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: AppTheme.themeData.primaryColor, fontSize: 35),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          'Sign up with one of the following',
                          style: GoogleFonts.montserrat(color: AppTheme.themeData.primaryColor, fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        LoginOption(key: const Key('google'), iconData: FontAwesomeIcons.google),
                        const SizedBox(width: 15),
                        LoginOption(key: const Key('github'), iconData: FontAwesomeIcons.github),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Text(
                      'Login and start experiencing ease, like never before..',
                      style: GoogleFonts.montserrat(color: AppTheme.themeData.primaryColor, fontSize: 12),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class LoginOption extends StatelessWidget {
  LoginOption({super.key, required this.iconData});
  IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => Get.offAndToNamed(Paths.home),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(color: AppTheme.green, borderRadius: BorderRadius.circular(10)),
          child: Icon(
            iconData,
            size: 20,
            color: AppTheme.themeData.primaryColor,
          ),
        ),
      ),
    );
  }
}
