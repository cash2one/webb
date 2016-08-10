import sys

for line in sys.stdin:
	line = line.strip()
	if not line:
		continue
	print line
