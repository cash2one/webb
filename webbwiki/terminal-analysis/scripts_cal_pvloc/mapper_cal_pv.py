import sys

for line in sys.stdin:
	line = line.strip()
	if not line:
		continue
	if len(line.split('\t')) == 2:
		print line
