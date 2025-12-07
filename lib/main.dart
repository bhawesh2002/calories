import 'dart:async';

import 'package:calories/data/services/storage_service.dart';
import 'package:calories/l10n/app_localizations.dart';
import 'package:calories/utils/app_router.dart';
import 'package:calories/utils/error_details_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer' as developer;

void main() async {
  final ProviderContainer providerContainer = ProviderContainer();

  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      FlutterError.onError = (details) {
        providerContainer
            .read(errorDetailsNotifierProvider.notifier)
            .errorDetected(details);
      };
      await StorageService.setup();
      runApp(ProviderScope(child: const MainApp()));
    },
    (error, stack) {
      logUnhandledErrors(error, stack);
    },
  );
}

void logUnhandledErrors(error, stack) {
  developer.log("UnhandledError", error: error, stackTrace: stack);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Inter'),
      locale: Locale('en'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routes: AppRoutes.routesMap,
      initialRoute: AppRoutes.splash,
    );
  }
}
