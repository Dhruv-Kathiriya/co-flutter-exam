import 'package:exam_app/componets/cat.dart';
import 'package:exam_app/golbal/routes.dart';
import 'package:exam_app/utils/producat/products.dart';
import 'package:flutter/material.dart';

import '../../../componets/subcat.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    TextScaler textScaler = MediaQuery.textScalerOf(context);
    Size size = MediaQuery.sizeOf(context);
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Find the home\n"
                    "furniture",
                    style: TextStyle(
                      fontSize: h * 0.03,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.list,
                    size: 35,
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.05,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...category.map(
                      (e) => mySubCategory(
                        context: context,
                        image: e.toString(),
                        text: e.toString(),
                      ),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    ...category.map(
                      (e) => Column(
                        children: [
                          MyPro(context: context, Catgory: e),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: h * 0.1,
          width: w,
          color: Colors.grey.shade400,
          child: Padding(
            padding: const EdgeInsets.all(9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.home,
                  size: 35,
                ),
                Icon(
                  Icons.favorite_border,
                  size: 35,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.cartPage);
                  },
                  child: Icon(
                    Icons.shopping_cart_checkout,
                    size: 35,
                  ),
                ),
                Icon(
                  Icons.account_circle,
                  size: 35,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
