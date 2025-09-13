#!/bin/bash
#
file="images.txt"
if [[ -f images.txt ]]then 
	for line in $(cat images.txt)
		cont_id="echo '$line' | awk '{ print $3 }'"
