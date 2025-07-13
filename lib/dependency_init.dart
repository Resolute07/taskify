import 'package:taskify/main.dart';
import 'package:taskify/provider/base/task_provider.dart';
import 'package:taskify/provider/task_provider_impl.dart';


class DependencyInitializer {
  DependencyInitializer._();

  static void initDependencies() {
    injector
      // Providers
      .registerLazySingleton<TaskProvider>(TaskProviderImpl.new);
  }
}
