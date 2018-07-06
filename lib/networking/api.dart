import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import '../utils/http_utils.dart';

class Api {
  static final String baseUrl = 'https://api.xcifang.org/';

  Future<Response> getUserInfo(String token) async {
    var requestUri = baseUrl + 'api/userinfo';

    var response = await postRequest(requestUri, {
      'token': token,
    });
    return response;
  }

  Future<Response> getVerifyCode(String mobile) async {
    var requestUri = baseUrl + 'api/getverifycode';

    var response = await postRequest(requestUri, {
      'mobile': mobile,
    });
    return response;
  }

  Future<Response> loginWithVerifyCode(String mobile, String verifyCode) async {
    var requestUri = baseUrl + 'api/verifycodelogin';

    var response = await postRequest(requestUri, {
      'mobile': mobile,
      'verifyCode': verifyCode,
    });
    return response;
  }

  Future<bool> loginWithThird(String unionid, int type, String avatar,
      String nickname, int gender) async {
    var requestUri = baseUrl + 'api/thirdlogin';

    var response = await postRequest(requestUri, {
      'unionid': unionid,
      'type': type,
      'avatar': avatar,
      'nickname': nickname,
      'gender': gender
    });
    if (response.statusCode != 200) {
      // 网络错误或服务器错误
      return false;
    }
    Map<String, dynamic> responseJson = json.decode(response.body);
    var code = responseJson['code'];
    if (code == 0) {
      // 登录成功，保存token
      return true;
    } else {
      // 登录失败
      return false;
    }
  }

  Future<bool> createTask(String mobile, String verifyCode) async {
    var requestUri = baseUrl + 'api/createtask';

    var response = await postRequest(requestUri, {
      'mobile': mobile,
      'verifyCode': verifyCode,
    });
    if (response.statusCode != 200) {
      // 网络错误或服务器错误
      return false;
    }
    Map<String, dynamic> responseJson = json.decode(response.body);
    var code = responseJson['code'];
    if (code == 0) {
      // 登录成功，保存token
      return true;
    } else {
      // 登录失败
      return false;
    }
  }
}
