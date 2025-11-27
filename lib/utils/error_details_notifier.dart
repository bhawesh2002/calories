import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorDetailsNotifier extends Notifier<FlutterErrorDetails?> {
  @override
  FlutterErrorDetails? build() => null;
  void errorDetected(FlutterErrorDetails details) => state = details;
  void errorResolved() => state = null;
}

final errorDetailsNotifierProvider =
    NotifierProvider<ErrorDetailsNotifier, FlutterErrorDetails?>(
      ErrorDetailsNotifier.new,
    );
