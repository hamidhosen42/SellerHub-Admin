import 'package:e_mart_seller/const/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  //!===========text editing controller=============
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  //!==================user login===============
  Future<UserCredential?> loginMethod() async {
    UserCredential? userCredential;
    try {
      userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
       Get.snackbar("Error", e.message.toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
    return userCredential;
  }

  //user signout
  signoutMethod() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
