import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EstimatedAppBarContainer extends StatelessWidget {
  const EstimatedAppBarContainer({
    required this.backgroundColor,
    required this.child,
  });

  final Color backgroundColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      _overlayBrightness(
        ThemeData.estimateBrightnessForColor(backgroundColor),
        backgroundColor,
      ),
    );

    return Container(
      color: backgroundColor,
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: child,
    );
  }

  SystemUiOverlayStyle _overlayBrightness(
    Brightness brightness,
    Color? backgroundColor,
  ) {
    final SystemUiOverlayStyle style = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;
    return SystemUiOverlayStyle(
      statusBarColor: backgroundColor,
      statusBarBrightness: style.statusBarBrightness,
      statusBarIconBrightness: style.statusBarIconBrightness,
      systemStatusBarContrastEnforced: style.systemStatusBarContrastEnforced,
    );
  }
}

class EstimatedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EstimatedAppBar({required this.backgroundColor, required this.child});

  final Color backgroundColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return EstimatedAppBarContainer(
      backgroundColor: backgroundColor,
      child: child,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
