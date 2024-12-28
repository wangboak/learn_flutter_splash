import 'package:flutter/material.dart';
import 'package:spalsh/common/assets.dart';
import 'package:spalsh/pages/login.dart';

import '../common/button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildView(context),
    );
  }

  Widget _buildView(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Title
          _buildTitle(),

          // 填充高度
          const SizedBox(height: 70),

          // welcome image
          _buildImage(),

          // 填充高度
          const SizedBox(height: 70),

          // button
          _buildButtons(context),
        ],
      ),
    );
  }

  // build title
  Widget _buildTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        "Browse & Order All Products at Any Time",
        style: TextStyle(
          fontSize: 20,
          color: Color(0xff2B2A2A),
          fontWeight: FontWeight.bold,
          height: 23 / 20,
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Image.asset(
      AssetsImages.welcomePng,
      width: double.infinity,
      height: 300,
      fit: BoxFit.fitWidth,
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        // 两边对齐
        children: [
          TextButton(
            onPressed: () {
              print("Button Clicked");
            },
            child: const Text(
              "Skip",
              style: TextStyle(
                color: Color(0xff2B2A2A),
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),

          // 弹性布局，弹开。
          const Spacer(),

          // get stated button
          ButtonWidget(
            text: "Get Started",
            width: 139,
            height: 42,
            radius: 32,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const LoginPage();
              }));
            },
          ),
        ],
      ),
    );
  }
}
