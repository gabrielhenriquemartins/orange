#!/bin/bash

current_date=$(date +"%Y-%m-%d")
robot --outputdir "/opt/robotframework/results/$current_date" /opt/robotframework/tests
