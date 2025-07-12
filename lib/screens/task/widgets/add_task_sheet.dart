import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskify/screens/task/bloc/taskify_home_bloc.dart';

void showAddTaskSheet(BuildContext context) {
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    isScrollControlled: true,
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Task Title'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: subtitleController,
            decoration: const InputDecoration(labelText: 'Description'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final title = titleController.text.trim();
              final subtitle = subtitleController.text.trim();
              if (title.isNotEmpty) {
                context.read<TaskBloc>().add(AddTask(title, subtitle));
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
            ),
            child: const Text('Add Task'),
          ),
          const SizedBox(height: 12),
        ],
      ),
    ),
  );
}
