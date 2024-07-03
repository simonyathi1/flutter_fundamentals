import 'package:flutter_clean_1/core/domain/entities/counter/counter_entity.dart';
import 'package:flutter_clean_1/core/domain/repositories/counter/counter_repository.dart';

class DecrementCounterUseCase {
  final CounterRepository repository;

  DecrementCounterUseCase(this.repository);

  void call() {
    final currentCounter = repository.getCounterEntity();
    repository.setCounterEntity(CounterEntity(currentCounter.value - 1));
  }
}