#!/usr/bin/python

dic="cedict_1_0_ts_utf-8_mdbg.txt"

fp=open(dic)

allofem=[line for line in fp ]
lines=[line for line in allofem if line[0] != '#']
com=[line for line in allofem if line[0] == '#']

sorting=lambda x : x.split()[1]

lines.sort(key=sorting)


op=open("dicout" , mode="wt" , encoding="UTF-8")

op.write("".join(com))
op.write("".join(lines))

