import 'dart:math';
import 'package:flutter/material.dart';

class FallingLeaves extends StatefulWidget {
  const FallingLeaves({super.key});

  @override
  State<FallingLeaves> createState() => _FallingLeavesState();
}

class _FallingLeavesState extends State<FallingLeaves>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Random _random = Random();

  static const int starCount = 15;

  late List<double> xPositions;
  late List<double> speeds;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();

    xPositions =
        List.generate(starCount, (_) => _random.nextDouble() * 400);

    speeds =
        List.generate(starCount, (_) => 1 + _random.nextDouble() * 1.5);
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return Stack(
            children: List.generate(starCount, (i) {
              final double y =
                  (_controller.value * height * speeds[i]) % height;

              // rơi chéo
              final double x = xPositions[i] + y * 0.25;

              return Positioned(
                top: y,
                left: x,
                child: Transform.rotate(
                  angle: pi / 4,
                  child: Row(
                    children: [
                      // 🌠 ĐUÔI SAO
                      Container(
                        width: 30,
                        height: 2,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.yellowAccent,
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),

                      // ⭐ NGÔI SAO
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
