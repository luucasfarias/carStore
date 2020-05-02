import 'package:carros/pages/api_response.dart';
import 'package:carros/pages/home_page.dart';
import 'package:carros/login/login_api.dart';
import 'package:carros/login/user.dart';
import 'package:carros/utils/alert.dart';
import 'package:carros/utils/nav.dart';
import 'package:carros/widgets/app_button.dart';
import 'package:carros/widgets/app_text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _tUsername = TextEditingController();

  final _tPassword = TextEditingController();

  final _focusPassword = FocusNode();

  bool _showProgress = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cars Store"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            AppText(
              "Username",
              controller: _tUsername,
              validator: _validateUsername,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              nextFocus: _focusPassword,
            ),
            SizedBox(height: 10),
            AppText("Password",
                password: true,
                controller: _tPassword,
                validator: _validatePassword,
                keyboardType: TextInputType.number,
                focusNode: _focusPassword),
            SizedBox(height: 20),
            AppButton(
              "Login",
              onPressed: _onClickLogin,
              showProgress: _showProgress,
            )
          ],
        ),
      ),
    );
  }

  _raisedButton(String title, Function onPressed) {}

  _onClickLogin() async {
    bool form = _formKey.currentState.validate();
    if (!form) {
      return;
    }
    String login = _tUsername.text;
    String senha = _tPassword.text;

    setState(() {
      _showProgress = true;
    });
    ApiResponse response = await LoginApi.login(login, senha);
    if (response.status) {
      User user = response.result;
      push(context, HomePage());
    } else {
      alert(context, response.message);
    }

    setState(() {
      _showProgress = false;
    });
    print("Login: $login, Senha: $senha");
  }

  String _validateUsername(String text) {
    if (text.isEmpty) {
      return "Username is required";
    }
  }

  String _validatePassword(String text) {
    if (text.isEmpty) {
      return "Password is required";
    }
    if (text.length < 3) {
      return "Password is min of 3 chacpter";
    }
    return null;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
