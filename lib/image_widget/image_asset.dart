part of 'image_widget.dart';

class _ImageAssetWidget extends StatelessWidget {
  const _ImageAssetWidget({
    required this.assetPath,
    required this.imageType,
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
    required this.color,
    required this.alignment,
  });

  final String assetPath;
  final ImageType imageType;
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
  final Color? color;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    switch (imageType) {
      case ImageType.svg:
        return SvgPicture.asset(
          //?: implement errorBuilder
          //?: implement fade in and fade out duration
          //?: implement fade in and fade out curve
          assetPath,
          fit: boxFit,
          placeholderBuilder: placeholderBuilder ??
              (defaultPlaceholder != null ? (_) => defaultPlaceholder! : null),
          height: height,
          width: width,
          colorFilter:
              color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
          alignment: alignment,
        );
      case ImageType.other:
        return FadeInImage(
          image: AssetImage(assetPath),
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
          alignment: alignment,
        );
    }
  }
}
