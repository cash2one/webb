import sys
import json
import datetime
import time
import re

pv = 0
pv_with_loc = 0
pv_with_city_code = 0
loc_with_res_time = 0
loc_res_time_total = 0

for line in sys.stdin:
	line = line.strip()
	if not line:
		continue
	if len(line.split('\t')) != 2:
		continue
	pv = pv + 1

	co, clk = line.split('\t')
	match = re.search(r'baiduloc=([^;]+);?', co, re.I)
	if not match:
		continue
	baiduloc = match.group(0)
	if len(baiduloc) < 10:
		continue
	baiduloc = baiduloc[10:]
	if baiduloc[-1] == ';':
		baiduloc = baiduloc[:-1]

	bdloc_arr = baiduloc.split('_')
	if len(bdloc_arr) != 5:
		continue
	try:
		citycode = int(bdloc_arr[3])
		if citycode > 0:
			pv_with_city_code = pv_with_city_code + 1
	except ValueError:
		pass

	pv_with_loc = pv_with_loc + 1

	clk_arr = clk.split(':')
	if len(clk_arr) != 3:
		continue
	for i in range(0, 3):
		try:
			clk_arr[i] = int(clk_arr[i])
		except ValueError:
			continue
	if clk_arr[0] > 23 or clk_arr[0] < 0 or clk_arr[1] > 60 or clk_arr[1] < 0 or clk_arr[2] > 60 or clk_arr[2] < 0:
		continue
	logdate = sys.argv[1]
	if len(logdate) != 8:
		continue
	year = int(logdate[0:4])
	if year < 2000 or year > 2100:
		continue
	month = int(logdate[4:6])
	if month < 1 or month > 12:
		continue
	day = int(logdate[6:8])
	if day < 1 or day > 31:
		continue

	cur_time = int(time.mktime(
		datetime.datetime(
			year, month, day,
			clk_arr[0], clk_arr[1], clk_arr[2]
		).timetuple()))
	try:
		loc_time = int(bdloc_arr[4])
	except ValueError:
		continue
	if loc_time >= pow(10, 12):
		loc_time = loc_time / 1000
	if cur_time < loc_time:
		continue
	loc_with_res_time = loc_with_res_time + 1
	loc_res_time_total = loc_res_time_total + 1.0 * max(172800 - cur_time + loc_time, 0) / 3600

print json.dumps({
		"pv": pv,
		"pv_loc": pv_with_loc,
		"pv_city_code": pv_with_city_code,
		"average_loc_res_time":
			-1 if loc_with_res_time == 0 else loc_res_time_total / loc_with_res_time
	}, encoding='latin1')
