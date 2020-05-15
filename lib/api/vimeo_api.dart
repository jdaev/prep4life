import 'dart:io';

import 'package:dio/dio.dart';
import 'package:prep4life/app/course/models/vimeo_video.dart';
import 'package:prep4life/constants/keys.dart';

class VimeoAPI {
  VimeoAPI._();
  static final instance = VimeoAPI._();
  final String endpoint = 'https://api.vimeo.com/videos/';
  final Dio _dio = Dio();

  Future<Map> getVideo(String videoId) async {
    try {
      print('bearer ${Keys.vimeoAccessToken}');
      _dio.interceptors
          .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
        options.headers = {'Authorization': 'Bearer ${Keys.vimeoAccessToken}'};
        return options;
      }, onResponse: (Response response) async {
        return response;
      }, onError: (DioError e) async {
        return e; //continue
      }));
      Response _response = await _dio.get(endpoint + videoId);
      print(_response.data);
      return _response.data;
    } catch (e) {
      print(e);
      return {};
    }
  }
}
