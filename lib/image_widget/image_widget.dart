library;

import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

part 'image_asset.dart';
part 'image_enums.dart';
part 'image_memory.dart';
part 'image_network.dart';

/// The `ImageWidget` class is a widget
/// that displays an image from a network URL, asset path, or bytes.
/// The widget supports displaying images of type `png`, `jpg`, `jpeg`, and `svg`.
/// The widget also supports customizing the image's box fit, placeholder, error, height, width, and fade in/out animations.
final class ImageWidget extends StatelessWidget {
  const ImageWidget._({
    required this.imageOrigin,
    this.imageType,
    this.imageAddress,
    this.boxFit = BoxFit.cover,
    this.httpHeaders,
    this.placeholderBuilder,
    this.errorBuilder,
    this.height,
    this.width,
    this.bytes,
    required this.fadeInDuration,
    required this.fadeOutDuration,
    required this.fadeInCurve,
    required this.fadeOutCurve,
    this.color,
    this.alignment = Alignment.center,
  });

  /// The `ImageWidget.bytes` factory method creates an `ImageWidget` instance with the provided path,
  /// bytes, box fit, placeholder builder, error builder, height, and width.
  ///
  /// Returns:
  ///   The method is returning an instance of the `ImageWidget` class.
  factory ImageWidget.bytes({
    required Uint8List bytes,
    BoxFit boxFit = BoxFit.cover,
    Widget Function(BuildContext)? placeholderBuilder,
    Widget Function(BuildContext)? errorBuilder,
    double? height,
    double? width,
    Duration fadeInDuration = _defaultFadeInDuration,
    Duration fadeOutDuration = _defaultFadeOutDuration,
    Curve fadeInCurve = Curves.easeIn,
    Curve fadeOutCurve = Curves.easeOut,
    Alignment alignment = Alignment.center,
  }) {
    return ImageWidget._(
      imageOrigin: ImageOrigin.memory,
      boxFit: boxFit,
      placeholderBuilder: placeholderBuilder,
      errorBuilder: errorBuilder,
      height: height,
      width: width,
      bytes: bytes,
      fadeInDuration: fadeInDuration,
      fadeOutDuration: fadeOutDuration,
      fadeInCurve: fadeInCurve,
      fadeOutCurve: fadeOutCurve,
      alignment: alignment,
    );
  }

  /// The `ImageWidget.asset` factory method creates an `ImageWidget` instance for displaying an image
  /// from an asset path, with optional customization options.
  ///
  /// Returns:
  ///   The `factory` method `ImageWidget.asset` is returning an instance of the `ImageWidget` class.
  factory ImageWidget.asset({
    required String assetPath,
    BoxFit boxFit = BoxFit.cover,
    Widget Function(BuildContext)? placeholderBuilder,
    Widget Function(BuildContext)? errorBuilder,
    double? height,
    double? width,
    Duration fadeInDuration = _defaultFadeInDuration,
    Duration fadeOutDuration = _defaultFadeOutDuration,
    Curve fadeInCurve = Curves.easeIn,
    Curve fadeOutCurve = Curves.easeOut,
    Color? color,
    Alignment alignment = Alignment.center,
  }) {
    return ImageWidget._(
      imageOrigin: ImageOrigin.asset,
      imageType: assetPath.endsWith('.svg') ? ImageType.svg : ImageType.other,
      imageAddress: assetPath,
      boxFit: boxFit,
      placeholderBuilder: placeholderBuilder,
      errorBuilder: errorBuilder,
      height: height,
      width: width,
      fadeInDuration: fadeInDuration,
      fadeOutDuration: fadeOutDuration,
      fadeInCurve: fadeInCurve,
      fadeOutCurve: fadeOutCurve,
      color: color,
      alignment: alignment,
    );
  }

  /// The `ImageWidget.network` factory method creates an `ImageWidget` instance for displaying an image
  /// from a network URL, with optional customization options.
  ///
  /// Returns:
  ///   The `ImageWidget` object is being returned.
  factory ImageWidget.network({
    required String imageUrl,
    BoxFit boxFit = BoxFit.cover,
    Map<String, String>? httpHeaders,
    Widget Function(BuildContext)? placeholderBuilder,
    Widget Function(BuildContext)? errorBuilder,
    double? height,
    double? width,
    Duration fadeInDuration = _defaultFadeInDuration,
    Duration fadeOutDuration = _defaultFadeOutDuration,
    Curve fadeInCurve = Curves.easeIn,
    Curve fadeOutCurve = Curves.easeOut,
    Color? color,
    Alignment alignment = Alignment.center,
  }) {
    return ImageWidget._(
      imageOrigin: ImageOrigin.network,
      imageType: imageUrl.endsWith('.svg') ? ImageType.svg : ImageType.other,
      imageAddress: imageUrl,
      boxFit: boxFit,
      httpHeaders: httpHeaders,
      placeholderBuilder: placeholderBuilder,
      errorBuilder: errorBuilder,
      height: height,
      width: width,
      fadeInDuration: fadeInDuration,
      fadeOutDuration: fadeOutDuration,
      fadeInCurve: fadeInCurve,
      fadeOutCurve: fadeOutCurve,
      color: color,
      alignment: alignment,
    );
  }

