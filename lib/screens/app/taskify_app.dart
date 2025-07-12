import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:taskify/screens/task/bloc/taskify_home_bloc.dart';
import 'package:taskify/screens/task/taskify_home_page.dart';

class TaskifyApp extends StatelessWidget {
  const TaskifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<TaskBloc>(create: (context) => TaskBloc())],
      child: MaterialApp(
        title: 'Taskify',
        theme: ThemeData(primarySwatch: Colors.indigo, useMaterial3: true),
        home: const TaskifyHomePage(),
      ),
    );
  }
}
