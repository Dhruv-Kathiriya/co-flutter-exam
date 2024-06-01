import 'package:flutter/material.dart';

import '../../utils/producat/products.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    TextScaler textScaler = MediaQuery.of(context).textScaler;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Cart Page",
          style: TextStyle(
            fontSize: textScaler.scale(18),
          ),
        ),
        backgroundColor: Colors.grey.shade300,
      ),
      body: (cartList.isNotEmpty)
          ? Stack(
              children: [
                Column(
                  children: [
                    ...cartList.map(
                      (e) => Padding(
                        padding: const EdgeInsets.all(16),
                        child: Container(
                          height: h * 0.15,
                          width: w,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Container(
                                  height: h * 0.13,
                                  width: w * 0.25,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        e['name'],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 12),
                                        child: Text(
                                          e['category'],
                                          style: TextStyle(
                                            fontSize: textScaler.scale(22),
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: h * 0.01,
                                      ),
                                      Text(
                                        "⭐ ${e['rating']}".toString(),
                                        style: TextStyle(
                                          fontSize: textScaler.scale(20),
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        height: h * 0.01,
                                      ),
                                      Text(
                                        " \$ ${e['price']}".toString(),
                                        style: TextStyle(
                                          fontSize: textScaler.scale(18),
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    cartList.remove(e);
                                    setState(() {});
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Icon(Icons.delete),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: h * 0.25,
                    width: w,
                    color: Colors.grey.shade300,
                  ),
                )
              ],
            )
          : Center(
              child: Image.network(
                "https://assets-v2.lottiefiles.com/a/435a7e80-1153-11ee-a46f-7f1c0e4a511a/ePxvZATa5E.gif",
                height: h * 0.25,
              ),
            ),
    );
  }
}
