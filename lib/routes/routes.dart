import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_demo/pages/home/home_page.dart';
import 'package:flutter_demo/pages/movie/movie_page.dart';
import 'package:flutter_demo/pages/group/group_page.dart';
import 'package:flutter_demo/pages/my/my_page.dart';
import 'package:flutter_demo/pages/search_page.dart';

// app的首页
var homeHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return HomePage();
  },
);

var movieHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return MoviePage();
  },
);

var groupHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return GroupPage();
  },
);

var myHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return MyPage();
  },
);

var searchHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    return SearchPage();
  },
);

class Routes {
  static String root = '/';
  static String home = '/home';
  static String movie = '/movie';
  static String group = '/group';
  static String my = '/my';
  static String search = '/search';

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
        print("ROUTE WAS NOT FOUND !!!");
        return;
      },
    );
    router.define(home, handler: homeHandler);
    router.define(home, handler: homeHandler);
    router.define(movie, handler: movieHandler);
    router.define(group, handler: groupHandler);
    router.define(my, handler: myHandler);
    router.define(
      search,
      handler: searchHandler,
      transitionType: TransitionType.none,
    );
  }
}
