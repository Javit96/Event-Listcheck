import 'dart:async';
import 'api.dart';
import 'package:eventsapp/models/classes/user.dart';

class Repository
{
  final apiProvider = ApiProvider();

  Future<User> registerUser(String username, String firstname, String lastname, String email, String password)
  => apiProvider.registerUser(username, firstname, lastname, password, email);

  Future<User> singinUser(String username, String password)
  => apiProvider.signinUser(username, password);
}