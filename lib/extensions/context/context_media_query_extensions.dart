part of 'context_extensions.dart';

extension ContextMediaQueryExtensions on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get size => mediaQuery.size;
  double get width => size.width;
  double get height => size.height;
  EdgeInsets get padding => mediaQuery.padding;
  Brightness get brightness => mediaQuery.platformBrightness;
  Orientation get orientation => mediaQuery.orientation;
}
