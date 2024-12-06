import 'package:flutter/material.dart';

class TweenScreen extends StatefulWidget {
  const TweenScreen({super.key});

  @override
  State<TweenScreen> createState() => _TweenScreenState();
}

class _TweenScreenState extends State<TweenScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Size> sizetween;
  late Animation<double> opacitytween;
  late Animation<Color?> colortween;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    sizetween = Tween<Size>(end: Size(100, 200), begin: Size(300, 100))
        .animate(animationController);
    opacitytween =
        Tween<double>(begin: .5, end: 1).animate(animationController);
    colortween = ColorTween(begin: Colors.red, end: Colors.yellow)
        .animate(animationController);
    

    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) => Container(
            height: sizetween.value.height,
            width: sizetween.value.width,
            color: colortween.value!.withOpacity(opacitytween.value),
          ),
        ),
      ),
    );
  }
}
