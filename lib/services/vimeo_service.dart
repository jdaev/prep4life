import 'package:prep4life/api/vimeo_api.dart';

class VimeoService {
  VimeoService._();
  static final instance = VimeoService._();
  final VimeoAPI _vimeoAPI = VimeoAPI.instance;
  
  Future<Map> getVideo(String videoID) async {
    return _vimeoAPI.getVideo(videoID);
  }
}