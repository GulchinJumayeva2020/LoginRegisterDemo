class User {
  static List <User> users= [];
  static int num = 0;
  int? _id;
  String? _name;
  String? _surname;
  String? _userName;
  String? _email;
  String? _password;

  String getEmail() {
    return this._email!;
  }

  String getPassword() {
    return this._password!;
  }

  User.empty();

  User(String name, String surname, String userName, String email, String password) {
    _id = num;
    num++;
    _name = name;
    _surname = surname;
    _userName = userName;
    _email = email;
    _password = password;

  }

  User addUser(String name, String surname, String userName, String email, String password) {
    User user = new User(name, surname, userName, email, password);
    users.add(user);
    return user;
  }

  bool deleteUser(User user) {
    if(users.remove(user))
      return true;
    return false;
  }

  bool updateUser(User user) {
    //User update
    return true;
  }
}