#!/bin/python3
import sys
from langdetect import detect, DetectorFactory 
DetectorFactory.seed = 0
F = open(sys.argv[1]) if len(sys.argv) > 1 else sys.stdin
for line in F:
    sys.stdout.write(detect(line))