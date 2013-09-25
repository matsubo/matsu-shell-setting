<?php
/**
 * Simple PHP Benchmarking class
 * @author Daniel15 <dan.cx>
 */
class BenchmarkRunner
{
    private $className;

    public function __construct($className)
    {
        $this->className = $className;
    }

    /**
     * Run the benchmark
     * @param int Minimum number of iterations
     * @param int Maximum number of iterations
     * @param int Amount to increment by on each test.
     */
    public function run($min, $max, $increment)
    {
        $class = new $this->className;
        // Let's use reflection to see the public methods inside it
        $classInfo = new ReflectionClass($this->className);
        $methods = $classInfo->getMethods(ReflectionMethod::IS_PUBLIC);

        // Output the header
        echo "Benchmark\t";
        for ($i = $min; $i < $max; $i += $increment)
        {
            echo $i, "\t";
        }
        echo "\n";

        // Now let's do all the methods
        foreach ($methods as $method)
        {
            $name = $method->name;
            echo $name, "\t";
            for ($i = $min; $i < $max; $i += $increment)
            {
                $start = microtime(true);
                for ($j = 0; $j < $i; $j++)
                    $class->$name();
                echo floor((microtime(true) - $start) * 1000), "\t";
            }
            echo "\n";
        }
    }
}


