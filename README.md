This package is a utility package designed to eliminate boilerplate code and facilitate a quick project setup.

# **Table of Contents**

- [**Getting Started**](#getting-started)
- [**Usage**](#usage)
  - [**Adding Lint Rules**](#adding-lint-rules)
  - [**ImageWidget**](#imagewidget)
  - [**BufferingFutureBuilder**](#bufferingfuturebuilder)
  - [**EstimatedAppBar**](#estimatedappbar)
    - [**EstimatedAppBar**](#estimatedappbar-1)
    - [**EstimatedAppBarContainer**](#estimatedappbarcontainer)
  - [**Extensions**](#extensions)
    - [**DioExtension**](#dioextension)
    - [**NumDurationExtension**](#numdurationextension)
    - [**ContextThemeExtension**](#contextthemeextension)
    - [**ContextMediaQueryExtension**](#contextmediaqueryextension)

# **Getting Started**

Add the following line to your package's `pubspec.yaml` file:

```yaml
....
dependencies:
  okmsbun_flutter: latest
....
```

# **Usage**

## **Adding Lint Rules**

If you want stricter, more precise, and clear lint rules, you can include the following lint rules. You can access all of these lint rules [here](https://dart.dev/tools/linter-rules/all).

Add the following line to your package's `analysis_options.yaml` file:

```yaml
include: package:okmsbun_flutter/okmsbun_flutter_lints.yaml
```

And the following line to your package's `pubspec.yaml` file:

```yaml
....
dev_dependencies:
  flutter_lints: latest
....
```

## **ImageWidget**

ImageWigdet was made using the [cached_network_image](https://pub.dev/packages/cached_network_image) and [flutter_svg](https://pub.dev/packages/flutter_svg) packages.

'Image Widget' is a widget that aims to display images with extensions such as svg and other (jpg, png ...) from a single widget.

```dart
    ImageWidget.network(
        imageUrl: 'https://network-image.(svg|jpg|png...)',
        boxFit: BoxFit.cover,
        height: 300,
        ...
      )

    ImageWidget.asset(
        assetPath: 'assets/image.(svg|jpg|png...)',
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

## **BufferingFutureBuilder**

BufferingFutureBuilder is a widget that helps show old data instead of progress when a new request is made or data changes while using FutureBuilder. As soon as new data arrives, it replaces old data with new data.

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

## **EstimatedAppBar**

### **EstimatedAppBar**

This widget returns an empty appBar, which only has a background color and no other properties, and consists of an empty container that you can edit as you wish. This appBar automatically corrects the 'statusBarColor', 'statusBarBrightness', 'statusBarIconBrightness', 'systemStatusBarContrastEnforced' values. In this way, it aims to ensure the readability of the texts and icons in the status bar.

```dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EstimatedAppBar(
        backgroundColor: Colors.black || Colors.white,
        child: Container(
          color: Colors.black,
          child: const FlutterLogo(size: 50),
        ),
      ),
    );
  }
```

<img width="382" alt="Screenshot 2024-01-05 at 17 12 51" src="https://github.com/okmsbun/okmsbun_flutter/assets/49310621/1188311d-51d6-48d1-8e1e-0d8668d19a9c"> Black Background

<img width="373" alt="Screenshot 2024-01-05 at 17 13 37" src="https://github.com/okmsbun/okmsbun_flutter/assets/49310621/f0364033-fcaa-4838-a05d-49b1ad4d40de"> White Background

Only when the background color is changed, the text and icon colors in the 'statusBar' change automatically.

### **EstimatedAppBarContainer**

'EstimatedAppBar' is a 'PreferredSizeWidget'. If you want to make your own 'PreferredSizeWidget' you can use 'EstimatedAppBarContainer'.

```dart
class MyEstimatedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyEstimatedAppBar({required this.backgroundColor, required this.child});

  final Color backgroundColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return EstimatedAppBarContainer(
      backgroundColor: backgroundColor,
      child: child,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
```

## **Extensions**

### **DioExtension**

DioResponseExtension converts dioResponse object into Map in detail.Just do 'response.**toMap**'.

```dart
final Response response = await Dio().get('https://pokeapi.co/api/v2/pokemon?limit=1');
final Map<String, dynamic> responseMap = response.toMap;
final String responseEncode = jsonEncode(responseMap);
print(responseEncode);
```

The output of the above code is as follows

```json
{
  "data": {
    "count": 1302,
    "next": "https://pokeapi.co/api/v2/pokemon?offset=1&limit=1",
    "previous": null,
    "results": [
      {
        "name": "bulbasaur",
        "url": "https://pokeapi.co/api/v2/pokemon/1/"
      }
    ]
  },
  "requestOptions": {
    "method": "GET",
    "sendTimeout": null,
    "receiveTimeout": null,
    "connectTimeout": null,
    "data": null,
    "path": "https://pokeapi.co/api/v2/pokemon?limit=1",
    "baseUrl": "",
    "queryParameters": {},
    "onReceiveProgress": null,
    "onSendProgress": null,
    "cancelToken": null,
    "extra": {},
    "headers": {},
    "preserveHeaderCase": false,
    "responseType": "json",
    "receiveDataWhenStatusError": true,
    "followRedirects": true,
    "maxRedirects": 5,
    "persistentConnection": true,
    "requestEncoder": null,
    "responseDecoder": null,
    "listFormat": "multi"
  },
  "statusCode": 200,
  "statusMessage": "OK",
  "isRedirect": false,
  "redirects": [],
  "extra": {},
  "headers": {
    "preserveHeaderCase": false,
    "map": {
      "x-timer": ["S1703133027.794235,VS0,VE1"],
      "date": ["Thu, 04 Jan 2024 11:07:34 GMT"],
      "content-encoding": ["gzip"],
      ...
    }
  }
}
```

You can also convert the 'DioException' object to 'Map' in the same way.

```dart
...
} on DioException catch (e) {
  print(jsonEncode(e.toMap));
} catch (e) {
...
```

It will give the same detailed output as the response object above.

### **NumDurationExtension**

NumDurationExtension is an extension that helps you to easily use Duration.
This extension is inspired by the [flutter_animate](https://github.com/gskinner/flutter_animate/blob/main/lib/src/extensions/num_duration_extensions.dart) package.

```dart
  final Duration 1Microseconds = 1.microseconds;
  final Duration 1Ms = 1.ms;
  final Duration 1Milliseconds = 1.milliseconds;
  final Duration 1Second = 1.seconds;
  final Duration 1Minute = 1.minutes;
  final Duration 1Hour = 1.hours;
  final Duration 1Day = 1.days;
```

### **ContextThemeExtension**

ContextThemeExtension is an extension that helps you to easily use ThemeData, TextTheme, and ColorScheme.

```dart
  final ThemeData theme = context.theme;
  final TextTheme textTheme = context.textTheme;
  final ColorScheme colorScheme = context.colorScheme;
```

### **ContextMediaQueryExtension**

ContextMediaQueryExtension is an extension that helps you to easily use MediaQuery.

```dart
  final MediaQueryData mediaQuery = context.mediaQuery;
  final Size appSize = context.appSize;
  final double width = context.width;
  final double height = context.height;
  final EdgeInsets padding = context.padding;
  final Brightness brightness = context.brightness;
  final Orientation orientation = context.orientation;
```
