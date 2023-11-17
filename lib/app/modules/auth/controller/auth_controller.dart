import 'package:eden/app/data/provider/provider.dart';
import 'package:eden/app/modules/auth/view/auth_view.dart';
import 'package:eden/app/modules/home/controller/home_controller.dart';
import 'package:eden/app/routes/routes.dart';
import 'package:eden/app/services/storage_service.dart';
import 'package:eden/app/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_signin_promax/github_signin_promax.dart';
import 'package:google_fonts/google_fonts.dart';
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
      await FirebaseAuth.instance.signOut();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      loadAuth(isTest: false);
    } on FirebaseAuthException catch (e) {
      if (e.code == "account-exists-with-different-credential") {
        showMessage(e.message ?? '');
      }
    } on Exception catch (e) {
      e;
      // showMessage(e.me)
    }
  }

  Future<dynamic> signInWithGithub(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();

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
    } on FirebaseAuthException catch (e) {
      if (e.code == "account-exists-with-different-credential") {
        showMessage(e.message ?? '');
      }
    } on Exception catch (e) {
      e;
    }
  }

  Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const AuthScreen(isTest: true));
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  void showMessage(String message) {
    Get.showSnackbar(
      GetSnackBar(
          messageText: const SizedBox.shrink(),
          titleText: Text(
            message,
            style: GoogleFonts.montserrat(
              color: AppTheme.green,
              fontSize: Dimensions.unit * 3.5,
            ),
          ),
          borderRadius: 8,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          duration: const Duration(seconds: 4),
          snackPosition: SnackPosition.TOP),
    );
  }
}

enum AuthType { github, google }
