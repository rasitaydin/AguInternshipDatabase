import 'package:get_it/get_it.dart';
import 'package:internshipdatabase/repository/main_repository.dart';
import 'package:internshipdatabase/services/local_db_service.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => LocalDBService());
  locator.registerLazySingleton(() => MainRepository());

}