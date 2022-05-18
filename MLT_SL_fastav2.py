#Author: Daniel Chavez, feb 14, 2017
#This script changes IUPAC annotations such as R, S to N's
#This is useful to integrate files within programs that do not handle IUPAC annotations (e.g Package_PopGenome_in R)

import sys
import re

infile=sys.argv[1]
file=open(infile, 'r')
output=open("Single_" + infile,'w')

for line in file:
	if line.startswith('>'):
		output.write( '\n' + line)
	else:
		line=line.strip()
		output.write(line)
output.close()
