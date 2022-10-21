import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  const Heart({super.key});

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _colorAnimation = ColorTween(
      begin: Colors.grey[400],
      end: Colors.red,
    ).animate(_controller);

    // _controller.forward();

    _controller.addListener(() {
      debugPrint('_controller.value ${_controller.value}');
      //   debugPrint('_colorAnimation.value ${_colorAnimation.value}');
    });

    // _controller.addStatusListener((status) {
    //   debugPrint('status $status');
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onPressed() {
    if (_controller.status == AnimationStatus.dismissed) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: AnimatedBuilder(
        animation: _controller,
        builder: (ctx, child) => Icon(
          Icons.favorite,
          color: _colorAnimation.value,
          size: 30,
        ),
      ),
    );
  }
}
