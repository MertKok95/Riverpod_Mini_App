import 'package:get_it/get_it.dart';
import 'package:riverpod_api_app/services/abstract_regris_service.dart';
import 'package:riverpod_api_app/services/regris_service.dart';

final locator = GetIt.instance;

void setUpLocator() {
  // Remote Service (regris)
  locator.registerLazySingleton<IRegrisService>(() => RegrisService());
}
