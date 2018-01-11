import sys
import urllib.parse
F = open(sys.argv[1]) if len(sys.argv) > 1 else sys.stdin
for line in F:
    sys.stdout.write(urllib.parse.unquote_plus(line))
