library image_widget;

import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

part 'image_asset.dart';
part 'image_enums.dart';
part 'image_memory.dart';
part 'image_network.dart';

final class ImageWidget extends StatelessWidget {
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
    );
  }

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
  });

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
    );
  }

  final ImageOrigin imageOrigin;
  final ImageType? imageType;
  final String? imageAddress;
  final BoxFit boxFit;
  final Map<String, String>? httpHeaders;
  final Widget Function(BuildContext)? placeholderBuilder;
  final double? height;
  final double? width;
  final Uint8List? bytes;
  //! It does not support all image types. It doesn't make any mistakes.
  final Widget Function(BuildContext)? errorBuilder;
  //! It does not support all image types. It doesn't make any mistakes.
  final Duration fadeInDuration;
  //! It does not support all image types. It doesn't make any mistakes.
  final Duration fadeOutDuration;
  //! It does not support all image types. It doesn't make any mistakes.
  final Curve fadeInCurve;
  //! It does not support all image types. It doesn't make any mistakes.
  final Curve fadeOutCurve;
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
        assert(imageAddress != null && imageType != null, 'Image address and type must not be nul');
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
        );
      case ImageOrigin.asset:
        assert(imageAddress != null && imageType != null, 'Image address and type must not be nul');
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
        );
    }
  }
}
