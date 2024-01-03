part of 'image_widget.dart';

class _ImageMemoryWidget extends StatelessWidget {
  const _ImageMemoryWidget({
    required this.bytes,
    required this.boxFit,
    required this.placeholderBuilder,
    required this.defaultPlaceholder,
    required this.errorBuilder,
    required this.defaultErrorWidget,
    required this.height,
    required this.width,
    required this.fadeInDuration,
    required this.fadeOutDuration,
    required this.fadeInCurve,
    required this.fadeOutCurve,
  });

  final Uint8List bytes;
  final BoxFit boxFit;
  final Widget Function(BuildContext)? placeholderBuilder;
  final Widget? defaultPlaceholder;
  final Widget Function(BuildContext)? errorBuilder;
  final Widget? defaultErrorWidget;
  final double? height;
  final double? width;
  final Duration fadeInDuration;
  final Duration fadeOutDuration;
  final Curve fadeInCurve;
  final Curve fadeOutCurve;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      image: MemoryImage(bytes),
      height: height,
      width: width,
      fit: boxFit,
      placeholder: const AssetImage('xxx'),
      placeholderErrorBuilder: placeholderBuilder != null
          ? (context, __, ___) => placeholderBuilder!(context)
          : defaultPlaceholder != null
              ? (_, __, ___) => defaultPlaceholder!
              : null,
      imageErrorBuilder: errorBuilder != null
          ? (context, __, ___) => errorBuilder!(context)
          : defaultErrorWidget != null
              ? (_, __, ___) => defaultErrorWidget!
              : null,
      fadeInDuration: fadeInDuration,
      fadeOutDuration: fadeOutDuration,
      fadeInCurve: fadeInCurve,
      fadeOutCurve: fadeOutCurve,
    );
  }
}
