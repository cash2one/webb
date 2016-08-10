import os
import re
import sys

for line in sys.stdin:
	line = line.strip()
	if not line:
		continue
	arr = line.split('\t')
	if len(arr) < 42:
		continue
	baiduid = arr[2]
	if len(baiduid) != 32:
		continue
	co = arr[41].strip().lower()
	clk = arr[1].strip().lower()
	print "%s\t%s" % (co, clk)
