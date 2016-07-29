#!/home/tools/tools/scmtools/usr/bin/python
# -*- coding: utf-8 -*-
import sys


for line in sys.stdin:
    line = line.strip()
    if not line:
        continue

    if len(line.split('\t')) == 5:
        print line

