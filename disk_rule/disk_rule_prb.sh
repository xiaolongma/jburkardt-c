#!/bin/bash
#
gcc -c -g -I/$HOME/include disk_rule_prb.c >& compiler.txt
if [ $? -ne 0 ]; then
  echo "Errors compiling disk_rule_prb.c"
  exit
fi
rm compiler.txt
#
gcc disk_rule_prb.o /$HOME/libc/$ARCH/disk_rule.o -lm
if [ $? -ne 0 ]; then
  echo "Errors linking and loading disk_rule_prb.o."
  exit
fi
#
rm disk_rule_prb.o
#
mv a.out disk_rule_prb
./disk_rule_prb > disk_rule_prb_output.txt
if [ $? -ne 0 ]; then
  echo "Errors running disk_rule_prb."
  exit
fi
rm disk_rule_prb
#
echo "Program output written to disk_rule_prb_output.txt"
