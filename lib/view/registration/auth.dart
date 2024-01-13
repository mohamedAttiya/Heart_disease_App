// ignore_for_file: invalid_return_type_for_catch_error, unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graduation_project/helper/local_storage_data.dart';
import 'package:graduation_project/model/user_model.dart';
import 'package:graduation_project/services/firestore_user.dart';
import 'package:graduation_project/view/home_page.dart';
import 'package:graduation_project/view/registration/login_page.dart';

class AuthViewModel extends GetxController {
  var isPasswordHidden = true.obs;
  var isChecked = true.obs;
  var isLoading = false.obs;

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;

  String? email, password, name, pic;

  Rxn<User> _user = Rxn<User>();

  String? get user => _user.value?.email;

  final LocalStorageData localStorageData = Get.find();

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    //print(googleUser);
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;
    Get.offAll(HomeScreen());
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    await _auth.signInWithCredential(credential).then((user) {
      saveUser(user);
    });
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    Get.offAll(HomeScreen());
    // Once signed in, return the UserCredential
    return _auth.signInWithCredential(facebookAuthCredential);
  }

  void signInWithEmailAndPassword() async {
    isLoading.value = true;
    try {
      final userData = await _auth.signInWithEmailAndPassword(
          email: email!, password: password!);
      final data = (await FireStoreUser().getCurrentUser(userData.user!.uid))
          .data() as Map<dynamic, dynamic>;
      await setUser(UserModel(
        userId: data['userId'],
        name: data['name'],
        email: data['email'],
        pic: data['pic'],
      ));
      Get.offAll(HomeScreen());
    } on FirebaseAuthException catch (e) {
      print(e.message);

      Get.snackbar(
        'Error login account',
        e.message!,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    isLoading.value = false;
  }

  void createAccountWithEmailAndPassword() async {
    isLoading.value = true;
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      )
          .then((user) {
        saveUser(user);
      });

      Get.offAll(HomeScreen());
    } on FirebaseAuthException catch (e) {
      print(e.message);

      Get.snackbar(
        'Error login account',
        e.message!,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    isLoading.value = false;
  }

  void sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email).then((value) {
      Get.offAll(LoginPage());
      Get.snackbar("Password Reset email link is been sent", "Success");
    }).catchError(
      (onError) => Get.snackbar("Error In Email Reset", onError.message,
          snackPosition: SnackPosition.BOTTOM),
    );
  }

  void logOut() async {
    await _auth.signOut();
    Get.offAll(LoginPage());
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user!.uid,
      email: user.user!.email!,
      name: name == null ? user.user!.displayName! : name!,
      pic: '',
    );

    await FireStoreUser().addUserToFirestore(userModel);
    setUser(userModel);
  }

  Future<bool> setUser(UserModel userModel) async {
    return await localStorageData.setUser(userModel);
  }
}
