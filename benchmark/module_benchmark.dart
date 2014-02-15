import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:di/di.dart';

import 'injector_benchmark_common.dart';
import 'score_emitter.dart';

class ModuleBenchmark extends BenchmarkBase {
  var injectorFactory;

  ModuleBenchmark(ScoreEmitter emitter) : super('ModuleBenchmark',
      emitter: emitter);

  void run() {
    var m = new Module()
      ..type(A)
      ..type(B)
      ..type(C)
      ..type(D)
      ..type(E);
  }
}

main(List<String> args) {
  ScoreEmitter emitter = new HttpScoreEmitter();
  new ModuleBenchmark(emitter).report();
}