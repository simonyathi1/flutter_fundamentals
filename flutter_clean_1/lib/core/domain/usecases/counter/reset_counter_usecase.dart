import 'package:flutter_clean_1/core/domain/entities/counter/counter_entity.dart';
import 'package:flutter_clean_1/core/domain/repositories/counter/counter_repository.dart';

class ResetCounterUseCase {
  final CounterRepository repository;

  ResetCounterUseCase(this.repository);

  void call() {
    repository.setCounterEntity(CounterEntity(0));
  }
}