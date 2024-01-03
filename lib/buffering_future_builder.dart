import 'package:flutter/material.dart';

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
}
