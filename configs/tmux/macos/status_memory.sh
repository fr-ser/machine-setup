#!/bin/bash

human_readable_pressure=$(memory_pressure | tail -1)
percent_value=${human_readable_pressure#*:}

echo "free RAM:$percent_value"
