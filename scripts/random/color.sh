#!/bin/bash -e

make ${@} 2>&1 | perl -wln -M'Term::ANSIColor' -e '
m/Building|gcc|g++|\bCC\b|\bcc\b/ and print "\e[0;34m", "$_", "\e[0m"
or
m/Error/i and print "\e[1;91m", "$_", "\e[1m"
or
m/Warning/i and print "\e[1;95m", "$_", "\e[1m"
or
m/Linking|\.a\b/ and print "\e[1;36m", "$_", "\e[0m"
or
print; '
