<?php
$swf_filename = $argv[1];
$swfdata = file_get_contents($swf_filename);

$swf_editor = new SWFEditor();

if ($swf_editor->input($swfdata) == false) {
   fprintf(STDERR, "input failed\n");
   exit(1);
}


$swf_editor->swfInfo();
