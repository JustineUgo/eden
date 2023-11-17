import 'package:eden/app/data/model/model.dart';
import 'package:eden/app/modules/auth/controller/auth_controller.dart';
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
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppTheme.green, onPressed:()=> Get.find<AuthController>().signOut(), child: const Icon(Icons.logout_rounded)),
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
                    "Welcome 👋",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.themeData.primaryColor,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 5),
                      CircleAvatar(
                        radius: 22,
                        backgroundImage: NetworkImage(
                          controller.storage.user.value['photo'],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                key: const Key(('user')),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.storage.user.value['name'],
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w800,
                      color: AppTheme.themeData.primaryColor,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    controller.storage.user.value['email'],
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      color: AppTheme.themeData.primaryColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                "Products",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w800,
                  color: AppTheme.themeData.primaryColor,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: Dimensions.unit * 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: controller.products
                      .map((product) => ProductWidget(controller: controller, id: product.id, image: product.image, name: product.name, price: product.price))
                      .toList(),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Orders",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w800,
                  color: AppTheme.themeData.primaryColor,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Obx(() {
                  if (controller.orders.isEmpty) {
                    return Center(
                      child: Text(
                        "You currently don't have any order!\nOrder now to view your orders!",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          color: AppTheme.themeData.primaryColor,
                          fontSize: 12,
                        ),
                      ),
                    );
                  }
                  return Obx(() {
                    return ListView(
                      children: controller.orders.map((order) => OrderWidget(order: order)).toList(),
                    );
                  });
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.controller,
    required this.id,
    required this.image,
    required this.name,
    required this.price,
  });
  final HomeController controller;
  final String id;
  final String image;
  final String name;
  final int price;

  double get amount => price / 100;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 2.5,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: AppTheme.themeData.cardColor, borderRadius: BorderRadius.circular(15), boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(0, 2), // changes position of shadow
        ),
      ]),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(image))),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w800,
                    color: AppTheme.themeData.primaryColor,
                    fontSize: 15,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => controller.publistOrder(id: id, name: name, price: price, image: image),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppTheme.green,
                        ),
                        child: Text(
                          "Order",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w700,
                            color: AppTheme.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "\$$amount",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        color: AppTheme.themeData.primaryColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OrderWidget extends StatelessWidget {
  const OrderWidget({
    super.key,
    required this.order,
  });
  final EdenOrder order;

  double get amount => order.price / 100;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Dimensions.unit * 30,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(color: AppTheme.themeData.cardColor, borderRadius: BorderRadius.circular(15), boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(0, 2), // changes position of shadow
        ),
      ]),
      child: Row(
        children: [
          Container(
            width: Dimensions.unit * 25,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(order.image))),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "#${order.id}",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.themeData.primaryColor,
                  fontSize: 10,
                ),
              ),
              Text(
                order.name,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w800,
                  color: AppTheme.themeData.primaryColor,
                  fontSize: 15,
                ),
              ),
              Text(
                "Qty: ${order.quantity}",
                style: GoogleFonts.montserrat(
                  color: AppTheme.themeData.primaryColor,
                  fontSize: 10,
                ),
              ),
              Text(
                "Date: ${order.date}",
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
                  "\$$amount",
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
    );
  }
}
