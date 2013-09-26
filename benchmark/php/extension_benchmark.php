<?php
require_once 'BenchmarkRunner.php';
require_once 'target/ExtensionBenchmarks.php';


$runner = new BenchmarkRunner('ExtensionBenchmarks');
$runner->run(0, 100000, 5000);


