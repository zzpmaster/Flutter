import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPage();
  }
}

class _AuthPage extends State<AuthPage> {
  String _emailValue;
  String _passwrodValue;
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Container(
          margin: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (String value) {
                  setState(() {
                    _emailValue = value;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  // hintText: 'Enter Password',
                ),
                // 如果是密码，需要使用这个属性，隐藏输入文字
                obscureText: true,
                onChanged: (String value) {
                  setState(() {
                    _passwrodValue = value;
                  });
                },
              ),
              // 选择
              SwitchListTile(
                value: _acceptTerms, // 默认值是选中或未选中
                onChanged: (bool value) {
                  setState(() {
                    _acceptTerms = value;
                  });
                },
                title: Text('Accept Terms'),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                child: Text('LOGIN'),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () {
                  // 替换当前的路由
                  // Navigator.pushReplacement(context,
                  //     MaterialPageRoute(builder: (BuildContext context) => HomePage()));
                  Navigator.pushReplacementNamed(context, '/products');
                },
              )
            ],
          ),
        ));
  }
}
