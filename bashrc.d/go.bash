if [ -d ${HOME}/src/go ]; then
    export GOPATH=${HOME}/src/go
    export GOBIN=$GOPATH/bin
    pathadd ${GOBIN}
    export GO15VENDOREXPERIMENT=1
fi
