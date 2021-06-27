#!/bin/bash
PACKAGE=ib-pkey-setup
VERSION=0.909

dh_make --copyright apache --native --indep --addmissing --packagename ${PACKAGE}_${VERSION}
