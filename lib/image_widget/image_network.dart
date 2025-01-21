part of 'image_widget.dart';

class _ImageNetworkWidget extends StatelessWidget {
  const _ImageNetworkWidget({
    required this.imageUrl,
    required this.imageType,
    required this.boxFit,
    required this.httpHeaders,
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

  final String imageUrl;
  final ImageType imageType;
  final BoxFit boxFit;
  final Map<String, String>? httpHeaders;
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
        return SvgPicture.network(
          //?: implement errorBuilder
          //?: implement fade in and fade out duration
          //?: implement fade in and fade out curve
          imageUrl,
          fit: boxFit,
          headers: httpHeaders,
          placeholderBuilder: placeholderBuilder ??
              (defaultPlaceholder != null ? (_) => defaultPlaceholder! : null),
          height: height,
          width: width,
          colorFilter:
              color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        );
      case ImageType.other:
        final TargetPlatform platform = Theme.of(context).platform;
        final bool isCachedNetworkImage = platform == TargetPlatform.iOS ||
            platform == TargetPlatform.macOS ||
            platform == TargetPlatform.android;

        return isCachedNetworkImage
            ? CachedNetworkImage(
                imageUrl: imageUrl,
                fit: boxFit,
                httpHeaders: httpHeaders,
                placeholder: placeholderBuilder != null
                    ? (context, __) => placeholderBuilder!(context)
                    : defaultPlaceholder != null
                        ? (_, __) => defaultPlaceholder!
                        : null,
                errorWidget: errorBuilder != null
                    ? (context, __, ___) => errorBuilder!(context)
                    : defaultErrorWidget != null
                        ? (_, __, ___) => defaultErrorWidget!
                        : null,
                height: height,
                width: width,
                fadeInDuration: fadeInDuration,
                fadeOutDuration: fadeOutDuration,
                fadeInCurve: fadeInCurve,
                fadeOutCurve: fadeOutCurve,
                alignment: alignment,
              )
            : FadeInImage(
                image: NetworkImage(imageUrl, headers: httpHeaders),
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
