
import 'package:dio/dio.dart';
import 'package:e_commerce_app/api/api_services.dart';
import 'package:e_commerce_app/api/end_points.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class GetItModule{


 @singleton
 @injectable
 BaseOptions provideBaseOptions(){
   return BaseOptions(
     baseUrl: EndPoints.baseUrl,
     receiveDataWhenStatusError: true,
     connectTimeout: Duration(seconds: 20),
     receiveTimeout: Duration(seconds: 20),

   );
 }

 @singleton
 @injectable
 PrettyDioLogger providePrettyDioLogger(){
   return PrettyDioLogger(
     request: true,
     requestBody: true,
     responseBody: true,
     responseHeader: true,
     requestHeader: true,
     error: true,

   );

}

 @singleton
 @injectable
  Dio provideDio(BaseOptions baseOptions , PrettyDioLogger prettyDioLogger){
   var dio = Dio(
     baseOptions,
   );
   //todo: add dio interceptors,
   dio.interceptors.add(prettyDioLogger);
   return dio;

  }

 @singleton
 @injectable
  ApiServices provideApiServices(Dio dio) => ApiServices(dio);
}