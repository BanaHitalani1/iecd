import 'package:iecdfirst/shop_app/models/home_model.dart';

abstract class ShopAppState{}
class InitialShopAppState extends ShopAppState{}
class ChangeBottomNavBarIndexState extends ShopAppState{}
class GetHomeDataLoadingState extends ShopAppState{}
class GetHomeDataSuccessState extends ShopAppState{
  final HomeModel homeModel;

  GetHomeDataSuccessState(this.homeModel);
}
class GetHomeDataErrorState extends ShopAppState{
  final String error;

  GetHomeDataErrorState(this.error);
}