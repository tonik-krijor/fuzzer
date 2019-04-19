#!/bin/bash

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
  mixemup $mktemp_in_dir --postfix files/d2 --max-args 3;
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
