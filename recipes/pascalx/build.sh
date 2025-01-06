#!/bin/bash

# Copy or symlink the compiled libraries to $PREFIX/lib
mkdir -p $PREFIX/lib
# copy the libraries
# cp $SRC_DIR/build/lib/*.so $PREFIX/lib/  # Copying the libraries
# Alternatively, symlink
ln -s $SRC_DIR/build/lib/*.so $PREFIX/lib/

cd $SRC_DIR
make all

cd python
$PYTHON -m pip install . --no-deps -vv

# Symlink the command line interface to the user's $PATH
ln -s $PWD/../pascalx.py $PREFIX/bin/pascalx

