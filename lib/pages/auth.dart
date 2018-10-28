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

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      image: AssetImage('assets/background.jpg'),
      fit: BoxFit.cover,
      colorFilter: ColorFilter.mode(
        Colors.black.withOpacity(0.5),
        BlendMode.dstATop,
      ),
    );
  }

  Widget _buildEmailTextField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Email',
        // TextField 增加颜色
        // filled: true,
        // fillColor: Colors.white,
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: (String value) {
        setState(() {
          _emailValue = value;
        });
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
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
    );
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      value: _acceptTerms, // 默认值是选中或未选中
      onChanged: (bool value) {
        setState(() {
          _acceptTerms = value;
        });
      },
      title: Text('Accept Terms'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Container(
          decoration: BoxDecoration(image: _buildBackgroundImage()),
          padding: EdgeInsets.all(10.0),
          // 使input屏幕居中
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _buildEmailTextField(),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildPasswordTextField(),
                  // 选择
                  _buildAcceptSwitch(),
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
            ),
          ),
        ));
  }
}
