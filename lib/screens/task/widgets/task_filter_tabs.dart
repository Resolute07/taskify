import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskify/screens/task/bloc/taskify_home_bloc.dart';
import 'package:taskify/utils/enum/filter_type.dart';

class TaskFilterTabs extends StatelessWidget {
  const TaskFilterTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        final selected = state is TaskLoaded ? state.filter : FilterType.all;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: FilterType.values.map((filter) {
              final isSelected = filter == selected;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ChoiceChip(
                  label: Text(filter.label,style: TextStyle(color:isSelected? Colors.white :Colors.black),),
                  selected: isSelected,
                  selectedColor: Colors.deepPurple,
                  onSelected: (_) =>
                      context.read<TaskBloc>().add(SetFilter(filter)),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
