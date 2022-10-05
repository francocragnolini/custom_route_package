import 'package:flutter/material.dart';

enum AnimationType {
  normal,
  fadeIn,
}

class RouteTransitions {
  final BuildContext context;
  final Widget child;
  final AnimationType animation;
  final Duration duration;

  RouteTransitions({
    required this.context,
    required this.child,
    this.animation = AnimationType.normal,
    this.duration = const Duration(milliseconds: 300),
  }) {
    switch (animation) {
      case AnimationType.normal:
        _normalTransition();
        break;
      case AnimationType.fadeIn:
        _fadeInTransition();
        break;
    }
  }

  // metodo
  void _normalTransition() => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => child,
      ));

  void _fadeInTransition() {
    final route = PageRouteBuilder(
      pageBuilder: (____, _____, _______) => this.child,
      transitionDuration: duration,
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(
            child: child,
            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOut)));
      },
    );

    Navigator.push(context, route);
  }
}
