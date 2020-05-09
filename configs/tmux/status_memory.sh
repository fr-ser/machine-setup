#!/bin/bash
free -h | awk 'NR==2{printf "RAM: %s/%s", $3,$2 }'