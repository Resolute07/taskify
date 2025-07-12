

import 'package:taskify/data/isar/model/task.dart';
import 'package:taskify/utils/enum/filter_type.dart';


abstract class TaskProvider {
  FilterType get filter;

  void setFilter(FilterType filter);

  Stream<List<Task>> get filteredTasks;
  

  Future<void> addTask(String title,String subtitle);

  Future<void> toggleTask(Task task);

  Future<void> deleteTask(int id);
}