  /// The `imageOrigin` property is the origin of the image being displayed.
  final ImageOrigin imageOrigin;

  /// The `imageType` property is the type of image being displayed.
  final ImageType? imageType;

  /// The `imageAddress` property is the path to the image being displayed.
  final String? imageAddress;

  /// The `boxFit` property is the fit of the image within the widget.
  final BoxFit boxFit;

  /// The `httpHeaders` property is the headers for the network request.
  final Map<String, String>? httpHeaders;

  /// The `placeholderBuilder` property is the builder for the placeholder widget.
  final Widget Function(BuildContext)? placeholderBuilder;

  /// The `height` property is the height of the image widget.
  final double? height;

  /// The `width` property is the width of the image widget.
  final double? width;

  /// The `bytes` property is the bytes of the image being displayed.
  final Uint8List? bytes;

  /// The `alignment` property is the alignment of the image within the widget.
  final Alignment alignment;

  /// The `errorBuilder` property is the builder for the error widget.
  //! It does not support all image types. It doesn't make any mistakes.
  final Widget Function(BuildContext)? errorBuilder;

  /// The `fadeInDuration` property is the duration of the fade in animation.
  //! It does not support all image types. It doesn't make any mistakes.
  final Duration fadeInDuration;

  /// The `fadeOutDuration` property is the duration of the fade out animation.
  //! It does not support all image types. It doesn't make any mistakes.
  final Duration fadeOutDuration;

  /// The `fadeInCurve` property is the curve of the fade in animation.
  //! It does not support all image types. It doesn't make any mistakes.
  final Curve fadeInCurve;

  /// The `fadeOutCurve` property is the curve of the fade out animation.
  //! It does not support all image types. It doesn't make any mistakes.
  final Curve fadeOutCurve;

  /// The `color` property is the color of the image.
  //! It does not support all image types. It doesn't make any mistakes.
  final Color? color;

  static const Duration _defaultFadeInDuration = Duration(milliseconds: 500);
  static const Duration _defaultFadeOutDuration = Duration(milliseconds: 700);
  static const Widget _defaultPlaceholder = SizedBox.shrink();
  static const Widget _defaultErrorWidget = Icon(Icons.image_not_supported);

  @override
  Widget build(BuildContext context) {
    if (imageAddress?.isEmpty ?? false) return const SizedBox.shrink();

    switch (imageOrigin) {
      case ImageOrigin.network:
        assert(
          imageAddress != null && imageType != null,
          'Image address and type must not be nul',
        );
        return _ImageNetworkWidget(
          imageUrl: imageAddress!,
          imageType: imageType!,
          boxFit: boxFit,
          httpHeaders: httpHeaders,
          placeholderBuilder: placeholderBuilder,
          defaultPlaceholder: _defaultPlaceholder,
          errorBuilder: errorBuilder,
          defaultErrorWidget: _defaultErrorWidget,
          height: height,
          width: width,
          fadeInDuration: fadeInDuration,
          fadeOutDuration: fadeOutDuration,
          fadeInCurve: fadeInCurve,
          fadeOutCurve: fadeOutCurve,
          color: color,
          alignment: alignment,
        );
      case ImageOrigin.asset:
        assert(
          imageAddress != null && imageType != null,
          'Image address and type must not be nul',
        );
        return _ImageAssetWidget(
          assetPath: imageAddress!,
          imageType: imageType!,
          boxFit: boxFit,
          placeholderBuilder: placeholderBuilder,
          defaultPlaceholder: _defaultPlaceholder,
          errorBuilder: errorBuilder,
          defaultErrorWidget: _defaultErrorWidget,
          height: height,
          width: width,
          fadeInDuration: fadeInDuration,
          fadeOutDuration: fadeOutDuration,
          fadeInCurve: fadeInCurve,
          fadeOutCurve: fadeOutCurve,
          color: color,
          alignment: alignment,
        );
      case ImageOrigin.memory:
        assert(bytes != null, 'Bytes must not be null');
        return _ImageMemoryWidget(
          bytes: bytes!,
          boxFit: boxFit,
          placeholderBuilder: placeholderBuilder,
          defaultPlaceholder: _defaultPlaceholder,
          errorBuilder: errorBuilder,
          defaultErrorWidget: _defaultErrorWidget,
          height: height,
          width: width,
          fadeInDuration: fadeInDuration,
          fadeOutDuration: fadeOutDuration,
          fadeInCurve: fadeInCurve,
          fadeOutCurve: fadeOutCurve,
          alignment: alignment,
        );
    }
  }
}
