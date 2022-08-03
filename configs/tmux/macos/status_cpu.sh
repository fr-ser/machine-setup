#!/bin/bash

idle_CPU=$(top -F -R -l1  -c e  -ncols 1 -n 1 | grep CPU | cut -d" " -f7)

echo "free CPU: $idle_CPU"
