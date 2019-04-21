#!/bin/bash

# Input files
cat_in="args/cat.txt"
cp_in="args/cp.txt"
date_in="args/date.txt"
dd_in="args/dd.txt"
df_in="args/df.txt"
dir_in="args/dir.txt"
echo_in="args/echo.txt"
false_in="args/false.txt"
ln_in="args/ln.txt"
ls_in="args/ls.txt"
mkdir_in="args/mkdir.txt"
mktemp_in="args/mktemp.txt"
mv_in="args/mv.txt"
printf_in="args/printf.txt"
pwd_in="args/pwd.txt"
sleep_in="args/sleep.txt"
touch_in="args/touch.txt"
true_in="args/true.txt"
uname_in="args/uname.txt"
vdir_in="args/vdir.txt"

# Output files
cat_out="pre/cat.txt"
cp_out="pre/cp.txt"
date_out="pre/date.txt"
dd_out="pre/dd.txt"
df_out="pre/df.txt"
dir_out="pre/dir.txt"
echo_out="pre/echo.txt"
false_out="pre/false.txt"
ln_out="pre/ln.txt"
ls_out="pre/ls.txt"
mkdir_out="pre/mkdir.txt"
mktemp_out="pre/mktemp.txt"
mv_out="pre/mv.txt"
printf_out="pre/printf.txt"
pwd_out="pre/pwd.txt"
sleep_out="pre/sleep.txt"
touch_out="pre/touch.txt"
true_out="pre/true.txt"
uname_out="pre/uname.txt"
vdir_out="pre/vdir.txt"

# cat
{
  mixemup $cat_in --postfix files --max-args 3  &&
  mixemup $cat_in --postfix files/f1 --max-args 3 &&
  mixemup $cat_in --postfix "files/f1 files/f2"  --max-args 3;
} > $cat_out

# cp
{
  mixemup $cp_in --max-args 3 &&
  mixemup $cp_in --postfix files/f1 --max-args 3 &&
  mixemup $cp_in --postfix "files/f1 files/f3" --max-args 3;
} > $cp_out

# date
{
  mixemup $date_in --max-args 3
} > $date_out

# dd
{ 
  mixemup $dd_in --max-args 3 --postfix "if=files/f1 of=files/f3";
} > $dd_out

# df
{ 
  mixemup $df_in --max-args 3;
} > $df_out

# dir
{ 
  mixemup $dir_in --max-args 3 &&
  mixemup $dir_in --max-args 3 --postfix files/d1;
  mixemup $dir_in --max-args 3 --postfix "files/d1 files/d2";
} > $dir_out

# echo
{ 
  mixemup $echo_in --max-args 3 &&
  mixemup $echo_in --max-args 3 --postfix a;
} > $echo_out

# false
{ 
  mixemup $false_in --max-args 3 &&
  mixemup $false_in --max-args 3 --postfix a;
} > $false_out

# ln
{ 
  mixemup $ln_in --max-args 3 &&
  mixemup $ln_in --max-args 3 --postfix "files/f1 files/f3";
} > $ln_out

# ls
{ 
  mixemup $ls_in --max-args 3 &&
  mixemup $ls_in --max-args 3 --postfix files/d1 &&
  mixemup $ls_in --max-args 3 --postfix "files/d1 files/d2";
} > $ls_out

# mkdir
{
  mixemup $mkdir_in --max-args 3 &&
  mixemup $mkdir_in --postfix files/d3 --max-args 3 &&
  mixemup $mkdir_in --postfix "files/d3 files/d4" --max-args 3; 
} > $mkdir_out

# mktemp
{ 
  mixemup $mktemp_in --max-args 3 &&
  mixemup $mktemp_in --postfix files/a --max-args 3 &&
  mixemup $mktemp_in --postfix files/aXXX --max-args 3;
} > $mktemp_out

# mv
{
  mixemup $mv_in --max-args 3 &&
  mixemup $mv_in --postfix files/d1 --max-args 3 &&
  mixemup $mv_in --postfix "files/d1 files/d3" --max-args 3;
} > $mv_out

# printf
{
  mixemup $printf_in --max-args 3 &&
  mixemup $printf_in --postfix a --max-args 3;
} > $printf_out

# pwd
{
  mixemup $pwd_in --max-args 3 &&
  mixemup $pwd_in --postfix a --max-args 3;
} > $pwd_out

# sleep
{
  mixemup $sleep_in --max-args 3 &&
  mixemup $sleep_in --postfix 0.01 --max-args 3 &&
  mixemup $sleep_in --postfix 0 --max-args 3;
} > $sleep_out

# touch
{
  mixemup $touch_in --max-args 3 &&
  mixemup $touch_in --postfix files/f1 --max-args 3;
} > $touch_out

# true
{
  mixemup $true_in --max-args 3 &&
  mixemup $true_in --postfix a --max-args 3;
} > $true_out

# uname
{
  mixemup $uname_in --max-args 3 &&
  mixemup $uname_in --postfix a --max-args 3;
} > $uname_out

# vdir
{
  mixemup $vdir_in --max-args 3 &&
  mixemup $vdir_in --postfix files/d1 --max-args 3 &&
  mixemup $vdir_in --postfix "files/d1 files/d2" --max-args 3;
} > $vdir_out
