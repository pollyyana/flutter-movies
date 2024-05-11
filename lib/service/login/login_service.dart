import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginService {
Future<UserCredential> login();

  //nao e um metodo e uma interface (um contrato)
  Future<void> logout() ;

}