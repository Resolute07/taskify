import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskify/screens/task/bloc/taskify_home_bloc.dart';
import 'package:taskify/screens/task/widgets/task_card.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      buildWhen: (prev, curr) => curr is! TaskLoading,
      builder: (context, state) {
        if (state is TaskLoaded) {
          if (state.tasks.isEmpty) {
            return const Center(
              child: Text(
                'No tasks available',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }

          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: ListView.builder(
              key: ValueKey(state.tasks.length),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: state.tasks.length,
              itemBuilder: (_, index) => TaskCard(task: state.tasks[index]),
            ),
          );
        } else if (state is TaskLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text('Failed to load tasks'));
        }
      },
    );
  }
}
