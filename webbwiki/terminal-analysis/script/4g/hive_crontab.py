#!/home/tools/tools/scmtools/usr/bin/python
# -*- coding: utf-8 -*-
import sys
import os
import json
from datetime import datetime, date, timedelta


def sqlTpl():
    currdir = os.path.dirname(os.path.realpath(__file__))
    return currdir + '/sql.tpl'    
    
def execSql(logdate):
    currdir = os.path.dirname(os.path.realpath(__file__))
    basedir = os.path.dirname(os.path.dirname(currdir))
    qedir   = '/home/users/panfayi/local/queryengine-client-2.0.1-online/queryengine'
    sqlfile = sqlTpl()

    year = logdate[0:4]
    month = logdate[4:6]
    outputpath = "%s/data/4g/%s/%s" % (basedir, year, month)
    if not os.path.exists(outputpath):
        os.makedirs(outputpath)

    print "****************************************************"
    print "Step [1]: queryengine selection"
    print "****************************************************"
    command = "%s/bin/queryengine --hivevar day=%s -f %s > %s/%s" % (qedir, logdate, sqlfile, outputpath, logdate)
    print command
    os.system(command)
    
    
def save2Json(logdate):
    currdir = os.path.dirname(os.path.realpath(__file__))
    basedir = os.path.dirname(os.path.dirname(currdir))
    keys = [
        'wise_total',
        'wise_4g',
        'wise_4g_1',
        'wise_4g_2',
        'wise_4g_3',
        'wise_4g_4',
        'wise_4g_5',
        'wise_4g_6',
        'wise_iu_total',
        'wise_4g_iu',
        'wise_4g_iu_1',
        'wise_4g_iu_2',
        'wise_4g_iu_3',
        'wise_4g_iu_4',
        'wise_4g_iu_5',
        'wise_4g_iu_6',
        'wise_iu_exclude_bdbox_total',
        'wise_4g_iu_exclude_bdbox',
        'wise_4g_iu_exclude_bdbox_1',
        'wise_4g_iu_exclude_bdbox_2',
        'wise_4g_iu_exclude_bdbox_3',
        'wise_4g_iu_exclude_bdbox_4',
        'wise_4g_iu_exclude_bdbox_5',
        'wise_4g_iu_exclude_bdbox_6',
        'wise_bdbox',
        'wise_bdbox_4g',
        'wise_bdbox_android',
        'wise_bdbox_4g_android',
        'wise_bdbox_iphone',
        'wise_bdbox_4g_iphone',
        'datatime']

    result = {'datatime': logdate}

    print "****************************************************"
    print "Step [2]: save result to JSON"
    print "****************************************************"
    year = logdate[0:4]
    month = logdate[4:6]
    resultfile = "%s/data/4g/%s/%s/%s" % (basedir, year, month, logdate)
    with open(resultfile) as infile:
        i = 0
        for line in infile:
            if i >= len(keys):
                break

            result[keys[i]] = int(line.strip())
            i += 1

    resultfile = "%s/data/4g/%s/%s/data_%s" % (basedir, year, month, logdate)
    with open(resultfile, 'w') as outfile:
         outfile.write(json.dumps(result, encoding='latin1'))
    
    print resultfile
    print json.dumps(result, encoding='latin1')
    

if __name__ == '__main__':
    today = datetime.today()
    date_list = [date.strftime(today - timedelta(days=x), "%Y%m%d") for x in range(2, 3)]
    for logdate in date_list:
        execSql(logdate)
        save2Json(logdate)


