import 'package:bloc_sqflite_caching_data/core/di/dependency_injection.dart';
import 'package:bloc_sqflite_caching_data/core/helper/bloc_observer.dart';
import 'package:bloc_sqflite_caching_data/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  initGetIt();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

