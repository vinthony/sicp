#!/usr/bin/env python
import os

for x in os.listdir("."):
	if x.endswith('.scm'):
		os.rename(x,x.split("..scm")[0]+".scm")
