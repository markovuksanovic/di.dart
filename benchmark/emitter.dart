library score_emitter;

import 'package:benchmark_harness/benchmark_harness.dart';

class StdoutScoreEmitter implements ScoreEmitter {
  void emit(String name, double value) {
    print(value);
  }
}