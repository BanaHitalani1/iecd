import 'package:iecdfirst/shop_app/models/user_model.dart';

abstract class AuthStates {}
class InitialAuthState extends AuthStates{}
class ChangeSecureAuthState extends AuthStates{}
class LoginLoadingAuthState extends AuthStates{}
class LoginSuccessAuthState extends AuthStates{
  final UserModel userModel;
  LoginSuccessAuthState(this.userModel);
}
class LoginErrorAuthState extends AuthStates{
  final String error;
  LoginErrorAuthState(this.error);
}