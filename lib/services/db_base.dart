import 'package:internshipdatabase/models/user_model.dart';

abstract class DBService {
  Future<bool> saveUser(User user);
  Future<bool> login(User user);

}