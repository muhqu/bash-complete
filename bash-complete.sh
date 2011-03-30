#!/bin/bash

if [ "$#" != "1" ]; then
	echo "Usage: $0 \"command to complete...\""
	echo ""
	echo "Examples:"
	echo "  $0 \"ssh\"                  - will list commands like: ssh, ssh-add, ssh-keygen"
	echo "  $0 \"ssh \"                 - will list known hosts"
	echo "  $0 \"ssh -\"                - will list ssh command flags"
	echo "  $0 \"ssh -o \"              - will list available ssh options"
	echo ""
	exit 1;
fi

#
# simulate some user input and pipe that into an interactive bash
# AWESOME!
#
CMD="$1"
BNDRY="XYZXYZXYZXYZXYZXYZXYZXYZXYZ"
OUTPUT=$(echo -ne "false && ($CMD\t\tyyyy) && echo $BNDRY" | COLUMNS=1024 PS1="$BNDRY " /bin/bash -i 2>&1)

#
# try to read the list of completions and return them as a 
# sorted list one per line.
#
LIST=$(echo "$OUTPUT" \
	| awk '/'$BNDRY' false/, /'$BNDRY' false.*echo '$BNDRY'/' \
	| awk 'substr($0,0,'${#BNDRY}') != "'${BNDRY}'" && $0 !~ /\(y or n\)$|--More--|^> / { for (i=1; i<=NF; i++) print $i }' \
	| sort | uniq )
if [ -n "$LIST" ]; then
	echo "$LIST";
	exit 0;
fi

#
# if completion did not resulted in a list of completions,
# it was propably a direct word completion, so we need to 
# extract the completed word from the expanded commandline.
#
L=${#CMD}
CMDLW=$(echo "$CMD" | awk '{print $NF}')
[ -n "$CMDLW" ] && L=$(($L-${#CMDLW}+1))
echo "$OUTPUT" \
	| awk '$0 ~ /'$BNDRY' false && \(/ { split($0,a,/'$BNDRY' false && \(|yyyy\) && echo '$BNDRY'/); print a[2] }' \
	| awk '{print substr($0,'$L');}' \
	| cat;
exit 0;


#
# The MIT License
# 
# Copyright (c) 2011 Mathias Leppich <mleppich@muhqu.de>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
