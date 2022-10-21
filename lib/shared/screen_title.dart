import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String text;

  const ScreenTitle({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
      tween: Tween<double>(begin: 0, end: 1),
      builder: (ctx, value, child) => Padding(
        padding: EdgeInsets.only(top: value * 20),
        child: Opacity(
          opacity: value,
          child: child,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 36,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
