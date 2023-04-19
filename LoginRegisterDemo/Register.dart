import 'Tool.dart';
import 'User.dart';

class Register {
  static int num = 0;
  int? _id;
  String? _name;
  String? _surname;
  String? _userName;
  String? _email;
  String? _password;
  String? _confirmPassword;

  Register(String name, String surname, String userName, String email, String password, String confirmPassword) {
    _id = num;
    num++;
    _name = name;
    _surname = surname;
    _userName = userName;
    _email = email;
    _password = password;
    _confirmPassword = confirmPassword;
  }

  bool register() {
    Tool tool = new Tool();
    if(!tool.verifyAccount(this._password!, this._confirmPassword!, this._email!))
      return false;
    User user = new User.empty();
    user.addUser(this._name!, this._surname!, this._userName!, this._email!, this._password!);
    print("\nQeydiyyat tamamlandı!\n");
    return true;
  }
}