import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:payment_app/core/network/constant.dart';

class DioHelper{
  static late Dio dio;
  static initDio(){
    dio =Dio(BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        headers:{
          'Content-Type':'application/json',
        },
      receiveDataWhenStatusError: true
    ));
  }
  static Future<Response>postData({required String url,Map<String,dynamic>? data})async{
    return await dio.post(url,data:data);
  }
}