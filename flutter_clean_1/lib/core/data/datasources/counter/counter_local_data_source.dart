import 'package:flutter_clean_1/core/data/datasources/counter/counter_source.dart';
import 'package:flutter_clean_1/core/data/models/counter/counter_model.dart';
import 'package:hive/hive.dart';

class CounterLocalDataSource implements CounterDataSource {
  final Box box;

  CounterLocalDataSource({required this.box});

  @override
  CounterModel getCounter() {
    final value = box.get('counter', defaultValue: 0);
    return CounterModel(value);
  }

  @override
  void setCounter(CounterModel counter) {
    box.put('counter', counter.value);
  }
}