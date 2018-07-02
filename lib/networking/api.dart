import 'dart:async';
import 'dart:convert';

import '../utils/http_utils.dart';

class Api {
  static final String baseUrl = 'http://123.206.30.171:2234/';

  Future<bool> getVerifyCode(String mobile) async {
    var requestUri = Uri.https(
      baseUrl,
      'api/getverifycode',
      <String, String>{
        'mobile': mobile,
      },
    );

    var response = await getRequest(requestUri);
    Map<String, dynamic> responseJson = json.decode(response);
    var code = responseJson['code'];
    if (code == 0) {
      // 请求验证码成功，保存token
      return true;
    } else {
      // 请求验证码失败
      return false;
    }
  }

  Future<bool> loginWithVerifyCode(String mobile, String verifyCode) async {
    var requestUri = Uri.https(
      baseUrl,
      'api/verifycodelogin',
      <String, String>{
        'mobile': mobile,
        'verifyCode': verifyCode,
      },
    );

    var response = await getRequest(requestUri);
    Map<String, dynamic> responseJson = json.decode(response);
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
    var requestUri = Uri.https(
      baseUrl,
      'api/createtask',
      <String, String>{
        'mobile': mobile,
        'verifyCode': verifyCode,
      },
    );

    var response = await getRequest(requestUri);
    Map<String, dynamic> responseJson = json.decode(response);
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
