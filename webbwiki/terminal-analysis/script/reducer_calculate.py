#!/home/tools/tools/scmtools/usr/bin/python
# -*- coding: utf-8 -*-
from __future__ import division
import sys
import json

global_os_dict = {}
global_browser_dict = {}
global_display_dict = {'iphone': 0, 'utouch': 0, 'middle': 0, 'pad': 0, 'big': 0, 'wml': 0, 'other': 0}
global_detail_all_dict = {'iphone': {'total': 0}, 'android': {'total': 0}}
total_pv = 0

for line in sys.stdin:
    line = line.strip()
    if not line:
        continue

    if len(line.split('\t')) != 5:
        continue
    
    total_pv += 1
    os, os_version, browser, browser_version, display_type = line.split('\t')

    if os == 'iphone':
        global_detail_all_dict['iphone']['total'] += 1
        if browser in global_detail_all_dict['iphone']:
            global_detail_all_dict['iphone'][browser]['total'] += 1
            if browser_version in global_detail_all_dict['iphone'][browser]:
                global_detail_all_dict['iphone'][browser][browser_version] += 1
            else:
                global_detail_all_dict['iphone'][browser][browser_version] = 1
        else:
            global_detail_all_dict['iphone'][browser] = {'total': 1}
    elif os == 'android':
        global_detail_all_dict['android']['total'] += 1
        if browser in global_detail_all_dict['android']:
            global_detail_all_dict['android'][browser]['total'] += 1
            if browser_version in global_detail_all_dict['android'][browser]:
                global_detail_all_dict['android'][browser][browser_version] += 1
            else:
                global_detail_all_dict['android'][browser][browser_version] = 1
        else:
            global_detail_all_dict['android'][browser] = {'total': 1}

    # 移动操作系统分布统计
    if os in global_os_dict:
        global_os_dict[os]['total'] += 1
        if os_version in global_os_dict[os]:
            global_os_dict[os][os_version] += 1
        else:
            global_os_dict[os][os_version] = 1
    else:
        global_os_dict[os] = {'total': 1}
        global_os_dict[os][os_version] = 1

    # 移动端浏览器分布统计
    if browser in global_browser_dict:
        global_browser_dict[browser]['total'] += 1
        if browser_version in global_browser_dict[browser]:
            global_browser_dict[browser][browser_version] += 1
        else:
            global_browser_dict[browser][browser_version] = 1
    else:
        global_browser_dict[browser] = {'total': 1}
        global_browser_dict[browser][browser_version] = 1

    # 移动显示屏幕分布统计
    # iphone（高端炫）,middle（炫彩版）,utouch（高端简版）,big（触屏版）,wml（极简）,other（其它版本）
    if display_type in global_display_dict:
        global_display_dict[display_type] += 1
    #else:
    #    global_display_dict[display_type] = 1


#try:
for name in global_os_dict:
    count = global_os_dict[name]['total']
    global_os_dict[name]['share'] = round(count/total_pv, 4)
    for ver in global_os_dict[name]:
        if ver == 'total' or ver == 'share':
            continue
        ver_count = global_os_dict[name][ver]
        global_os_dict[name][ver] = {'count': ver_count, 'share': round(ver_count/count, 4)}

for name in global_browser_dict:
    count = global_browser_dict[name]['total']
    global_browser_dict[name]['share'] = round(count/total_pv, 4)
    for ver in global_browser_dict[name]:
        if ver == 'total' or ver == 'share':
            continue
        ver_count = global_browser_dict[name][ver]
        global_browser_dict[name][ver] = {'count': ver_count, 'share': round(ver_count/count, 4)}

for name in global_display_dict:
    count = global_display_dict[name]
    global_display_dict[name] = {'count': count, 'share': round(count/total_pv, 4)}

print json.dumps({'total': total_pv, 'os': global_os_dict, 'browser': global_browser_dict, 'display': global_display_dict, 'detail': global_detail_all_dict}, encoding='latin1')
#except:
#    pass


