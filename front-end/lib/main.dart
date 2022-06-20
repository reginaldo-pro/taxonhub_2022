import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/app.dart';

void main() {
  return BlocOverrides.runZoned(
    () => runApp(const MyApp()),
  );
}
