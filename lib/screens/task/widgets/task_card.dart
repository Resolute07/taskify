import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskify/data/isar/model/task.dart';
import 'package:taskify/screens/task/bloc/taskify_home_bloc.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final isDone = task.isCompleted;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDone ? Colors.green.shade50 : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Text(
            task.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isDone ? Colors.green.shade700 : Colors.black87,
            ),
          ),

          
          if (task.subtitle?.isNotEmpty == true)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                task.subtitle!,
                style: TextStyle(
                  fontSize: 16,
                
                  color: isDone ? Colors.green : Colors.black,
                ),
              ),
            ),

          const SizedBox(height: 10),

          // Action buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(
                  isDone ? Icons.check_circle : Icons.radio_button_unchecked,
                  color: isDone ? Colors.green : Colors.grey,
                ),
                onPressed: () =>
                    context.read<TaskBloc>().add(ToggleTask(task)),
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () =>
                    context.read<TaskBloc>().add(DeleteTask(task)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
