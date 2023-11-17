import 'package:eden/app/data/provider/provider.dart';
import 'package:eden/app/modules/home/controller/home_controller.dart';
import 'package:eden/app/routes/routes.dart';
import 'package:eden/app/services/storage_service.dart';
import 'package:eden/app/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_signin_promax/github_signin_promax.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final StorageService storage;
  final EdenProvider provider;

  AuthController({required this.storage, required this.provider});
  RxBool isLoading = RxBool(false);

  Future loadAuth({required bool isTest}) async {
    isLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    if (!isTest) {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        storage.setProfile(user.displayName ?? '', user.email ?? '', user.photoURL ?? '');
        Get.find<HomeController>().connectToAbly();
        Get.offAllNamed(Paths.home);
      }
    }

    isLoading(false);
  }

  Future<dynamic> signInWithGoogle() async {
    try {
      await signOut();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      loadAuth(isTest: false);
    } on Exception catch (e) {
      e;
    }
  }

  Future<dynamic> signInWithGithub(BuildContext context) async {
    try {
      await signOut();

      dynamic secrets = await provider.getSecrets();
      String githubKey = secrets["githubKey"];
      String clientId = secrets["githubClient"];

      var params = GithubSignInParams(
        clientId: clientId,
        clientSecret: githubKey,
        redirectUrl: 'https://eden-d5ed4.firebaseapp.com/__/auth/handler',
        scopes: 'read:user,user:email',
      );

      // ignore: use_build_context_synchronously
      GithubSignInResponse response = await Navigator.of(context).push(MaterialPageRoute(builder: (builder) {
        return GithubSigninScreen(
          params: params,
          headerColor: AppTheme.green,
          title: 'Github login',
        );
      }));
      final AuthCredential credential = GithubAuthProvider.credential(response.accessToken ?? '');

      await FirebaseAuth.instance.signInWithCredential(credential);
      loadAuth(isTest: false);
    } on Exception catch (e) {
      e;
    }
  }

  Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed(Paths.auth);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}

enum AuthType { github, google }
