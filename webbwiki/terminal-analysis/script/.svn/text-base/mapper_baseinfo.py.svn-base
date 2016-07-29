#!/home/tools/tools/scmtools/usr/bin/python
# -*- coding: utf-8 -*-
import os
import sys
import re


for line in sys.stdin:
    line = line.strip()
    if not line:
        continue

    arr = line.split('\t')
    if len(arr) < 31:
        continue

    baiduid = arr[3]
    if len(baiduid) != 32:
        continue

    source_group = (arr[13]).strip().lower()
    search_type = (arr[14]).strip().lower()
    user_agent = (arr[28]).strip().lower()
    mobile_format = (arr[29]).strip().lower()
    mobile_platform = (arr[30]).strip().lower()
    
    if not user_agent or len(user_agent)<20:
        continue

    if user_agent == 'mozilla/5.0' or re.search(r'(baiduinternalrobot|googlebot|odp ral|baiduspider)', user_agent, re.I):
        continue

    ################################ os ####################################
    osList = [
        ['android', r'android', r'android([/\s]+)(?P<version>\d{1}(\.\d{1})+)'], 
        ['android', r'\sadr\s', r'\sadr([/ ]+)(?P<version>\d{1}(\.\d{1})+)'],
        ['android', r'juc\s+\(linux', r'juc\s+\(linux[^\d]+\s(?P<version>\d{1}(\.\d{1})+)'],
        ['android', r'linux;\s+', r'linux;\s+u;\s+(?P<version>\d{1}(\.\d{1})+)'],
        ['android', r'linux\s+x86_64'],    
        ['iphone', r'\W(iphone|ipod)\W', r'iphone.+os (?P<version>\d{1}(_\d{1})+)'], 
        ['ipad', r'[^a-z]ipad[^a-z]', r'cpu os (?P<version>\d{1}(_\d{1})+)'], 
        ['winphone', r'windows\s+phone( os)?', r'windows\s+phone( os)?\s*(?P<version>\d{1}(\.\d{1,2})+)'],
        ['winphone', r'windows.+wds', r'wds\s*(?P<version>\d{1}(\.\d{1,2})+)'],
        ['winmobile', r'windowsmobile', r'windowsmobile[/ ](?P<version>\d{1}(\.\d{1,2})+)'],
        ['symbian', r'symbianos[/\s]+\d\.\d', r'symbianos[/\s]+(?P<version>\d{1}(\.\d{1})+)'],
        ['threadx', r'threadx', r'threadx(_os)?[/\s]*(\d)?(?P<version>\d{1}(\.\d{1}))'],
        ['winnt', r'windows nt', r'windows nt[^a-z^\d](?P<version>\d{1}(\.\d{1})+)'],
        ['wince', r'windows ce'],
        ['mtk', r'[^a-z]*maui[^a-z]'],
        ['mtk', r'[^a-z]*mtk[^a-z]'],
        ['bada', r'^bada[^a-z]'],
        ['oppo', r'oppo'],
        ['meego', r'meego'],
        ['series40', r'series40'],
        ['blackberry', r'blackberry']
    ]

    os = "NA"
    osVersion = "NA"

    for rule in osList:
        match = re.search(rule[1], user_agent, re.I)
 
        if not match:
            continue
            
        os = (rule[0]).strip().lower()
        
        if len(rule) == 2:
            break 

        match = re.search(rule[2], user_agent, re.I)
        if not match:
            continue

        osVersion = match.group('version').replace('_', '.').strip('.')
        break

    if re.match(r'^[\d\.]+$', osVersion, re.I):
        match = re.search(r'(^\d+(\.\d+(\.\d+)?)?)', osVersion)
        if match:
            osVersion = match.group(1) 

    if os == 'android' and osVersion > '6.0':
        osVersion = 'NA'


    ################################ browser ####################################
    browser = "NA"
    browserVersion = "NA"

    browserList = [
        ['baiduboxapp_reverse', r'baiduboxapp.+_(diordna|enohpi|enohpw)_', r'(?P<version>[\d\.]+)_(diordna|enohpi|enohpw)_'],
        ['baiduboxapp', r'baiduboxapp', r'baiduboxapp([/ ]+)(?P<version>[\d\.]+)'],
        ['baidubrowser', r'[^a-z]flyflow[^a-z]', r'flyflow([/ ]+)(?P<version>[\d\.]+)'],
        ['baidubrowser', r'baidubrowser', r'baidubrowser([/ ]+)(?P<version>[\d\.]+)'],
        ['oppobrowser', r'oppobrowser', r'oppobrowser([/ ]+)(?P<version>[\d\.]+)'],
        ['samsungbrowser', r'samsungbrowser', r'samsungbrowser([/ ]+)(?P<version>[\d\.]+)'],
        ['360browser', r'360 aphone browser', r'360 aphone browser([/ ]+)\((?P<version>[\d\.]+)\)'],
        ['oupeng', r'oupeng/lewa', r'oupeng/lewa.*_(?P<version>(\d+\.+)+\d+)'],
        ['oupeng', r'oupeng/', r'oupeng/(?P<version>[\d\.]+)'],
        ['opera mini', r'opera mini', r'opera mini([/ ]+)(?P<version>[\d\.]+)'],
        ['opera mobile', r'opera mobi', r'version/(?P<version>[\d\.]+)'],
        ['miuibrowser', r'miuibrowser', r'miuibrowser([/ ]+)(?P<version>[\d\.]+)'],
        ['ucbrowser', r'ucbrowser', r'ucbrowser([/ ]+)(?P<version>[\d\.]+)'],
        ['ucbrowser', r'ucweb', r'ucweb[/ ]*(?P<version>[\d\.]+)'],
        ['ucbrowser', r'uc applewebkit/'],
        ['ucbrowser', r'^juc[^a-z]'],
        ['liebaofast', r'liebaofast', r'liebaofast([/ ]+)(?P<version>[\d\.]+)'],
        ['qqbrowser', r'qqbrowser', r'mqqbrowser([/ ]+)(?P<version>(mini)?[\d\.]+)'],
        ['sogou', r'sogoumobilebrowser', r'sogoumobilebrowser([/ ]+)(?P<version>[\d\.]+)'],
        ['msie', r' msie ', r'msie([/ ]+)(?P<version>[\d\.]+)'],
        ['netfront', r'/netfront', r'netfront([/ \-]+)?(?P<version>[\d\.]+)'],
        ['netfront', r'/netfont', r'netfont([/ \-]+)?(?P<version>[\d\.]+)'],
        ['mtk', r'[^a-z]*maui[^a-z]'],
        ['mtk', r'[^a-z]*mtk[^a-z]'],
        ['dolfin', r'dolfin/', r'dolfin[/ ]+(?P<version>[\d\.]+)'],
        ['qvodplayer', r'qvodplayerbrowser', r'qvodplayerbrowser[/: ]+(?P<version>[\d\.]+)'],
        ['obigo', r'[^a-z]obigo[^a-z]', r'obigo[/: ]+(?P<version>[^ ]+)'],
        ['hao123_reverse', r'[^a-z]hao123[^a-z]+_(dapi|diordna)_', r'(?P<version>[\d\.]+)_(dapi|diordna)_'],
        ['firefox', r'[^a-z]firefox[^a-z]', r'firefox[^a-z^\d](?P<version>[\d\.]+)'],
        ['coolpadwebkit', r'coolpadwebkit', r'coolpadwebkit/(?P<version>[\d\.]+)'],
        ['dorado', r'dorado'],
        ['nokiabrowser', r'nokiabrowser', r'nokiabrowser/(?P<version>[\d\.]+)'],
        ['ie', r'iemobile', r'iemobile/(?P<version>[\d\.]+)'],
        ['ovibrowser', r'ovibrowser', r'ovibrowser/(?P<version>[\d\.]+)'],
        ['safari', r'safari', '', r'iphone', osVersion],
        ['safari', r'safari', '', r'ipad', osVersion],
        ['android', r'mozilla/5\.0 *\(linux; *(u;)? *android *([\d\.]+[^\)]*)?\) *applel?webkit[/ ]+[\d\. ]+\(khtml, *like gecko\) *(version[/\d\. ]*)?(mobile *)?safari[/\d\.]+$', '', '', osVersion],
        ['android', r'linux; *(\w;)? *([\d\.]+)?[\w\W]*\) *applel?webkit[/ ]+[\d\. ]+\(khtml, *like gecko\) *(version[/\d\. ]*)?(mobile *)?safari[/\d\.]+', '', '', osVersion],
        ['android', r'^.{0,35}(linux/[\d\.]+)? *android[/ ]*[\d\.]+\s+release/[\d\.]+\s+browser/applewebkit[\d\.]+( *\(khtml, *like gecko\))?( *profile/[^ ]* configuration/[^ ]*)?( *mozilla/[\d\.]+)?( *mobile)?( *safari/[\d\.]+)?( *mbbms/[\d\.]+;?)?( *system/android *[\d\.]+)?;?$', '', '', osVersion],
        ['android', r'^.{0,35}(linux/[\d\.]+)? *android[/ ]*[\d\.]+\s+release/[\d\.]+( *mozilla/[\d\.]+)? *applewebkit/[\d\.]+ *version/[\d\.]+( *mobile)?( *safari/[\d\.]+)?$', '', '', osVersion],
        ['chrome', r'chrome', r'(chrome|crios)([/ ]+)(?P<version>[\d\.]+)'],
        ['huaweibrowser', r'^huawei.+\sbrowser\/wap2\.0'],
        ['lenovobrowser', r'^lenovo.+\sbrowser\/applewebkit']
    ]

    for rule in browserList :
        if len(rule) > 3 and rule[3] and rule[3] != os: 
            continue

        match = re.search(rule[1], user_agent)
        if not match:
            continue

        browser = (rule[0]).strip().lower()

        if len(rule) == 2:
            break

        # for stock browser of android or ios 
        if len(rule) > 4 and rule[4]:
            browserVersion = rule[4]
            break

        if rule[2]:
            match = re.search(rule[2], user_agent)
            if not match:
                continue
            browserVersion = match.group('version').replace('_', '.').replace(',', '.').strip('.')
            break


    if browser.find('_reverse') != -1:
        browserVersion = browserVersion.split('.')
        browserVersion.reverse()
        browserVersion = '.'.join(browserVersion)
        browser = browser.rstrip('_reverse')

    if re.match('^[\d\.]+$', browserVersion): 
        match = re.search('(^\d+(\.\d+(\.\d+)?)?)', browserVersion)
        if match:
            browserVersion = match.group(1)

    if not osVersion:
        osVersion = 'NA'
    if not browserVersion:
        browserVersion = 'NA'
    
    #complete the format of version
    cnt = osVersion.count('.')
    if cnt == 0 and osVersion != 'NA':
        osVersion = osVersion + '.0.0'
    elif cnt == 1 :
        osVersion = osVersion + '.0'

    cnt = browserVersion.count('.')
    if cnt == 0 and browserVersion != 'NA':
        browserVersion = browserVersion + '.0.0'
    elif cnt == 1 :
        browserVersion = browserVersion + '.0'

    print "%s\t%s\t%s\t%s\t%s" % (os, osVersion, browser, browserVersion, mobile_format)


