import 'dart:math' show pi;

import 'package:flutter/material.dart';

class AnimatedBuilderAndTransform extends StatefulWidget {
  const AnimatedBuilderAndTransform({super.key});

  @override
  State<AnimatedBuilderAndTransform> createState() =>
      _AnimatedBuilderAndTransformState();
}

class _AnimatedBuilderAndTransformState
    extends State<AnimatedBuilderAndTransform>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _animation = Tween(begin: 0.0, end: 2 * pi).animate(_controller);

    _controller.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform(
              transform: Matrix4.identity()
                ..rotateZ(
                  _animation.value,
                ),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 10,
                      spreadRadius: 5,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
