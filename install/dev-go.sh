#!/bin/bash

# vscode-go

# An autocompletion daemon for the Go programming language
go get -u github.com/nsf/gocode

# Print where symbols are defined in Go source code
go get -u github.com/rogpeppe/godef

# Utility to extract JSON representation of declarations from a Go source file 
go get -u github.com/ramya-rao-a/go-outline

# A gofmt/goimports-like tool for Go programmers that fills in Go return statements with zero values to match the func return types
go get -u github.com/sqs/goreturns

# The gorename command performs precise type-safe renaming of identifiers in Go source code.
go get -u golang.org/x/tools/cmd/gorename

# Command gopkgs list your installed Go packages for import.
go get -u github.com/tpng/gopkgs

# A utility for extracting a JSON representation of the package symbols from a go source tree.
go get -u github.com/acroca/go-symbols

# Generate Go tests from your source code.
go get -u github.com/cweill/gotests/...

# Gets documentation for items in Go source code.
go get -u github.com/zmb3/gogetdoc

# This is a linter for Go source code.
go get -u github.com/golang/lint/golint

# Godoc extracts and generates documentation for Go programs.
go get -u golang.org/x/tools/cmd/godoc

# guru: a tool for answering questions about Go source code.
go get -u golang.org/x/tools/cmd/guru

# Concurrently run Go lint tools and normalise their output
go get -u github.com/alecthomas/gometalinter

# Command goimports updates your Go import lines, adding missing ones and removing unreferenced ones.
go get -u golang.org/x/tools/cmd/goimports

# Go tool to modify struct field tags
go get -u github.com/fatih/gomodifytags



#go get -u github.com/Perlmint/goautoenv
