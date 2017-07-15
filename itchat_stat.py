# -*- coding: utf-8 -*
from pyper import *
import itchat
itchat.auto_login()
import pandas as pd
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
friends = itchat.get_friends(update=True)[0:]
male = female = other = 0

for ele in friends[1:]:
	sex = ele["Sex"]
	if sex == 1:
		male += 1
	elif sex == 2:
		female += 1
	else:
		other += 1


total = len(friends[1:])

print "male friends num: %.2f%%" % (float(male)/total*100) + "\n" + "female friends num: %.2f%%" % (float(female)/total*100) + "\n" + "no sex friends num: %.2f%%" % (float(other)/total*100)


def get_var(var):
	variable = []
	for friend in friends:
		value = friend[var]
		variable.append(value)
	return variable

NickName = get_var("NickName")
Sex = get_var("Sex")
Province = get_var("Province")
City = get_var("City")
Signature = get_var("Signature")
data = {"NickName":NickName,"Sex":Sex,"Province":Province,"City":City,"Signature":Signature}
df = pd.DataFrame(data)
df.to_csv('data.csv',index=True,sep='\t')




df_fill=df.replace('','未知')
df_size=df_fill.groupby(['Province','City']).size()
df_size.to_csv('haha.txt',index=True,header=True)

str_pro=r'''
	Rscript itchat.R
'''
subprocess.call(str_pro, shell=True, executable='/bin/bash')










