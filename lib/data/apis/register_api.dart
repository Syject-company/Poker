import 'package:dio/dio.dart';

import 'package:the_academy_poker/data/models/register_model.dart';
import 'package:the_academy_poker/utils/constants.dart';

class RegisterApi {
  var dio = Dio();

  Future<Response> register(RegisterModel model) async {
    Map<dynamic, dynamic> dataMap = {
      'name': model.name,
      'email': model.email,
      'wm_sid': model.wm_sid
    };

    FormData formData =
        FormData.fromMap({'name': model.name, 'email': model.email, 'wm_sid': model.wm_sid});
    Response res = await dio.post('${Constants.domain}/RPC/lead_register', data: formData);

    if (res.statusCode == 200) {
      return res;
    } else {
      throw res;
    }
  }
}
