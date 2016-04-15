#!/bin/sh
#说明：需要有个mydev文件，
#文件内容：dev=work@testmashine
source ./mydev

rm -rf output
fis3 release prod -d ./output
scp -r output/resource $dev:/home/webb/
