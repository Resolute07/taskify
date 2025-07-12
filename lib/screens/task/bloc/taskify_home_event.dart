part of 'taskify_home_bloc.dart';



abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

class LoadTasks extends TaskEvent {}

class AddTask extends TaskEvent {
  final String title;
  final String subTitle;
  const AddTask(this.title , this.subTitle);

  @override
  List<Object?> get props => [title];
}

class ToggleTask extends TaskEvent {
  final Task task;
  const ToggleTask(this.task);

  @override
  List<Object?> get props => [task];
}

class DeleteTask extends TaskEvent {
  final Task task;
  const DeleteTask(this.task);

  @override
  List<Object?> get props => [task];
}

class SetFilter extends TaskEvent {
  final FilterType filter;
  const SetFilter(this.filter);

  @override
  List<Object?> get props => [filter];
}
