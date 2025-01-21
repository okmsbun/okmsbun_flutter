part of 'context_extensions.dart';

/// Extension on BuildContext to get MediaQueryData, Size, width, height, padding, brightness, orientation
extension ContextMediaQueryExtensions on BuildContext {
  /// Returns the MediaQueryData of the current context
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Returns the Size of the current context
  Size get appSize => mediaQuery.size;

  /// Returns the width of the current context
  double get width => appSize.width;

  /// Returns the height of the current context
  double get height => appSize.height;

  /// Returns the padding of the current context
  EdgeInsets get padding => mediaQuery.padding;

  /// Returns the brightness of the current context
  Brightness get brightness => mediaQuery.platformBrightness;

  /// Returns the orientation of the current context
  Orientation get orientation => mediaQuery.orientation;
}
