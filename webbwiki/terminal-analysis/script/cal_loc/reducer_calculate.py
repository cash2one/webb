import sys
import json
import datetime
import time
import re

total_pv = 0
baiduloc_pv = 0
citycode_pv = 0
restime_num = 0
restime_total = 0
global_detail_all_dict = {}

for line in sys.stdin:
	line = line.strip()
	if not line:
		continue
	if len(line.split('\t')) != 4:
		continue

	os, browser, clk, baiduloc = line.split('\t')

	total_pv += 1

	if os in global_detail_all_dict:
		global_detail_all_dict[os]['total'] += 1
		if browser in global_detail_all_dict[os]['browser']:
			global_detail_all_dict[os]['browser'][browser]['total'] += 1
		else:
			global_detail_all_dict[os]['browser'][browser] = {'total': 1, 'baiduloc_pv':0}
	else:
		global_detail_all_dict[os] = {'total': 1, 'baiduloc_pv': 0, 'browser': { browser: {'total': 1, 'baiduloc_pv': 0}}}

	if len(baiduloc) == 1 and baiduloc == ";":
		continue

	bdloc_arr = baiduloc.split('_')

	if len(bdloc_arr) < 2:
		continue

	try:
		x = float(bdloc_arr[0])
		y = float(bdloc_arr[1])
	except:
		continue

	###detail

	baiduloc_pv += 1
	global_detail_all_dict[os]['baiduloc_pv'] += 1
	global_detail_all_dict[os]['browser'][browser]['baiduloc_pv'] += 1

    ###citycode

	try:
		citycode = int(bdloc_arr[3])
		if citycode > 0:
			citycode_pv += 1
	except:
		pass

	###loc_time

	try:
		loc_time = int(bdloc_arr[4])
	except:
		continue
	if loc_time >= pow(10, 12):
		loc_time = loc_time / 1000

	###log_clock

	clk_arr = clk.split(':')
	if len(clk_arr) != 3:
		continue
	fail = 0
	for i in range(0, 3):
		try:
			clk_arr[i] = int(clk_arr[i])
		except:
			fail = 1
			break
	if fail:
		continue

	###log_date

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

	try:
		cur_time = int(time.mktime(
			datetime.datetime(
				year, month, day,
				clk_arr[0], clk_arr[1], clk_arr[2]
			).timetuple()))
	except:
		continue

	if cur_time < loc_time:
		continue

	restime_num += 1
	restime_total += 1.0 * max(172800 - cur_time + loc_time, 0) / 3600

print json.dumps({
		'total': total_pv,
		'baiduloc_pv': baiduloc_pv,
		'citycode_pv': citycode_pv,
		'restime_num': restime_num,
		'restime_total': restime_total,
		'detail': global_detail_all_dict
	}, encoding='latin1')


