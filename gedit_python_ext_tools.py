# MySQL Line Comment Toggle with #
#! /usr/bin/env python
import sys
import StringIO
block = sys.stdin.read()
block = StringIO.StringIO(block)
msg = ''
for line in block:
	if "# " in line:
		line = line.replace('# ','')
		msg = "All lines in selection uncommented"
	else:
		line = "# " + line
		msg = "All lines in selection commented"
	sys.stdout.write(line)
exit(msg)
