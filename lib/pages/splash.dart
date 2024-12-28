import 'package:flutter/material.dart';
import 'package:spalsh/common/app_colors.dart';
import 'package:spalsh/pages/welcome.dart';

import '../common/assets.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final duration = 3;
  int number = 0;

  Future<void> _countdown() async {
    number = duration;
    for (int i = 0; i <= duration; i++) {
      await Future.delayed(const Duration(seconds: 1));
      if (mounted == true) {
        setState(() {
          number = duration - i;
        });
      }

      if (number == 0) {
        print("倒计时结束");
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const WelcomePage(),
            ));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _countdown();
  }

  @override
  Widget build(BuildContext context) {
    // 建议 build 方法中只做 scaffold。具体的 UI 逻辑放到 _buildView 方法中。
    return Scaffold(
      backgroundColor: AppColors.backgroundSplash,
      body: _buildView(context),
    );
  }

  // build view page.
  Widget _buildView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // logo
          _buildLogo(),

          // 填充高度
          const SizedBox(height: 24),

          // title
          _buildTitle(),

          // 填充高度
          const SizedBox(height: 27),

          // counter
          _buildCounter(),
          // _buildText(number > 0 ? "$number" : "down"),
        ],
      ),
    );
  }

  Text _buildText(String text) {
    return Text(text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          // fontFamily: "Poppins",
          fontWeight: FontWeight.bold,
        ));
  }

  // build Logo
  Widget _buildLogo() {
    // 通过 Stack 的叠加功能，实现底部阴影效果。
    return Stack(
      alignment: Alignment.center,
      children: [
        // 底部阴影
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
              color: Colors.white, //
              borderRadius: BorderRadius.circular(120 / 2)),
        ),

        // logo image png
        Image.asset(
          AssetsImages.logoPng,
          width: 84,
          height: 80,
        ),
      ],
    );
  }

  // build title
  Widget _buildTitle() {
    return _buildText(
      "Online Market",
    );
  }

// build counter
  Widget _buildCounter() {
    return _buildText(number > 0 ? "$number" : "down");
  }


}
