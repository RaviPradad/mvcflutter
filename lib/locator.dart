import 'package:get_it/get_it.dart';
import 'package:mvcflutter/controller/data_controller.dart';

GetIt locator = GetIt.I;

void intilizeLocator() {
  locator.registerLazySingleton<DataController>(() => DataController());
}
