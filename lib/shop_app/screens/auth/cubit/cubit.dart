import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iecdfirst/constants/endpoits.dart';
import 'package:iecdfirst/shared/network/dio.dart';
import 'package:iecdfirst/shop_app/models/user_model.dart';
import 'package:iecdfirst/shop_app/screens/auth/cubit/state.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() :super(InitialAuthState());

  static AuthCubit get(context) => BlocProvider.of(context);
  bool isSecure = true;
  void changeSecure(){
    isSecure = !isSecure;
    emit(ChangeSecureAuthState());
  }
  void userLogin({required String email, required String password}) {
    emit(LoginLoadingAuthState());
    DioNetwork.post(endPoint: login, data: {
      'email': email,
      'password': password
    }).then((value) {
      print(value.data);
      emit(LoginSuccessAuthState(UserModel.fromJson(value.data)));
    }).catchError((error){
      print(error.toString());
      emit(LoginErrorAuthState(error.toString()));
    });
  }
}