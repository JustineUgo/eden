import 'package:eden/app/data/provider/provider.dart';
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

  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      User? user = FirebaseAuth.instance.currentUser;
      storage.setProfile(user?.displayName ?? '', user?.email ?? '', user?.photoURL ?? '');
      Get.offAllNamed(Paths.home);
    } on Exception catch (e) {
      // TODO
      print('exception->$e');
    }
  }

  Future<bool> signOutFromGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  Future<dynamic> signInWithGithub(BuildContext context) async {
    try {
      // create required params
      var params = GithubSignInParams(
        clientId: 'f0911f27da590fd9aab2',
        clientSecret: '1dee5378dc7f261bcfe61fdcb4e28537786d98e4',
        redirectUrl: 'https://eden-d5ed4.firebaseapp.com/__/auth/handler',
        scopes: 'read:user,user:email',
      );

      // Push [GithubSigninScreen] to perform login then get the [GithubSignInResponse]
      GithubSignInResponse response = await Navigator.of(context).push(MaterialPageRoute(builder: (builder) {
        return GithubSigninScreen(
          params: params,
          headerColor: AppTheme.green,
          title: 'Github login',
        );
      }));

      final AuthCredential credential = GithubAuthProvider.credential(response.accessToken ?? '');

      await FirebaseAuth.instance.signInWithCredential(credential);

      User? user = FirebaseAuth.instance.currentUser;
      storage.setProfile(user?.displayName ?? '', user?.email ?? '', user?.photoURL ?? '');
      Get.offAllNamed(Paths.home);
      // storage.setProfile(user?.displayName ?? '', user?.email ?? '', user?.photoURL ?? '');
      // Get.offAllNamed(Paths.home);
    } on Exception catch (e) {
      // TODO
      print('exception->$e');
    }
  }
}

enum AuthType { github, google }
