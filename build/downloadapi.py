#!/usr/bin/python
# -*- coding: UTF-8 -*-

import urllib.request
import codecs
import os,sys,re,time; 
url = r"http://api.jquery.com/api/"
filename = r"../jQueryAPI.en_US.xml"
data = urllib.request.urlretrieve(url,filename)



fileread = open(filename,'r', encoding='utf-8');
filer = fileread.read();
sub = re.sub("Properties of jQuery Object Instances ","Properties of jQuery Object Instances",filer,0); #替换stra 为 strb
sub = re.sub(r'(<entry.*?)(>)',r'\1 filename=""\2',filer,0); #添加 filename 属性
fileread.close();
fileok = open(filename,'w', encoding='utf-8');
fileok.write(sub);
fileok.close();
print(filename,'替换成功!')
