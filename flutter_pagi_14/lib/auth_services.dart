import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUp(String username, String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = result.user;

      if (user != null) {
        await user.updateDisplayName(username);
        await user.reload();
        return _auth.currentUser;
      }

      return result.user;
    } catch (e) {
      print("Signup error: $e");
      return null;
    }
  }

  Future<User?> login(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return result.user;
    } catch (e) {
      print("Login error: $e");
      return null;
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignIn signIn = GoogleSignIn.instance;
      await signIn.initialize(
        serverClientId:
            "112265753690-c8ksq36d0o40dcipkd0pmbtlp95p01v4.apps.googleusercontent.com",
        clientId:
            "112265753690-c8ksq36d0o40dcipkd0pmbtlp95p01v4.apps.googleusercontent.com",
      );
      final GoogleSignInAccount googleUser = await signIn.authenticate();

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      UserCredential result = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      return result.user;
    } catch (e) {
      print("Login Google Error: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
