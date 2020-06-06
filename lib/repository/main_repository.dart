import 'package:internshipdatabase/locator.dart';
import 'package:internshipdatabase/models/user_model.dart';
import 'package:internshipdatabase/services/db_base.dart';
import 'package:internshipdatabase/services/local_db_service.dart';

class MainRepository implements DBService{
  LocalDBService _localDBService = locator<LocalDBService>();

  @override
  Future<bool> saveUser(User user) async{
    return await _localDBService.saveUser(user);
  }

  @override
  Future<bool> login(User user) async{
    return await _localDBService.login(user);
  }

}