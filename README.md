BASH Completion
===============

Description
  BASH script to list the completions bash would apply when a user hits `TAB` `TAB` on the command line. 

Usage
    ./bash-complete.sh "command to complete..."


Examples
    ./bash-complete.sh "ssh"                  # will list commands like: ssh, ssh-add, ssh-keygen"
    ./bash-complete.sh "ssh "                 # will list known hosts"
    ./bash-complete.sh "ssh -"                # will list ssh command flags"
    ./bash-complete.sh "ssh -o "              # will list available ssh options"

Author
  [Mathias Leppich][http://github.com/muhqu] <mleppich@muhqu.de>

---------------

The MIT License

Copyright (c) 2011 Mathias Leppich <mleppich@muhqu.de>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
