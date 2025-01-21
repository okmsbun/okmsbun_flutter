part of 'context_extensions.dart';

/// Extension on [BuildContext] to get [ThemeData], [TextTheme] and [ColorScheme]
extension ContextThemeExtension on BuildContext {
  /// Get [ThemeData] from [BuildContext]
  /// ```dart
  /// final ThemeData themeData = context.themeData;
  /// ```
  ThemeData get themeData => Theme.of(this);

  /// Get [TextTheme] from [BuildContext]
  /// ```dart
  /// final TextTheme textTheme = context.textTheme;
  /// ```
  TextTheme get textTheme => themeData.textTheme;

  /// Get [ColorScheme] from [BuildContext]
  /// ```dart
  /// final ColorScheme colorScheme = context.colorScheme;
  /// ```
  ColorScheme get colorScheme => themeData.colorScheme;
}
