import 'package:flutter/material.dart';

AnimatedWidget enterExitAnimation(
    context, animation, secondaryAnimation, child) =>
    SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 0.0),
        end: const Offset(-1.0, 0.0),
      ).animate(secondaryAnimation),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );

AnimatedWidget bounceInAnimation(
    context, animation, secondaryAnimation, child) =>
    ScaleTransition(
      scale: Tween(begin: 1.0, end: 0.9).animate(
        CurvedAnimation(
          parent: secondaryAnimation,
          curve: Curves.elasticOut,
        ),
      ),
      child: ScaleTransition(
        scale: Tween(begin: 0.9, end: 1.0).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.elasticOut,
          ),
        ),
        child: child,
      ),
    );
