# Okmsbun Flutter Util Package

This package is a utility package designed to eliminate boilerplate code and facilitate a quick project setup.

## Usage

### **Adding Lint Rules**

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

### **ImageWidget**

ImageWigdet was made using the [cached_network_image](https://pub.dev/packages/cached_network_image) and [flutter_svg](https://pub.dev/packages/flutter_svg) packages.

'Image Widget' is a widget that aims to display images with extensions such as svg and other (jpg, png ...) from a single widget.

```dart
    ImageWidget.network(
        imageUrl: 'https://picsum.photos/200/300',
        boxFit: BoxFit.cover,
        height: 300,
        ...
      )

    ImageWidget.asset(
        assetPath: 'assets/images/placeholder.png',
        boxFit: BoxFit.cover,
        height: 300,
        ...
      )

    ImageWidget.bytes(
        bytes: bytes,
        boxFit: BoxFit.cover,
        height: 300,
        ...
      )
```

<!-- import 'package:flutter/material.dart';

class BufferingFutureBuilder<T> extends StatelessWidget {
  const BufferingFutureBuilder({
    required this.future,
    this.progress = const CircularProgressIndicator(),
    this.errorWidget = const Icon(Icons.error),
    this.notFoundWidget = const Icon(Icons.not_interested),
    required this.builder,
    this.onLoadedData,
  });

  final Future<T> Function() future;
  final Widget progress;
  final Widget errorWidget;
  final Widget notFoundWidget;
  final Widget Function(T? data) builder;
  final T? onLoadedData;

  Future<T> get _futureFunction => future();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: _futureFunction,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return onLoadedData == null ? progress : builder(onLoadedData);
          case ConnectionState.done:
            if (snapshot.hasError) return errorWidget;
            if (snapshot.hasData) return builder(snapshot.data);
            return notFoundWidget;
          case ConnectionState.none:
            return errorWidget;
          case ConnectionState.active:
            return errorWidget;
        }
      },
    );
  }
} -->

### **BufferingFutureBuilder**

BufferingFutureBuilder is a widget that helps show old data instead of progress when a new request is made or data changes while using FutureBuilder.

```dart
BufferingFutureBuilder<String>(
    future: () async {
      await Future.delayed(const Duration(seconds: 3));
      return 'Hello World from Future';
    },
    builder: (data) => Text(data ?? ''),
    onLoadedData: 'Hello World from onLoadedData',
  )
```
