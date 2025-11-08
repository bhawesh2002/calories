import 'package:calories/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension AppLocale on State {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;
}

extension DeviceDimensions on BuildContext {
  double get deviceWt => MediaQuery.sizeOf(this).width;
  double get deviceHt => MediaQuery.sizeOf(this).height;
  double get viewPaddingBottom => MediaQuery.viewPaddingOf(this).bottom;
  double get viewPaddingTop => MediaQuery.viewPaddingOf(this).top;
  double get viewInsetsBottom => MediaQuery.viewInsetsOf(this).bottom;
  EdgeInsets get deviceInsets =>
      EdgeInsets.only(bottom: viewInsetsBottom, top: viewPaddingTop);
}

extension DevicePadding on BuildContext {
  Padding devicePadding(
    BuildContext context, {
    required Widget child,
    double bottom = 12,
    double top = 12,
    double left = 16,
    double right = 16,
  }) => Padding(
    padding:
        deviceInsets +
        EdgeInsets.only(bottom: bottom, top: top, left: left, right: right),
    child: child,
  );
}
