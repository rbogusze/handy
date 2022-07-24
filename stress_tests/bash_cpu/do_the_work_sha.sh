#!/bin/bash

zcat sample.txt.gz | sha1sum > /dev/null
