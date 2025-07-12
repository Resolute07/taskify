import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:taskify/dependency_init.dart';

import 'package:taskify/screens/app/taskify_app.dart';

final injector = GetIt.instance;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DependencyInitializer.initDependencies();

  runApp(const TaskifyApp());
}