#!/bin/bash
go env

export CGO_CFLAGS="-I$PWD/third-party/terarkdb/output/output/include"
export CGO_LDFLAGS="-L$PWD/third-party/terarkdb/output/lib -Wl,-Bstatic -lrocksdb -lbz2 -ljemalloc -llz4 -lsnappy -lz -lzstd -Wl,-Bdynamic -lstdc++ -lm -pthread -lgomp -lrt -ldl -laio"

go get github.com/tecbot/gorocksdb
go test -bench 'Benchmark' | tee output.txt
