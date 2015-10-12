#!/usr/bin/env python
import sys
import re
from sys import stdin
import pygtk
pygtk.require('2.0')
import gtk

selectionText = stdin.readline()
line = re.sub(r"^.*(app)", r'\1', selectionText)
sys.stdout.write(line)
clipboard = gtk.clipboard_get()
clipboard.set_text(line)
clipboard.store()
