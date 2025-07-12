import 'package:taskify/data/isar/model/task.dart';
import 'package:taskify/provider/base/task_provider.dart';
import 'package:taskify/service/task_service.dart';
import 'package:taskify/utils/enum/filter_type.dart';

class TaskProviderImpl  implements TaskProvider {
  final TaskService _service = TaskService();
  
  FilterType _filter = FilterType.all;

  @override
  FilterType get filter => _filter;

  @override
  void setFilter(FilterType filter) {
    _filter = filter;
    
  }

  @override
  Stream<List<Task>> get filteredTasks {
    return _service.watchTasks(filter: _filter);
  }

  @override
  Future<void> addTask(String title,String subtitle) async {
    if (title.trim().isEmpty) return;
    await _service.addTask(title,subtitle);
  }

  @override
  Future<void> toggleTask(Task task) async {
    await _service.toggleTask(task);
  }

  @override
  Future<void> deleteTask(int id) async {
    await _service.deleteTask(id);
  }
}
