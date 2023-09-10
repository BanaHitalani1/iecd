import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:iecdfirst/constants/endpoits.dart';
import 'package:iecdfirst/shared/network/dio.dart';
import 'package:iecdfirst/shop_app/home_layout/cubit/state.dart';
import 'package:iecdfirst/shop_app/models/home_model.dart';
import 'package:iecdfirst/shop_app/screens/favoite_screen.dart';
import 'package:iecdfirst/shop_app/screens/home_screen.dart';
import 'package:iecdfirst/shop_app/screens/settings_screen.dart';

class ShopAppCubit extends Cubit<ShopAppState> {
  ShopAppCubit() : super(InitialShopAppState());

  static ShopAppCubit get(context) => BlocProvider.of(context);
  int index=0;
  List<Widget> screen=[
    HomeScreen(),
    FavoriteScreen(),
    SettingScreen()
  ];
  void changeIndex(int value){
    index=value;
    emit(ChangeBottomNavBarIndexState());
  }
  HomeModel? homeModel;
  void getHomeData(){
    emit(GetHomeDataLoadingState());
    DioNetwork.get(endPoint: home).then((value) {
      print(value.data);
      homeModel = HomeModel.fromJson(value.data);
      emit(GetHomeDataSuccessState(HomeModel.fromJson(value.data)));
    }).catchError((error){
      print(error.toString());
      emit(GetHomeDataErrorState(error.toString()));
    });
  }
}
