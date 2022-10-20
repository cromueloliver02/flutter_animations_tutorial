import 'package:flutter/material.dart';

class Sandbox extends StatefulWidget {
  const Sandbox({super.key});

  @override
  State<Sandbox> createState() => _SandboxState();
}

class _SandboxState extends State<Sandbox> {
  var _width = 100.0;
  var _height = 100.0;
  var _color = Colors.blue;
  var _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    const duration = 500;

    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: duration),
          opacity: _opacity,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: duration),
            width: _width,
            height: _height,
            color: _color,
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(
              Icons.arrow_back,
              size: 40,
            ),
            onPressed: () {
              setState(() => _width = _width == 200 ? 100 : 200);
            },
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            child: const Icon(
              Icons.arrow_forward,
              size: 40,
            ),
            onPressed: () {
              setState(() => _height = _height == 200 ? 100 : 200);
            },
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            child: const Icon(
              Icons.arrow_upward,
              size: 40,
            ),
            onPressed: () {
              setState(() {
                _color = _color == Colors.blue ? Colors.red : Colors.blue;
              });
            },
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            child: const Icon(
              Icons.arrow_downward,
              size: 40,
            ),
            onPressed: () {
              setState(() {
                _opacity = _opacity == 1.0 ? 0.0 : 1.0;
              });
            },
          ),
        ],
      ),
    );
  }
}
