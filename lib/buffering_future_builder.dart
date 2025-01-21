import 'package:flutter/material.dart';

/// A widget that builds itself based on the latest snapshot of interaction with
///  a [Future].
class BufferingFutureBuilder<T> extends StatelessWidget {
  /// Creates a new [BufferingFutureBuilder] that builds itself based on the
  const BufferingFutureBuilder({
    required this.future,
    this.progress = const CircularProgressIndicator(),
    this.errorWidget = const Icon(Icons.error),
    this.notFoundWidget = const Icon(Icons.not_interested),
    required this.builder,
    this.onLoadedData,
  });

  /// The asynchronous computation to which this builder is currently connected.
  final Future<T> Function() future;

  /// Widget to display when the future is loading.
  final Widget progress;

  /// Widget to display when the future has thrown an error.
  final Widget errorWidget;

  /// Widget to display when the future has no data.
  final Widget notFoundWidget;

  /// Widget to display when the future has data.
  final Widget Function(T? data) builder;

  /// Callback to be called when the future has data.
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
