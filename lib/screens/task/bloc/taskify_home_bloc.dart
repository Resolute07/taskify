import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taskify/data/isar/model/task.dart';
import 'package:taskify/main.dart';
import 'package:taskify/provider/base/task_provider.dart';
import 'package:taskify/utils/enum/filter_type.dart';


part 'taskify_home_event.dart';
part 'taskify_home_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final provider = injector<TaskProvider>();


 TaskBloc() : super(TaskLoading()) {
  on<LoadTasks>(_onLoadTasks);
  on<AddTask>(_onAddTask);
  on<ToggleTask>(_onToggleTask);
  on<DeleteTask>(_onDeleteTask);
  on<SetFilter>(_onSetFilter);

  add(LoadTasks()); // <-- This ensures tasks are loaded initially
}


  void _onLoadTasks(LoadTasks event, Emitter<TaskState> emit) async {
    emit(TaskLoading());
    await emit.forEach<List<Task>>(
      provider.filteredTasks,
      onData: (tasks) => TaskLoaded(tasks: tasks, filter: provider.filter),
    );
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) async {
    await provider.addTask(event.title , event.subTitle);
    add(LoadTasks());
  }

  void _onToggleTask(ToggleTask event, Emitter<TaskState> emit) async {
    await provider.toggleTask(event.task);
    add(LoadTasks());
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) async {
    await provider.deleteTask(event.task.id);
    add(LoadTasks());
  }

  void _onSetFilter(SetFilter event, Emitter<TaskState> emit) async {
    provider.setFilter(event.filter);
    add(LoadTasks());
  }
}
