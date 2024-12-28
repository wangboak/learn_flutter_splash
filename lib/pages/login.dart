import 'package:flutter/material.dart';
import 'package:spalsh/common/app_colors.dart';
import 'package:spalsh/common/assets.dart';
import 'package:spalsh/common/button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isUsernameValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildView(),
    );
  }

  /**
   * 构建视图
   * 通过 Scaffold 构建页面基本结构
   *
   * 列式布局，包含：logo、主标题、子标题、表单
   */
  Widget _buildView() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      color: AppColors.backgroundSplash,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Logo
          Image.asset(
            AssetsImages.logoPng,
            width: 67,
            height: 50,
          ),

          const SizedBox(height: 22),

          // 主标题
          const Text(
            'Let\'s Sign You In',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 10),

          // 子标题
          const Text(
            'welcome back, you\'ve been missed!',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w300,
              color: Color(0XFFEEEEEE),
            ),
          ),
          const SizedBox(height: 55),

          // 表单
          _buildForm(),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 70, 20, 35),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Username or Email
          const Text(
            "Username or E-mail",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: Color(0XFF838383),
            ),
          ),

          const SizedBox(height: 10),

          // username
          TextField(
            decoration: InputDecoration(
              hintText: '@',
              prefixIcon: const Icon(Icons.person),
              suffixIcon: isUsernameValid
                  ? const Icon(Icons.check_circle, color: Colors.green)
                  : null,
              hintStyle: const TextStyle(
                color: Color(0XFF838383),
                fontSize: 14,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: const Color(0XFFEEEEEE),
              // fillColor: Colors.orange,
            ),
            onChanged: (value) {
              setState(() {
                isUsernameValid = value.isNotEmpty && value.length > 6;
              });
            },
          ),

          const SizedBox(height: 20),

          // password
          const Text(
            "Password",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: Color(0XFF838383),
            ),
          ),
          const SizedBox(height: 10),
          // password
          TextField(
            decoration: InputDecoration(
              hintText: 'more than 6 characters',
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: TextButton(
                onPressed: () {
                  // todo forgot password
                },
                child: const Text(
                  'Forgot?',
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ),
              hintStyle: const TextStyle(
                color: Color(0XFF838383),
                fontSize: 14,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: const Color(0XFFEEEEEE),
            ),
            obscureText: true,
          ),

          const SizedBox(height: 20),

          // login button
          ButtonWidget(
            text: 'Sign in',
            width: double.infinity,
            height: 57,
            radius: 32,
            onPressed: () {
              // 弹出一个提示框
              ButtonWidget.alertDialog(
                context: context,
                title: 'Login',
                content: 'Login Success',
              );
            },
          ),

          const SizedBox(height: 15),
          // forgot password
          const Row(
            children: [
              Text(
                'Dont\'t have an account?',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Text(
                'Sign Up',
                style: TextStyle(
                  color: Color(0XFF0274BC),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
