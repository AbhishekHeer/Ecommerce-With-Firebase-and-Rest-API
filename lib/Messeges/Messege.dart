import 'package:fluttertoast/fluttertoast.dart';

class Messege {
  static ToastMessage(String messege) {
    Fluttertoast.showToast(
        msg: messege, timeInSecForIosWeb: 2, gravity: ToastGravity.CENTER);
  }
}
