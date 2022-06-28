import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart' as t;

extension BuildContextUtils on BuildContext {
  t.T get T => t.T.of(this)!;

  MediaQueryData get mediaQuery => MediaQuery.of(this);
  MediaQueryData get mq => MediaQuery.of(this);

  ThemeData get theme => Theme.of(this);
}

extension StringUtils on String? {
  bool get isNotNull => this != null;

  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isNotEmptySafe => this != null && this!.isNotEmpty;
}

extension IterableUtils on Iterable? {
  bool get isNotNull => this != null;

  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isNotEmptySafe => this != null && this!.isNotEmpty;
}

extension ThemeDataUtils on ThemeData {
  bool get isCupertino =>
      platform == TargetPlatform.iOS || platform == TargetPlatform.macOS;

  bool get isMaterial => !isCupertino;
}

extension DynamicUtils on dynamic {
  T? cast<T>() => this is T ? this as T : null;
}
