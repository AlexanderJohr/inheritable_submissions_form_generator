
import 'package:flutter/material.dart';

class EmptyPage extends Page {
  const EmptyPage({Key? key});

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, animation, animation2) {
        final tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero);
        final curveTween = CurveTween(curve: Curves.easeInOut);
        return SlideTransition(
          position: animation.drive(curveTween).drive(tween),
          child: Scaffold(
            appBar: AppBar(),
            body: const SizedBox.shrink(),
          ),
        );
      },
    );
  }
}