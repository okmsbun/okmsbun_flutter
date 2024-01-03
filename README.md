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
    ...
  )
```

### **numDurationExtension**

numDurationExtension is an extension that helps you to easily use Duration.
This extension is inspired by the [flutter_animate](https://github.com/gskinner/flutter_animate/blob/main/lib/src/extensions/num_duration_extensions.dart) package.

```dart
  Duration 1Microseconds = 1.microseconds;
  Duration 1Ms = 1.ms;
  Duration 1Milliseconds = 1.milliseconds;
  Duration 1Second = 1.seconds;
  Duration 1Minute = 1.minutes;
  Duration 1Hour = 1.hours;
  Duration 1Day = 1.days;
```
