import 'dart:convert';

import 'package:carros/pages/api_response.dart';
import 'package:carros/login/user.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<User>> login(String login, String senha) async {
    try {
      var url = 'http://carros-springboot.herokuapp.com/api/v2/login';

      Map<String, String> headers = {'Content-Type': 'application/json'};

      Map params = {
        'username': login,
        'password': senha,
      };

      String data = json.encode(params);
      var response = await http.post(url, body: data, headers: headers);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      Map dataResponse = json.decode(response.body);
      String nome = dataResponse['nome'];
      String email = dataResponse['email'];
      print('nome: $nome');

      if (response.statusCode == 200) {
        final user = User.fromJson(dataResponse);
        return ApiResponse.success(user);
      }
      return ApiResponse.error(dataResponse['error']);
    } catch (error, exception) {
      print('Erro no login: $exception');
      return ApiResponse.error("Não foi possivel fazer o login");
    }
  }
}
