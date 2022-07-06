import 'package:flutter_demo/utils/request_util.dart';

class HomeApi {
  static getHomeInfo() {
    return RequestUtil.get(
      'https://www.fastmock.site/mock/871b3e736e653b99374b7713e4011f9f/boss/user/list2',
    );
  }
}
