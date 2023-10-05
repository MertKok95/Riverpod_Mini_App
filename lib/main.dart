import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api_app/app/cache/cache_manager.dart';
import 'package:riverpod_api_app/app/config/route_config.dart';
import 'package:riverpod_api_app/app/constants/route_constants.dart';
import 'package:riverpod_api_app/app/locator/get_it_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  CacheManager.getInstance;
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteCostants.signin,
      onGenerateRoute: RouteConfig.generateRoute,
    );
  }
}
