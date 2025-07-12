import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:taskify/data/isar/model/task.dart';

import 'package:taskify/utils/enum/filter_type.dart';


class TaskService {
  late Future<Isar> db;

  TaskService() {
    db = _openDb();
  }

  Future<Isar> _openDb() async {
    final dir = await getApplicationDocumentsDirectory();
    return Isar.open(
      [TaskSchema],
      directory: dir.path,
    );
  }

Future<void> addTask(String title, String? subtitle) async {
  final isar = await db;
  final task = Task()
    ..title = title
    ..subtitle = subtitle
    ..isCompleted = false
    ..createdAt = DateTime.now();
    
  await isar.writeTxn(() => isar.tasks.put(task));
}


  Future<void> deleteTask(int id) async {
    final isar = await db;
    await isar.writeTxn(() => isar.tasks.delete(id));
  }

  Future<void> toggleTask(Task task) async {
    final isar = await db;
    await isar.writeTxn(() {
      task.isCompleted = !task.isCompleted;
      return isar.tasks.put(task);
    });
  }

  Stream<List<Task>> watchTasks({FilterType filter = FilterType.all}) async* {
  final isar = await db;

  if (filter == FilterType.active) {
    yield* isar.tasks
        .filter()
        .isCompletedEqualTo(false)
        .sortByCreatedAtDesc()
        .watch(fireImmediately: true);
  } else if (filter == FilterType.completed) {
    yield* isar.tasks
        .filter()
        .isCompletedEqualTo(true)
        .sortByCreatedAtDesc()
        .watch(fireImmediately: true);
  } else {
    yield* isar.tasks
        .where()
        .sortByCreatedAtDesc()
        .watch(fireImmediately: true);
  }
}

}
