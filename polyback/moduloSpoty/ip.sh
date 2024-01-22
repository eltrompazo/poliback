#!/bin/bash

ifconfig tun0 | grep netmask | awk '{print $2}'
