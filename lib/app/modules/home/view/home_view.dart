import 'package:eden/app/modules/home/controller/home_controller.dart';
import 'package:eden/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hi, Welcome 👋",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.themeData.primaryColor,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Og Justine",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          color: AppTheme.themeData.primaryColor,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 5),
                      CircleAvatar(radius: 25),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                "Orders",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w800,
                  color: AppTheme.themeData.primaryColor,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Container(
                    width: Get.width,
                    height: Dimensions.unit * 30,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: AppTheme.themeData.cardColor, borderRadius: BorderRadius.circular(15), boxShadow: [
                      BoxShadow(
                        color: Colors.black38.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                    child: Row(
                      children: [
                        Container(
                          width: Dimensions.unit * 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      'https://i5.walmartimages.com/seo/Men-s-Soccer-Shoes-Outdoor-Athletics-Training-Football-Boots-Teenagers-Cleats-Spikes-Shoes-AG-FG_5da6a687-c96f-412d-9f45-24fe291870e9.7eab2c907833594e70813a493554166b.jpeg'))),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "#1223345434",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                color: AppTheme.themeData.primaryColor,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              "Men's Soccer Shoes",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w800,
                                color: AppTheme.themeData.primaryColor,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              "Qty: 2",
                              style: GoogleFonts.montserrat(
                                color: AppTheme.themeData.primaryColor,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              "Date: 16/11/2022",
                              style: GoogleFonts.montserrat(
                                color: AppTheme.themeData.primaryColor,
                                fontSize: 10,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppTheme.green,
                              ),
                              child: Text(
                                "\$45.05",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w800,
                                  color: AppTheme.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
