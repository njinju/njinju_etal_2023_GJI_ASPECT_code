#!/bin/bash

rm -r build_project/
mkdir build_project
cd build_project
module reset
module load CMake/3.16.4-intel-2019b
module load Lua python2
module load tinkercliffs-rome/dealii-9.2.0/intel-2019b
export ASPECT_SOURCE_DIR=/home/njinju85/tbc_compressible
export ASPECT_INSTALL_DIR=/home/njinju85/tbc_compressible/build_project
MPICXX=`which mpicxx`
MPICC=`which mpicc`
MPIF90=`which mpif90`

cmake -D CMAKE_CXX_COMPILER:FILEPATH=$MPICXX -D CMAKE_C_COMPILER:FILEPATH=$MPICC -D CMAKE_Fortran_COMPILER:FILEPATH=$MPIF90 -DDEAL_II_DIR=$DEAL_II_DIR -DCMAKE_INSTALL_PREFIX=${ASPECT_INSTALL_DIR} ${ASPECT_SOURCE_DIR}
make VERBOSE=1 -j12
make install
