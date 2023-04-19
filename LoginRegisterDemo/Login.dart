import 'User.dart';

class Login {
  static int num =0;
  int? _id;
  String? _email;
  String? _password;
  User? _currentUser = null;

  Login.empty();

  Login(String email, String password){
    this._id = num;
    num++;
    this._email = email;
    this._password = password;
  }

  User? getCurrentUser(){
    return _currentUser;
  }

  void login() {
    User.users.forEach((user) {
      if(user.getEmail().compareTo(this._email!) == 0 && user.getPassword().compareTo(this._password!) == 0){
        this._currentUser = user;
        print("Hesabınıza daxil oldunuz!");
      }else{
        print("xeta");
      }
    });

  }

  void logout(){
    if(this._currentUser != null){
      this._currentUser = null;
      print("Hesabdan çıxıldı");
    }
  }
}