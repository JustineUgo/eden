import 'package:eden/app/routes/routes.dart';
import 'package:eden/app/services/storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final StorageService storage;

  AuthController({required this.storage});

  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      userCredential;
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
}
