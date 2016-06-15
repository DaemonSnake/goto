#!/usr/bin/env bash
# Copyright (C) 2016  Bastien Penavayre

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

function install()
{
    local user_folder=$HOME;

    if [ ! -z $SUDO_USER ];
    then
        user_folder="~$SUDO_USER";
    fi;

    grep "__DEFAULT__" $user_folder/.goto_list > /dev/null 2> /dev/null;
    if [ $? -ne 0 ]; then
       echo "__DEFAULT__ $user_folder" >> $user_folder/.goto_list;
    fi;
    sudo cp goto /usr/bin/_goto;
    sudo cp goto.autocomplete /etc/bash_completion.d/goto;
    sudo cp goto_man /usr/local/share/man/man1/goto.1;
    grep "alias goto=\"source _goto\"" $user_folder/.bashrc > /dev/null 2> /dev/null;
    if [ $? -ne 0 ]; then
        echo "alias goto=\"source _goto\"" >> $user_folder/.bashrc;
    fi;
}

install;
