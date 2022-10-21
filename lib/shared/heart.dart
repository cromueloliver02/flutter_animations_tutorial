import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  const Heart({super.key});

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Color?> _colorAnimation;
  late final Animation<double> _sizeAnimation;
  late final Animation<double> _curve;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.slowMiddle,
    );

    _colorAnimation = ColorTween(
      begin: Colors.grey[400],
      end: Colors.red,
    ).animate(_curve);

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 30, end: 50),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 50, end: 30),
        weight: 50,
      ),
    ]).animate(_curve);

    // _controller.forward();

    // _controller.addListener(() {
    //   debugPrint('_controller.value ${_controller.value}');
    //   debugPrint('_colorAnimation.value ${_colorAnimation.value}');
    //   debugPrint('_sizeAnimation.value ${_sizeAnimation.value}');
    // });

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
          size: _sizeAnimation.value,
        ),
      ),
    );
  }
}
