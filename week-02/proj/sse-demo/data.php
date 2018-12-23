<?php

header('Content-Type:text/event-stream;charset=utf-8');
header('Access-Control-Allow-OPrigin:http://127.0.0.1/');

echo 'data:现在的北京时间是'.date('H:i:s');
