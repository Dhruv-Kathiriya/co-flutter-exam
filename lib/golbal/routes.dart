import 'package:exam_app/view/screens/cartpage.dart';
import 'package:flutter/cupertino.dart';

import '../view/screens/detailspage/Detalis.dart';
import '../view/screens/homepage/homepage.dart';

class Routes {
  static String homePage = '/';
  static String detailPage = 'details_Page';
  static String cartPage = 'cartPage';
  static String likePage = 'likePage';
  static String favPage = 'favPage';

  static Map<String, WidgetBuilder> myRoutes = {
    homePage: (context) => const HomePage(),
    detailPage: (context) => const DetailsPage(),
    cartPage: (context) => const CartPage(),
  };
}
