import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.text,
    this.width,
    this.height,
    this.radius,
    this.onPressed,
  });

  final String? text;
  final double? width;
  final double? height;
  final double? radius; // 圆角
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xffFF6C44),
        borderRadius: BorderRadius.circular(radius ?? 32),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        // style: ElevatedButton.styleFrom(
        //   backgroundColor: Colors.orange,
        // ),
        child: Text(
          text ?? 'Button',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  static void alertDialog(
      {required BuildContext context,
      required String title,
      required String content}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
