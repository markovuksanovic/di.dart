#!/bin/sh 
set -e

MODULE_BENCHMARK_URL="https://glowing-fire-326.firebaseio.com:443/di/moduleInjector.json"
STATIC_INJECTOR_URL="https://glowing-fire-326.firebaseio.com:443/di/staticInjector.json"
DYNAMIC_INJECTOR_URL="https://glowing-fire-326.firebaseio.com:443/di/dynamicInjector.json"
# run tests in dart
dart benchmark/module_benchmark.dart $MODULE_BENCHMARK_URL
dart benchmark/dynamic_injector_benchmark.dart $DYNAMIC_INJECTOR_URL
dart benchmark/static_injector_benchmark.dart $STATIC_INJECTOR_URL

# run dart2js on tests
mkdir -p out
dart2js benchmark/module_benchmark.dart --categories=Server -o out/module_benchmark.dart.js
dart2js benchmark/static_injector_benchmark.dart  --categories=Server -o out/static_injector_benchmark.dart.js
dart2js benchmark/dynamic_injector_benchmark.dart  --categories=Server -o out/dynamic_injector_benchmark.dart.js 

# run tests in node
OUT=$(node out/module_benchmark.dart.js)
echo "Output: " $OUT
curl -X POST -d "{\"value\":$OUT}" $MODULE_BENCHMARK_URL 
OUT=$(node out/dynamic_injector_benchmark.dart.js)
echo "Output: " "{\"value\":$OUT}"
curl -X POST -d "{\"value\":$OUT}" $MODULE_BENCHMARK_URL 
OUT=$(node out/static_injector_benchmark.dart.js)
echo "Output: " $OUT
curl -X POST -d "{\"value\":$OUT}" $MODULE_BENCHMARK_URL 
