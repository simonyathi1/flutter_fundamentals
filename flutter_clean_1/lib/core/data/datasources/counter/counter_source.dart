import '../../models/counter/counter_model.dart';

abstract class CounterDataSource {
  CounterModel getCounter();
  void setCounter(CounterModel model);
}
