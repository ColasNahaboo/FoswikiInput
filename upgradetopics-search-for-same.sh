#!/bin/bash
# script to be run in data/Input, as user www
# it appends a %SEARCH string in all topics just before the metadata
# this can serve as an example for other topic upgrading tasks

l=`grep -l '%META:FORM{' *.txt` 

for i in $l; do
  name="${i%%_*}"
ed -s $i >/dev/null <<EOF
H
/^%META:FORM{
i
%SEARCH{"^${name}_.*" regex="on" scope="topic" header="   * Items in this Input web relative to the same upstream entry: (you may want to set their status to DONE too if you set it here)" format="      * [[\$topic]]" nonoise="on" reverse="on" excludetopic="%TOPIC%"}%

.
wq
EOF
done

