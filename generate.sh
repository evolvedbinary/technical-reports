#!/usr/bin/env bash

set -e

for i in "$@"
do
case $i in
    -l|--latex)
    LATEX=YES
    shift # past argument with no value
    ;;
    *)
            # unknown option
    ;;
esac
done

INPUT_MD=$1
OUTPUT_PDF=$2

if [ -n "${LATEX}" ]
then
	pandoc -t latex --include-in-header=fontoptions.tex --variable papersize=a4paper -s "${INPUT_MD}" -o "${OUTPUT_PDF}"
else
	pandoc --pdf-engine=xelatex --include-in-header=fontoptions.tex --variable colorlinks=true --variable papersize=a4paper -s "${INPUT_MD}" -o "${OUTPUT_PDF}"
fi
