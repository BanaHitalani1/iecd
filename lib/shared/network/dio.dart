import 'package:dio/dio.dart';

import '../../constants/constant.dart';
class DioNetwork{
  static late Dio dio;
  static dioInit(){
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true
      ),
    );
  }
  static Future<Response> post({
    String lang='en',
    String? token,
    required String endPoint,
    required Map<String,dynamic> data,
}) async {
    dio.options.headers={
      'lang':lang,
      'Content-Type':'application/json',
      'Authorization':token
    };
   return await dio.post(endPoint,data:data);
  }
  static Future<Response> get({
    String lang='en',
    required String endPoint,
})async{
    dio.options.headers={
      'lang':lang,
      'Content-Type':'application/json',
      'Authorization':token
    };
    return await dio.get(endPoint);
  }

}