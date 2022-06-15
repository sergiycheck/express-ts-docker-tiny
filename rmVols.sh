#!/bin/sh
command docker volume rm $(docker volume ls -q)