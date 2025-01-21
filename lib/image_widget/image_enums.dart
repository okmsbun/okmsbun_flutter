part of 'image_widget.dart';

/// The `ImageOrigin` enum represents the origin of an image.
enum ImageOrigin {
  /// The image is from a network URL.
  network,

  /// The image is from an asset path.
  asset,

  /// The image is from bytes.
  memory;
}

/// The `ImageType` enum represents the type of an image.
enum ImageType {
  /// The image is a PNG image.
  svg,

  /// The image is a JPG image.
  other;
}
