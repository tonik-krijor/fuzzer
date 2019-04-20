#!/bin/bash

# Creates pre-files for the `cat` command.
cat_in_dir="args/cat.txt"
cat_out_dir="pre/cat.txt"
{
  mixemup $cat_in_dir --max-args 3 &&
  mixemup $cat_in_dir --postfix files/f1 --max-args 3;
} > $cat_out_dir

# Creates pre-files for the `cp` command.
cp_in_dir="args/cp.txt"
cp_out_dir="pre/cp.txt"
{
  mixemup $cp_in_dir --max-args 3 &&
  mixemup $cp_in_dir --postfix "files/f1 files/f2" --max-args 3;
} > $cp_out_dir

# Creates pre-files for the `date` command.
date_in_dir="args/date.txt"
date_out_dir="pre/date.txt"
{
  mixemup $date_in_dir --max-args 3;
} > $date_out_dir

# Creates pre-files for the `dd` command.
dd_in_dir="args/dd.txt"
dd_out_dir="pre/dd.txt"
{ 
  mixemup $dd_in_dir --max-args 3 --postfix "if=files/f1 of=files/f2";
} > $dd_out_dir

# Creates pre-files for the `df` command.
df_in_dir="args/df.txt"
df_out_dir="pre/df.txt"
{ 
  mixemup $df_in_dir --max-args 3;
} > $df_out_dir

# Creates pre-files for the `dir` command.
dir_in_dir="args/dir.txt"
dir_out_dir="pre/dir.txt"
{ 
  mixemup $dir_in_dir --max-args 3 &&
  mixemup $dir_in_dir --max-args 3 --postfix files;
} > $dir_out_dir

# Creates pre-files for the `echo` command.
echo_in_dir="args/echo.txt"
echo_out_dir="pre/echo.txt"
{ 
  mixemup $echo_in_dir --max-args 3 &&
  mixemup $echo_in_dir --max-args 3 --postfix files;
} > $echo_out_dir

# Creates pre-files for the `false` command.
false_in_dir="args/false.txt"
false_out_dir="pre/false.txt"
{ 
  mixemup $false_in_dir --max-args 3 &&
  mixemup $false_in_dir --max-args 3 --postfix files;
} > $false_out_dir

# Creates pre-files for the `ln` command.
ln_in_dir="args/ln.txt"
ln_out_dir="pre/ln.txt"
{ 
  mixemup $ln_in_dir --max-args 3 &&
  mixemup $ln_in_dir --max-args 3 --postfix "files/f1 files/f2";
} > $ln_out_dir

# Creates pre-files for the `ls` command.
ls_in_dir="args/ls.txt"
ls_out_dir="pre/ls.txt"
{ 
  mixemup $ls_in_dir --max-args 3 &&
  mixemup $ls_in_dir --max-args 3 --postfix files;
} > $ls_out_dir

# Creates pre-files for the `mkdir` command.
mkdir_in_dir="args/cat.txt"
mkdir_out_dir="pre/cat.txt"
{
  mixemup $mkdir_in_dir --max-args 3 &&
  mixemup $mkdir_in_dir --postfix files/d1 --max-args 3;
} > $mkdir_out_dir

# Creates pre-files for the `mkdir` command.
mkdir_in_dir="args/mkdir.txt"
mkdir_out_dir="pre/mkdir.txt"
{ 
  mixemup $mkdir_in_dir --max-args 3 &&
  mixemup $mkdir_in_dir --postfix files/d1 --max-args 3; 
} > $mkdir_out_dir

# Creates pre-files for the `mktemp` command.
mktemp_in_dir="args/mktemp.txt"
mktemp_out_dir="pre/mktemp.txt"
{ 
  mixemup $mktemp_in_dir --max-args 3 &&
  mixemup $mktemp_in_dir --postfix helloXXXXXX --max-args 3;
} > $mktemp_out_dir

# Creates pre-files for the `mv` command.
mv_in_dir="args/mv.txt"
mv_out_dir="pre/mv.txt"
{
  mixemup $mv_in_dir --max-args 3 &&
  mixemup $mv_in_dir --postfix files/d3 --max-args 3;
} > $mv_out_dir

# Creates pre-files for the `printf` command.
printf_in_dir="args/printf.txt"
printf_out_dir="pre/printf.txt"
{
  mixemup $printf_in_dir --max-args 3 &&
  mixemup $printf_in_dir --postfix helloworld --max-args 3;
} > $printf_out_dir

# Creates pre-files for the `pwd` command.
pwd_in_dir="args/pwd.txt"
pwd_out_dir="pre/pwd.txt"
{
  mixemup $pwd_in_dir --max-args 3 &&
  mixemup $pwd_in_dir --postfix helloworld --max-args 3;
} > $pwd_out_dir

# Creates pre-files for the `sleep` command.
sleep_in_dir="args/sleep.txt"
sleep_out_dir="pre/sleep.txt"
{
  mixemup $sleep_in_dir --max-args 3 &&
  mixemup $sleep_in_dir --postfix 0.01 --max-args 3 &&
  mixemup $sleep_in_dir --postfix 0 --max-args 3;
} > $sleep_out_dir

# Creates pre-files for the `touch` command.
touch_in_dir="args/touch.txt"
touch_out_dir="pre/touch.txt"
{
  mixemup $touch_in_dir --max-args 3 &&
  mixemup $touch_in_dir --postfix files/f1 --max-args 3;
} > $touch_out_dir

# Creates pre-files for the `true` command.
true_in_dir="args/true.txt"
true_out_dir="pre/true.txt"
{
  mixemup $true_in_dir --max-args 3 &&
  mixemup $true_in_dir --postfix helloworld --max-args 3;
} > $true_out_dir

# Creates pre-files for the `uname` command.
uname_in_dir="args/uname.txt"
uname_out_dir="pre/uname.txt"
{
  mixemup $uname_in_dir --max-args 3 &&
  mixemup $uname_in_dir --postfix helloworld --max-args 3;
} > $uname_out_dir

# Creates pre-files for the `vdir` command.
vdir_in_dir="args/vdir.txt"
vdir_out_dir="pre/vdir.txt"
{
  mixemup $vdir_in_dir --max-args 3 &&
  mixemup $vdir_in_dir --postfix helloworld --max-args 3;
} > $vdir_out_dir
