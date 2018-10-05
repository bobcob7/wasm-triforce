all: wasm-triforce

wasm-triforce: main.wasm main.go
	go build -o wasm-triforce main.go

main.wasm: bundle.go
	GOOS=js GOARCH=wasm go build -o main.wasm bundle.go

run: main.wasm wasm-triforce
	./wasm-triforce

clean:
	rm -f wasm-triforce *.wasm
