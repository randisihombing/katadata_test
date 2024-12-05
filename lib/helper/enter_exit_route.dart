import 'package:flutter/material.dart';

import 'animation_collection.dart';

class EnterExitRoute extends PageRouteBuilder {
  EnterExitRoute({
    RouteSettings? settings,
    required this.page,
    Duration transitionDuration = const Duration(milliseconds: 150),
    Duration reverseTransitionDuration = const Duration(milliseconds: 150),
  }) : super(
    transitionDuration: transitionDuration,
    reverseTransitionDuration: reverseTransitionDuration,
    settings: settings,
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) =>
    page,
    transitionsBuilder: enterExitAnimation,
  );

  final Widget page;
}
