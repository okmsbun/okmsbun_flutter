part of 'context_extensions.dart';

extension ContextMediaQueryExtensions on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get appSize => mediaQuery.size;
  double get width => appSize.width;
  double get height => appSize.height;
  EdgeInsets get padding => mediaQuery.padding;
  Brightness get brightness => mediaQuery.platformBrightness;
  Orientation get orientation => mediaQuery.orientation;
}
