import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/model/constants/color.dart';
import 'package:weather/model/user_model.dart';
import 'package:weather/view/home/home.dart';

class AuthController extends GetxController {
// instance
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController loginemail = TextEditingController();
  TextEditingController loginpassword = TextEditingController();
  TextEditingController restemail = TextEditingController();

  var loading = false.obs;

  //Create account with email and password
  signUp() async {
    try {
      loading.value = true;
      await auth.createUserWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      await addUser();
      await verifyemail();
      Get.offAll(() => HomeScreen());
      loading.value = false;
      final sharedPrefs = await SharedPreferences.getInstance();
      await sharedPrefs.setString('splashKey', 'login');
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          backgroundColor: CColors.kWhite,
          duration: const Duration(seconds: 3));
      loading.value = false;
    }
  }

  //add user to database
  addUser() async {
    UserModel user = UserModel(
        userName: username.text.trim(), email: auth.currentUser?.email);
    await db
        .collection("users")
        .doc(auth.currentUser?.uid)
        .collection('profile')
        .add(user.toMap());
  }

  //signout
  signout() async {
    await auth.signOut();
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setString('splashKey', 'logOut');
  }

  //signin
  signin() async {
    try {
      loading.value = true;
      await auth.signInWithEmailAndPassword(
          email: loginemail.text.trim(), password: loginpassword.text.trim());
      Get.offAll(() => HomeScreen());
      loading.value = false;
      final sharedPrefs = await SharedPreferences.getInstance();
      await sharedPrefs.setString('splashKey', 'login');
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          backgroundColor: CColors.kWhite,
          duration: const Duration(seconds: 3));
      loading.value = false;
    }
  }

  //verify email
  verifyemail() async {
    await auth.currentUser?.sendEmailVerification();
    Get.snackbar('Email', 'Send verification link to your email',
        backgroundColor: CColors.kWhite, duration: const Duration(seconds: 3));
  }

  //Password reset
  resetPassword() async {
    try {
      loading.value = true;
      await auth.sendPasswordResetEmail(email: restemail.text.trim());
      Get.snackbar('Email', 'Send successfully',
          backgroundColor: CColors.kWhite,
          duration: const Duration(seconds: 3));
      loading.value = false;
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          backgroundColor: CColors.kWhite,
          duration: const Duration(seconds: 3));
      loading.value = false;
    }
  }
}
