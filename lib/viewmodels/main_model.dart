import 'package:flutter/material.dart';
import 'package:internshipdatabase/locator.dart';
import 'package:internshipdatabase/models/internship_model.dart';
import 'package:internshipdatabase/models/student_model.dart';
import 'package:internshipdatabase/models/user_model.dart';
import 'package:internshipdatabase/repository/main_repository.dart';
import 'package:internshipdatabase/services/db_base.dart';

enum ViewState {IDLE, BUSY}

class MainModel with ChangeNotifier implements DBService{
  ViewState _state = ViewState.IDLE;
  MainRepository _userRepository = locator<MainRepository>();

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  @override
  Future<bool> saveUser(User user) async{
    try {
      state = ViewState.BUSY;
      return await _userRepository.saveUser(user);
    } finally {
      _state = ViewState.IDLE;
    }
  }

  @override
  Future<bool> login(User user) async{
    try {
      state = ViewState.BUSY;
      return await _userRepository.login(user);
    } finally {
      _state = ViewState.IDLE;
    }
  }

  @override
  Future<bool> saveInternship(Internship internship) async{
    try {
      state = ViewState.BUSY;
      return await _userRepository.saveInternship(internship);
    } finally {
      _state = ViewState.IDLE;
    }
  }

}