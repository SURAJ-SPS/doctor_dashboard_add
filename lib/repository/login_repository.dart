import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../conmmon/refrence.dart';
import '../conmmon/shared_preference.dart';
import '../conmmon/snackbar_messages.dart';
import '../features/presentation/pages/login_screen.dart';

typedef NavigateToOTPScreenFunction = void Function();

class LoginRepository {
  Future<String?> registerUser({
    required String? phoneNumber,
    required BuildContext context,
    required NavigateToOTPScreenFunction navigateToOTPScreen,
    required LoginScreenState loginScreenState,
  }) async {
    try {
      String verificationId = "";

      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 30),
        codeSent: (String? verificationId, int? resendToken) {
          loginScreenState.setState(() {
            loginScreenState.verificationId = verificationId;
            loginScreenState.loginLoader = false;
          });
          verificationId = verificationId;
          navigateToOTPScreen();
        },
        codeAutoRetrievalTimeout: (String? verificationId) {},
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
          // auth.signInWithCredential();
        },
        verificationFailed: (FirebaseAuthException error) {
          SnackbarMessages.showErrorSnackbar(context,
              error: "Error logging in, please try again later");
        },
      );
      return verificationId;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<UserCredential?> submitOtp(
      {required String verificationId, required String smsCode}) async {
    UserCredential? userCredential;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      debugPrint(credential.toString());

      return auth.signInWithCredential(credential);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
