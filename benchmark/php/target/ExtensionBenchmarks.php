<?php
class ExtensionBenchmarks
{
    const FILENAME = '/home/daniel15/public_html/test/blah/foobar.png';

    public function explode()
    {
        $parts = explode('.', self::FILENAME);
        return end($parts);
    }

    public function strrchr()
    {
        return substr(strrchr(self::FILENAME, '.'), 1);
    }

    public function strrchr2()
    {
        return strrchr(self::FILENAME, '.');
    }

    public function strrpos()
    {
        return substr(self::FILENAME, strrpos(self::FILENAME, '.') + 1);
    }

    public function regex()
    {
        return preg_replace('/^.*\.([^.]+)$/D', '$1', self::FILENAME);
    }

    public function regex2()
    {
        return preg_replace('/\.([^.]+)$/', '$1', self::FILENAME);
    }

    public function pathinfo()
    {
        return pathinfo(self::FILENAME, PATHINFO_EXTENSION);
    }
}

