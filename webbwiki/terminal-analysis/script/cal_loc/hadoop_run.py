#!/usr/bin/python
# -*- coding: utf-8 -*-
import sys
import os
from datetime import datetime, date, timedelta


def getBaseInfo(logdate):
    basedir = "/home/work/hadoop/hadoop"
    inputpath = "hdfs://szwg-ston-hdfs.dmop.baidu.com:54310/app/mi/se/udw_mart/ud_ml_wise_merge_data_text/partition_stat_date=%s/00000*" % logdate
    outputpath = "hdfs://szwg-stoff-hdfs.dmop.baidu.com:54310/ps/ubs/ubs-data/tianhaiying/panfayi/%s_wise_gbs_loc_ua_1_out" % logdate

    print "****************************************************"
    print "Step [1]: Clean output directory"
    print "****************************************************"
    command = basedir + "/bin/hadoop dfs -rmr " + outputpath
    print command
    os.system(command)

    print "****************************************************"
    print "Step [2]: Running task..."
    print "****************************************************"
    currdir = os.path.dirname(os.path.realpath(__file__))
    command =  basedir + "/bin/hadoop streaming " + \
        " -input " + inputpath + \
        " -output " + outputpath + \
        " -mapper \"./python/python2.6/bin/python2.6 mapper_baseinfo.py\" " + \
        " -reducer \"./python/python2.6/bin/python2.6 reducer_baseinfo.py\" " + \
        " -file " + currdir + "/mapper_baseinfo.py" + \
        " -file " + currdir + "/reducer_baseinfo.py" + \
        " -cmdenv logdate=" + logdate + \
        " -cacheArchive hdfs://szwg-stoff-hdfs.dmop.baidu.com:54310/ps/ubs/bin/python26.tar.gz#python" + \
        " -jobconf mapred.reduce.tasks=100" + \
        " -jobconf mapred.job.reduce.capacity=400" + \
        " -jobconf mapred.job.map.capacity=800" + \
        " -jobconf mapred.job.name=\"ps_fe_panfayi_wise_gbs_loc_ua_1_%s\"" % logdate + \
        " -jobconf mapred.job.priority=VERY_HIGH"
    print command
    os.system(command)


def calculate(logdate):
    basedir = "/home/work/hadoop/hadoop"
    inputpath = "hdfs://szwg-stoff-hdfs.dmop.baidu.com:54310/ps/ubs/ubs-data/tianhaiying/panfayi/%s_wise_gbs_loc_ua_1_out/part-*" % logdate
    outputpath = "hdfs://szwg-stoff-hdfs.dmop.baidu.com:54310/ps/ubs/ubs-data/tianhaiying/panfayi/%s_wise_gbs_loc_ua_2_out" % logdate

    print "****************************************************"
    print "Step [1]: Clean output directory"
    print "****************************************************"
    command = basedir + "/bin/hadoop dfs -rmr " + outputpath
    print command
    os.system(command)

    print "****************************************************"
    print "Step [2]: Running task..."
    print "****************************************************"
    currdir = os.path.dirname(os.path.realpath(__file__))
    command =  basedir + "/bin/hadoop streaming " + \
        " -input " + inputpath + \
        " -output " + outputpath + \
        " -mapper \"./python/python2.6/bin/python2.6 mapper_cal_pv.py\" " + \
        " -reducer \"./python/python2.6/bin/python2.6 reducer_cal_pv.py %s\" " % logdate + \
        " -file " + currdir + "/mapper_cal_pv.py" + \
        " -file " + currdir + "/reducer_cal_pv.py" + \
        " -cmdenv logdate=" + logdate + \
        " -inputformat org.apache.hadoop.mapred.CombineTextInputFormat" +\
        " -jobconf mapred.max.split.size=5368709120" +\
        " -cacheArchive hdfs://szwg-stoff-hdfs.dmop.baidu.com:54310/ps/ubs/bin/python26.tar.gz#python" + \
        " -jobconf mapred.reduce.tasks=1" + \
        " -jobconf mapred.job.reduce.capacity=400" + \
        " -jobconf mapred.job.map.capacity=800" + \
        " -jobconf mapred.job.name=\"ps_fe_panfayi_wise_gbs_loc_ua_2_%s\"" % logdate + \
        " -jobconf mapred.job.priority=VERY_HIGH"
    print command
    os.system(command)

    print "****************************************************"
    print "Step [3]: Clean tmp output"
    print "****************************************************"
    #command = basedir + "/bin/hadoop dfs -rmr " + inputpath
    #print command
    #os.system(command)


def saveResult(logdate):
    basedir = "/home/work/hadoop/hadoop"
    currdir = os.path.dirname(os.path.realpath(__file__))
    inputpath = "hdfs://szwg-stoff-hdfs.dmop.baidu.com:54310/ps/ubs/ubs-data/tianhaiying/panfayi/%s_wise_gbs_loc_ua_2_out/part-00000" % logdate

    year = logdate[0:4]
    month = logdate[4:6]
    outputpath = "%s/../../data_loc/%s/%s" % (currdir, year, month)
    if not os.path.exists(outputpath):
        os.makedirs(outputpath)

    print "****************************************************"
    print "Step [1]: Save output file"
    print "****************************************************"
    command = basedir + "/bin/hadoop dfs -cat " + inputpath + " > " + outputpath + "/" + logdate
    print command
    os.system(command)


if __name__ == '__main__':
    today = datetime.today()
    date_list = [date.strftime(today - timedelta(days=x), "%Y%m%d") for x in range(2, 3)]
    for logdate in date_list:
        getBaseInfo(logdate)
        calculate(logdate)
        saveResult(logdate)


