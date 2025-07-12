part of 'taskify_home_bloc.dart';
abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object?> get props => [];
}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<Task> tasks;
  final FilterType filter;

  const TaskLoaded({required this.tasks, required this.filter});

  @override
  List<Object?> get props => [tasks, filter];
}

class TaskError extends TaskState {
  final String message;

  const TaskError(this.message);

  @override
  List<Object?> get props => [message];
}
