/// From 'flutter_animate' package
/// https://github.com/gskinner/flutter_animate/blob/main/lib/src/extensions/num_duration_extensions.dart
extension NumDurationExtensions on num {
  /// Rounds the number to the nearest integer.
  Duration get microseconds => Duration(microseconds: round());

  /// Converts the number to milliseconds.
  Duration get ms => (this * 1000).microseconds;

  /// Converts the number to seconds.
  Duration get milliseconds => (this * 1000).microseconds;

  /// Converts the number to seconds.
  Duration get seconds => (this * 1000 * 1000).microseconds;

  /// Converts the number to minutes.
  Duration get minutes => (this * 1000 * 1000 * 60).microseconds;

  /// Converts the number to hours.
  Duration get hours => (this * 1000 * 1000 * 60 * 60).microseconds;

  /// Converts the number to days.
  Duration get days => (this * 1000 * 1000 * 60 * 60 * 24).microseconds;
}
