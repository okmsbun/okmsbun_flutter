This package is a utility package designed to eliminate boilerplate code and facilitate a quick project setup.

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
  flutter_lints: ^3.0.1
....
```

## **ImageWidget**

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
        assetPath: 'assets/images/placeholder.(svg|jpg|png)',
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

## **Extensions**

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

### **DioResponseExtension**

DioResponseExtension converts dioResponse into Map in detail.

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
