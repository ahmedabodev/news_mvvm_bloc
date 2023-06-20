
import 'package:flutter/material.dart';
import 'package:news_mvvm_bloc_cubit/fetches/search/presention/search_view.dart';

import '../../fetches/home/presentation/view/home_view.dart';




// name  routes to navigator to any screen
class Routes {
  static const splashView = '/';
  static const homeView = '/home_view';
  static const bookView = '/book_view';
  static const detailsView = '/details_view';
  static const searchView = '/search_view';
  static const webView = '/web_view';
}

class AppRoutes {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // name routes screen
      // case Routes.splashView:
      //   //navigator to this name
      //   return MaterialPageRoute(builder: (BuildContext context)=> const SplashView());
      case Routes.homeView:
        return MaterialPageRoute(builder: (BuildContext context)=> const HomeView());
        case Routes.searchView:
        //navigator to this name
        return MaterialPageRoute(builder: (BuildContext context)=> const SearchView());

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
        body: Center(
          child: Text('Route not Found'),
        ),
      )),
    );
  }
}