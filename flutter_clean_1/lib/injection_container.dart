import 'package:flutter_clean_1/core/data/datasources/counter/counter_local_data_source.dart';
import 'package:flutter_clean_1/core/data/datasources/counter/counter_source.dart';
import 'package:flutter_clean_1/core/data/repositories/counter/counter_repository_impl.dart';
import 'package:flutter_clean_1/core/domain/repositories/counter/counter_repository.dart';
import 'package:flutter_clean_1/core/domain/usecases/counter/decrement_counter_usecase.dart';
import 'package:flutter_clean_1/core/domain/usecases/counter/get_counter_usecase.dart';
import 'package:flutter_clean_1/core/domain/usecases/counter/increment_counter_usecase.dart';
import 'package:flutter_clean_1/core/domain/usecases/counter/reset_counter_usecase.dart';
import 'package:flutter_clean_1/core/presentation/controllers/counter/counter_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  final box = await Hive.openBox('counterBox');

  serviceLocator.registerLazySingleton(() => box);
  serviceLocator.registerLazySingleton<CounterDataSource>(() => CounterLocalDataSource(box: serviceLocator()));
  serviceLocator.registerLazySingleton<CounterRepository>(() => CounterRepositoryImpl(localDataSource: serviceLocator()));

  serviceLocator.registerLazySingleton(() => GetCounterUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton(() => IncrementCounterUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton(() => DecrementCounterUseCase(serviceLocator()));
  serviceLocator.registerLazySingleton(() => ResetCounterUseCase(serviceLocator()));

  serviceLocator.registerLazySingleton(() =>
      CounterController(
          getCounterUseCase: serviceLocator(),
          incrementCounterUseCase: serviceLocator(),
          decrementCounterUseCase: serviceLocator(),
          resetCounterUseCase: serviceLocator()));
}