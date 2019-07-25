import 'package:brazkit/src/services/response/ResponseStatus.dart';
import 'package:brazkit/src/utils/alertkit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';


String firebaseUserUid;

class FirebaseService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<ResponseStatus> signUp(String nome, String email, String senha) async {
    try {
      // Usuario do Firebase
      final FirebaseUser fUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: senha);

      final userUpdateInfo = UserUpdateInfo();
      userUpdateInfo.displayName = nome;
      userUpdateInfo.photoUrl =
          "https://firebasestorage.googleapis.com/v0/b/sunterapp.appspot.com/o/public%2Favatar.png?alt=media&token=bc4669e6-4f03-45ba-8f82-736fa0405392";
      fUser.updateProfile(userUpdateInfo);

      // Resposta genérica
      return ResponseStatus(true,
          messageSuccess: "Usuário cadastrado com sucesso", body: fUser);
    } catch (error) {
      if (error is PlatformException) {
        print("Error Code ${error.code}");
        return ResponseStatus(false,
            messageError: "Erro ao criar um usuário.\n\n${error.message}");
      }

      return ResponseStatus(false, messageError: "Não foi possível criar um usuário.");
    }
  }

  Future<ResponseStatus> login(String email, String senha) async {
    try {
      // Usuario do Firebase
      final FirebaseUser fUser =
          await _auth.signInWithEmailAndPassword(email: email, password: senha);
      return ResponseStatus(true,
          messageSuccess: "Login efetuado com sucesso", body: fUser);
    } catch (error) {
      print(error);

      if (error is PlatformException) {
        print("Error Code ${error.code}");

        return ResponseStatus(false,
            messageError: "Email/Senha incorretos\n\n${error.message}");
      }

      return ResponseStatus(false,
          messageError: "Não foi possível fazer o login");
    }
  }

  Future<ResponseStatus> loginGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Usuario do Firebase
    final FirebaseUser fuser = await _auth.signInWithCredential(credential);
    print("signed in " + fuser.displayName);

    // TODO salvar usuario no banco
//    saveUser();

    // Resposta genérica
    return ResponseStatus(true, messageSuccess: "Login efetuado com sucesso");
  }

  Future<void> recoverPass(context, String email) {
    return _auth.sendPasswordResetEmail(email: email).then((result) {
      AlertKit.showAlertDialog(context,
          "Enviamos um email de recuperação de senha. Verifique sua caixa de entrada.");
    }).catchError((error) {
      if (error is PlatformException) {
        print("Error Code ${error.code}");

        if (error.code == "ERROR_USER_NOT_FOUND") {
          return AlertKit.showAlertDialog(context,
              'Email não encontrado, verifique se digitou corretamente.');
        } else if (error.code == "ERROR_INVALID_EMAIL") {
          return AlertKit.showAlertDialog(
              context, 'Email inválido, verifique se digitou corretamente.');
        } else {
          return AlertKit.showAlertDialog(context, 'Ocorreu um erro.\n$error');
        }
      } else {
        return AlertKit.showAlertDialog(context, 'Ocorreu um erro.\n$error');
      }
    });
  }

  Future<FirebaseUser> isLoggedIn() async {
    var firebaseUser = await _auth.currentUser();
    return firebaseUser;
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
    } catch (e) {
      // error
    }
  }

//  Future<Null> _saveUserData(Map<String, dynamic> userData) async {
//    this.userData = userData;
//    await Firestore.instance.collection("users").document(firebaseUser.uid).setData(userData);
//  }

// salva o usuario na collection de usuarios logados
//  static void saveUser() async {
//    FirebaseUser user = await FirebaseAuth.instance.currentUser();
//    if(user != null) {
//      firebaseUserUid = user.uid;
//      DocumentReference refUser = Firestore.instance.collection("users").document(firebaseUserUid);
//      refUser.setData({'nome':user.displayName,'email':user.email});
//    }
//  }

}
