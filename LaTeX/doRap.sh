#!/bin/bash
OUT_NAME=rapport.pdf

pdflatex rapport.tex
pdfjoin 001-Garde.pdf rapport.pdf --rotateoversize false  -o $OUT_NAME

