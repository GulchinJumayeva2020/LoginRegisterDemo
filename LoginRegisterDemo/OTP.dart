import 'dart:math';

class OTP {
  static int num = 0;
  int? _id;
  int? _randomCode;

  OTP() {
    this._id = num;
    num++;
    int min = 100030;
    int max = 999929;
    this._randomCode = min + Random().nextInt((max + 1) - min);
  }

  int getRandomCode() {
    return this._randomCode!;
  }

  bool sendCode(String email) {
    print("$email -ə OTP göndərildi: $_randomCode");
    return true;
  }
}