#!/bin/bash
#	default color: 178984
glyphColorOriginal=1b1d16
glyphColorNew=1b1d16

#	Front
#	default color: 36d7b7
frontColorOriginal=4e543e
frontColorNew=4e543e

#	Back
#	default color: 1ba39c
backColorOriginal=2c2f23
backColorNew=2c2f23

#	Paper
#	default color: ffffff
paperColorOriginal=ffffff
paperColorNew=ffffff

sed -i "s/#$glyphColorOriginal;/#$glyphColorNew;/g" $1
sed -i "s/#$frontColorOriginal;/#$frontColorNew;/g" $1
sed -i "s/#$backColorOriginal;/#$backColorNew;/g" $1
sed -i "s/#$paperColorOriginal;/#$paperColorNew;/g" $1
