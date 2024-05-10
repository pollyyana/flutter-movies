import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'login_repository.dart';

 class LoginRepositoryImpl implements LoginRepository {
   @override
  //precisa do package google_sing_in pra aprecer a telinha do google e fzr login com o google
   Future<UserCredential> login() async {
    //1- passo: chamar o google sing.. pra abrir  a janela do google e logar
     final googleUser = await GoogleSignIn().signIn();
     //2 - pegar os dados de identificação de vem do google se ele nao for nulo pq pode vir nulo
     final googleAuth = await googleUser?.authentication;
     // verificar se o go..Au é diferente de nulo, senao for nulo temos uma excessao
    //googlesingIn retorna 2 cara. O token  para o firebase acessar o google  e garantir que o mesmo cara e o id la no google. Pro firebase
     if (googleAuth != null) {
      //se ele nao for null vamos pedir pro fitrebase adc o usuario dentro da sua estrutura
       final credential = GoogleAuthProvider.credential(
         accessToken: googleAuth.accessToken,
         idToken: googleAuth.idToken
       );
      //temos a credential
      //4 fazer login no firebase
       return FirebaseAuth.instance.signInWithCredential(credential);
    }
   throw Exception('Erro ao realizar login com Google');
 }
    
}
 
