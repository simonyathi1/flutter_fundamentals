import 'package:flutter_clean_1/core/domain/entities/counter/counter_entity.dart';

abstract class CounterRepository {
  CounterEntity getCounterEntity();
  void setCounterEntity(CounterEntity counterEntity);
}