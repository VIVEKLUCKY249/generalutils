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

# MySQL Line Comment Toggle with '-- '
#! /usr/bin/env python
import sys
import StringIO
block = sys.stdin.read()
block = StringIO.StringIO(block)
msg = ''
for line in block:
	if "-- " in line:
		line = line.replace('-- ','')
		msg = "All lines in selection uncommented"
	else:
		line = "-- " + line
		msg = "All lines in selection commented"
	sys.stdout.write(line)
exit(msg)

# MySQL Block Comment Toggle
#! /usr/bin/env python
from __future__ import print_function
import sys
import commands
line = sys.stdin.read()
if "/*" and "*/" in line:
	line = line.replace('/*','')
	line = line.replace('*/','')
	msg = "Code block in selection uncommented"
else:
	line = "/*" + line
	line = line + "*/"
	msg = "Code block in selection commented"
sys.stdout.write(line)
exit(msg)

# Javascript Line Comment Toggle
#! /usr/bin/env python
import sys
import StringIO
block = sys.stdin.read()
block = StringIO.StringIO(block)
msg = ''
for line in block:
	if "//~" in line:
		line = line.replace('//~','')
		msg = "All lines in selection uncommented"
	else:
		line = "//~" + line
		msg = "All lines in selection commented"
	sys.stdout.write(line)
exit(msg)
