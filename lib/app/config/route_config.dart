// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:riverpod_api_app/app/constants/route_constants.dart';
import 'package:riverpod_api_app/views/home_view.dart';
import 'package:riverpod_api_app/views/signin_view.dart';

class RouteConfig {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case RouteCostants.signin:
        return MaterialPageRoute(builder: (_) => SignInView());
      case RouteCostants.home:
        return MaterialPageRoute(builder: (_) => HomeView());

      default:
        break;
    }
    return null;
  }
}
