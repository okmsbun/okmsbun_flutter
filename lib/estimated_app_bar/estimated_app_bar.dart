import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A widget that wraps a [child] with a [Container] that has a background color
/// and a top margin that matches the height of the system status bar.
/// The [backgroundColor] is used as the background color of the app bar.
class EstimatedAppBarContainer extends StatelessWidget {
  /// Creates a widget that wraps a [child] with a [Container] that has a
  /// background color and a top margin that matches the height of the system
  /// status bar.
  const EstimatedAppBarContainer({
    required this.backgroundColor,
    required this.child,
  });

  /// The background color of the app bar.
  final Color backgroundColor;

  /// The widget below this widget in the tree.
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

/// A widget that wraps a [child] with a [Container] that has a background color
/// and a top margin that matches the height of the system status bar.
/// The [backgroundColor] is used as the background color of the app bar.
class EstimatedAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Creates a widget that wraps a [child] with a [Container] that has a
  /// background color and a top margin that matches the height of the system
  /// status bar.
  const EstimatedAppBar({required this.backgroundColor, required this.child});

  /// The background color of the app bar.
  final Color backgroundColor;

  /// The widget below this widget in the tree.
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
