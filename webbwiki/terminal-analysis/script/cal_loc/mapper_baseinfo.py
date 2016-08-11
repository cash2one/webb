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

    ### UA

    user_agent = (arr[27]).strip().lower()

    if not user_agent or len(user_agent) < 20:
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
        ['iphone', r'\W(iphone|ipod)\W', r'iphone.+os (?P<version>\d{1}(_\d{1})+)']
    ]

    os = "others"
    osVersion = "others"

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

    browserList = [
        ['baiduboxapp', r'baiduboxapp.+_(diordna|enohpi|enohpw)_', r'(?P<version>[\d\.]+)_(diordna|enohpi|enohpw)_'],
        ['baiduboxapp', r'baiduboxapp', r'baiduboxapp([/ ]+)(?P<version>[\d\.]+)'],
        ['baidubrowser', r'[^a-z]flyflow[^a-z]', r'flyflow([/ ]+)(?P<version>[\d\.]+)'],
        ['baidubrowser', r'baidubrowser', r'baidubrowser([/ ]+)(?P<version>[\d\.]+)'],
        ['oppobrowser', r'oppobrowser', r'oppobrowser([/ ]+)(?P<version>[\d\.]+)'],
        ['samsungbrowser', r'samsungbrowser', r'samsungbrowser([/ ]+)(?P<version>[\d\.]+)'],
        ['miuibrowser', r'miuibrowser', r'miuibrowser([/ ]+)(?P<version>[\d\.]+)'],
        ['ucbrowser', r'ucbrowser', r'ucbrowser([/ ]+)(?P<version>[\d\.]+)'],
        ['ucbrowser', r'ucweb', r'ucweb[/ ]*(?P<version>[\d\.]+)'],
        ['ucbrowser', r'uc applewebkit/'],
        ['ucbrowser', r'^juc[^a-z]'],
        ['qqbrowser', r'qqbrowser', r'mqqbrowser([/ ]+)(?P<version>(mini)?[\d\.]+)'],
        ['safari', r'safari', '', r'iphone', osVersion],
        ['safari', r'safari', '', r'ipad', osVersion],
        ['android', r'mozilla/5\.0 *\(linux; *(u;)? *android *([\d\.]+[^\)]*)?\) *applel?webkit[/ ]+[\d\. ]+\(khtml, *like gecko\) *(version[/\d\. ]*)?(mobile *)?safari[/\d\.]+$', '', '', osVersion],
        ['android', r'linux; *(\w;)? *([\d\.]+)?[\w\W]*\) *applel?webkit[/ ]+[\d\. ]+\(khtml, *like gecko\) *(version[/\d\. ]*)?(mobile *)?safari[/\d\.]+', '', '', osVersion],
        ['android', r'^.{0,35}(linux/[\d\.]+)? *android[/ ]*[\d\.]+\s+release/[\d\.]+\s+browser/applewebkit[\d\.]+( *\(khtml, *like gecko\))?( *profile/[^ ]* configuration/[^ ]*)?( *mozilla/[\d\.]+)?( *mobile)?( *safari/[\d\.]+)?( *mbbms/[\d\.]+;?)?( *system/android *[\d\.]+)?;?$', '', '', osVersion],
        ['android', r'^.{0,35}(linux/[\d\.]+)? *android[/ ]*[\d\.]+\s+release/[\d\.]+( *mozilla/[\d\.]+)? *applewebkit/[\d\.]+ *version/[\d\.]+( *mobile)?( *safari/[\d\.]+)?$', '', '', osVersion],
        ['chrome', r'chrome', r'(chrome|crios)([/ ]+)(?P<version>[\d\.]+)'],
    ]

    browser = "others"
    browserVersion = "others"

    for rule in browserList:
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

	###res_time
    clk = arr[1].strip().lower()
    clk_arr = clk.split(':')
    fail = 0
    if len(clk_arr) != 3:
		continue
    for i in range(0, 3):
        try:
            clk_arr[i] = int(clk_arr[i])
        except:
            fail = 1
            break
    if fail:
        continue

    if clk_arr[0] > 23 or clk_arr[0] < 0 or clk_arr[1] > 60 or clk_arr[1] < 0 or clk_arr[2] > 60 or clk_arr[2] < 0:
		continue

    co = arr[41].strip().lower()
    match = re.search(r'baiduloc=([\._0-9]+);?', co, re.I)
    baiduloc = ';'
    if match:
        baiduloc = match.group(0)
        if len(baiduloc) > 9:
            baiduloc = baiduloc[10:]
            if len(baiduloc) > 1 and baiduloc[-1] == ';':
                baiduloc = baiduloc[:-1]

    print "%s\t%s\t%s\t%s" % (os, browser, clk, baiduloc)
