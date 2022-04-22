import 'package:cashaam/services/auth_service.dart';
import 'package:cashaam/services/http_service.dart';
import 'package:cashaam/services/user_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.I;

void setUpLocater() {
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => HttpService());
}
