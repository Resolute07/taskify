import 'package:taskify/main.dart';
import 'package:taskify/provider/task_provider_impl.dart';


class DependencyInitializer {
  DependencyInitializer._();

  static void initDependencies() {
    injector
      // Providers
      .registerLazySingleton<TaskProviderImpl>(TaskProviderImpl.new);
  }
}
