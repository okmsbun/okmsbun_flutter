# Okmsbun Flutter Util Package

This package is a utility package designed to eliminate boilerplate code and facilitate a quick project setup.

## Usage

### Adding Lint Rules

If you want stricter, more precise, and clear lint rules, you can include the following lint rules. You can access all of these lint rules [here](https://dart.dev/tools/linter-rules/all).

Add the following line to your package's `analysis_options.yaml` file:

```yaml
include: package:okmsbun_flutter/okmsbun_flutter_lints.yaml
```

And the following line to your package's `pubspec.yaml` file:

```yaml
....
dependencies:
  flutter_lints: ^3.0.1
....
```

### ImageWidget

ImageWigdet was made using the 'https://pub.dev/packages/cached_network_image' and 'https://pub.dev/packages/flutter_svg' packages.

'Image Widget' is a widget that aims to display images with extensions such as svg and other (jpg, png ...) from a single widget.

```dart
    ImageWidget.network(
        imageUrl: 'https://picsum.photos/200/300',
        boxFit: BoxFit.cover,
        height: 300,
        width: 200,
      ),

    ImageWidget.asset(
        assetPath: 'assets/images/placeholder.png',
        boxFit: BoxFit.cover,
        height: 300,
        width: 200,
      ),

    ImageWidget.bytes(
        bytes: bytes,
        boxFit: BoxFit.cover,
        height: 300,
        width: 200,
      ),
```

#### ImageWidget parameters

| Parameter          | Type                          | Description         | Default                     |
| :----------------- | :---------------------------- | :------------------ | :-------------------------- |
| imageAddress       | String                        | Image address       | null                        |
| boxFit             | BoxFit                        | Image fit           | BoxFit.cover                |
| httpHeaders        | Map<String, String>           | Http headers        | null                        |
| placeholderBuilder | Widget Function(BuildContext) | Placeholder builder | null                        |
| height             | double                        | Image height        | null                        |
| width              | double                        | Image width         | null                        |
| bytes              | Uint8List                     | Image bytes         | null                        |
| errorBuilder       | Widget Function(BuildContext) | Error builder       | null                        |
| fadeInDuration     | Duration                      | Fade in duration    | Duration(milliseconds: 500) |
| fadeOutDuration    | Duration                      | Fade out duration   | Duration(milliseconds: 500) |
| fadeInCurve        | Curve                         | Fade in curve       | Curves.easeIn               |
| fadeOutCurve       | Curve                         | Fade out curve      | Curves.easeOut              |
| color              | Color                         | Image color         | null                        |
