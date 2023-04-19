import 'dart:io';

import 'ChangePassword.dart';
import 'Login.dart';
import 'OTP.dart';
import 'Register.dart';

class Tool {
  bool checkPassword(String password, String confirmPassword) {
    if((password != null) && (password == confirmPassword) && (password.length >= 8))
      return true;
    return false;
  }

  bool verifyAccount(String password, String confirmPassword, String email) {
    Tool tool = new Tool();
    if(tool.checkPassword(password, confirmPassword)) {
      OTP otp = new OTP();
      otp.sendCode(email);
      print("\n------------------\nOTP kodunu daxil edin:\n");
      String? otpCode = stdin.readLineSync();
      if(otp.getRandomCode().toString().compareTo(otpCode!) == 0)
        return true;
    }
    return false;
  }

  void choseFunction() {
    print("\nFunksiyanı seçin:\n1-Qeydiyyat keç!\n2-Daxil ol!\n");
    String? functionNum = stdin.readLineSync();
    switch (functionNum) {
      case "1":
        register();
        login();
        break;
      case "2":
        login();
        break;
      default: {
        print("\nBelə funksiya tapılmadı!\n");
        choseFunction();
      }
    }
  }

  void register() {
    print("Ad: ");
    String? name = stdin.readLineSync();
    print("Soyad: ");
    String? surname = stdin.readLineSync();
    print("İstifadəçi adı: ");
    String? userName = stdin.readLineSync();
    print("Email: ");
    String? email = stdin.readLineSync();
    print("Şifrə: ");
    String? password = stdin.readLineSync();
    print("Şifrə təsdiq: ");
    String? confirmPassword = stdin.readLineSync();
    Register register = new Register(name!, surname!, userName!, email!, password!, confirmPassword!);
    register.register();
  }

  void login(){
    print("Hesabınızı daxil olun!\nEmail: ");
    String? email = stdin.readLineSync();
    print("Şifrə: ");
    String? password = stdin.readLineSync();
    Login login = new Login(email!, password!);
    login.login();
    choseFunction2();
  }

  void choseFunction2(){
    print("\nFunksiyanı seçin:\n1-Hesabdan çıx!\n2-Şifrəni dəyiş!\n");
    String? functionNum = stdin.readLineSync();
    switch (functionNum) {
      case "1":
        Login.empty().logout();
        break;
      case "2":
        ChangePassword.empty().changePassword();
        break;
      default: {
        print("\nBelə funksiya tapılmadı!\n");
        choseFunction();
      }
    }
  }
}