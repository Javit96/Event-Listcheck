import 'package:eventsapp/bloc/resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:eventsapp/models/classes/user.dart';

class UserBloc{
  final _repository = Repository();
  final _userGetter = PublishSubject<User>();

   Observable<User> get getUser => _userGetter.stream;

  registerUser(String username, String firstname, String lastname, String email, String password) async
  {
    User user = await _repository.registerUser(username, firstname, lastname, email, password);
    _userGetter.sink.add(user);
  }
  singinUser(String username, String password) async
  {
    User user = await _repository.singinUser(username, password);
    _userGetter.sink.add(user);
  }

  dispose()
  {
    _userGetter.close();
  }
}

final bloc = UserBloc();
