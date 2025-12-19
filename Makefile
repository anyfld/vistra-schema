.PHONY: generate lint clean

generate:
	@rm -rf ../vistra-operation-control-room/gen/proto
	@rm -rf ../vistra-exective-producer/src/gen/proto
	@rm -rf ../vistra-director/poc/gen/proto
	buf generate
	@echo "✓ Generated Go code to ../vistra-operation-control-room/gen/proto"
	@echo "✓ Generated TypeScript code to ../vistra-exective-producer/src/gen/proto"
	@echo "✓ Generated Python code to ../vistra-director/poc/gen/proto"

lint:
	buf lint

clean:
	rm -rf ../vistra-operation-control-room/gen/proto
	rm -rf ../vistra-exective-producer/src/gen/proto
	rm -rf ../vistra-director/poc/gen/proto
