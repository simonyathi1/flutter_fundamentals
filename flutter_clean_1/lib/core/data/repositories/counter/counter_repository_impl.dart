import 'package:flutter_clean_1/core/data/datasources/counter/counter_source.dart';
import 'package:flutter_clean_1/core/data/models/counter/counter_model.dart';
import 'package:flutter_clean_1/core/domain/entities/counter/counter_entity.dart';
import 'package:flutter_clean_1/core/domain/repositories/counter/counter_repository.dart';

class CounterRepositoryImpl extends CounterRepository {

  final CounterDataSource localDataSource;

  CounterRepositoryImpl({required this.localDataSource});

  @override
  CounterEntity getCounterEntity() {
    final counter = localDataSource.getCounter();
    return CounterEntity(counter.value);
  }

  @override
  void setCounterEntity(CounterEntity counterEntity) {
    final counter = CounterModel(counterEntity.value);
    localDataSource.setCounter(counter);
  }
}