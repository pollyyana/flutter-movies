
import 'package:firebase_auth/firebase_auth.dart';

import 'package:app_filmes/repositories/login/login_repository.dart';
import 'package:app_filmes/service/login/login_service.dart';

class LoginServiceImpl implements LoginService {

  //precisa da instacia do repository
  LoginRepository _loginRepository;

  LoginServiceImpl({
    required LoginRepository loginRepository,
  }): _loginRepository = loginRepository;



  @override
  Future<UserCredential> login() => _loginRepository.login();

}
//agr login controller precisa ter acesso a login service =)