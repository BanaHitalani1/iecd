import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:iecdfirst/bmi_app/cubit/state.dart';
class BMICubit extends Cubit<BMIState>{
  BMICubit() : super(InitialBMIState());
  static BMICubit get(context) => BlocProvider.of(context);
  double height = 150;
  int weight = 45;
  int age = 20;
  bool isMale = false;
void changeGender(bool gender){
  isMale=gender;
  emit(ChangeGenderState());
}
void changeHeight(double value){
  height=value;
  emit(ChangeHeightState());
}
  void changeAgePlus(){
    age++;
    emit(ChangeAgeState());
  }
  void changeAgeMinus(){
    age--;
    emit(ChangeAgeState());
  }
  void changeWeightPlus(){
    weight++;
    emit(ChangeWeightState());
  }
  void changeWeightMinus(){
    weight--;
    emit(ChangeWeightState());
  }
}