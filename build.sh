#!/bin/sh
sbcl --non-interactive --load random-web.asd --eval '(ql:quickload :random-web)' --eval '(asdf:make :random-web)' --eval '(quit)'
