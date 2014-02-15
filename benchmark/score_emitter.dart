library score_emitter;

import 'package:benchmark_harness/benchmark_harness.dart';

class HttpScoreEmitter implements ScoreEmitter {
  HttpScoreEmitter() {}

  void emit(String name, double value) {
    print(value);
  }
}