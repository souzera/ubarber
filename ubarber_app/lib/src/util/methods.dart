import 'package:ubarber_app/src/classes/users.dart';

bool login(User user) {
  if (user.username == 'matheus' && user.password == 'senha') {
    return true;
  }

  return false;
}
