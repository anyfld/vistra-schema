.PHONY: generate lint clean

generate:
	@rm -rf ../vistra-operation-control-room/gen/proto
	@rm -rf ../vistra-exective-producer/src/gen/proto
	@rm -rf ../vistra-director/gen/proto
	buf generate
	@find ../vistra-director/gen -type d -exec touch {}/__init__.py \;
	@echo "# Generated automatically. Do not edit." > ../vistra-director/gen/__init__.py
	@echo "" >> ../vistra-director/gen/__init__.py
	@echo "from . import proto" >> ../vistra-director/gen/__init__.py
	@echo "# Generated automatically. Do not edit." > ../vistra-director/gen/proto/__init__.py
	@echo "" >> ../vistra-director/gen/proto/__init__.py
	@echo "from . import v1" >> ../vistra-director/gen/proto/__init__.py
	@python3 -c "import os, glob; v1_dir = '../vistra-director/gen/proto/v1'; files = [os.path.basename(f)[:-3] for f in glob.glob(os.path.join(v1_dir, '*_pb2.py')) + glob.glob(os.path.join(v1_dir, '*_connect.py'))]; imports = '\n'.join([f'from . import {f}' for f in sorted(set(files))]); open(os.path.join(v1_dir, '__init__.py'), 'w').write(f'# Generated automatically. Do not edit.\n\n{imports}\n')"
	@echo "✓ Generated Go code to ../vistra-operation-control-room/gen/proto"
	@echo "✓ Generated TypeScript code to ../vistra-exective-producer/src/gen/proto"
	@echo "✓ Generated Python code to ../vistra-director/gen/proto"

lint:
	buf lint

clean:
	rm -rf ../vistra-operation-control-room/gen/proto
	rm -rf ../vistra-exective-producer/src/gen/proto
	rm -rf ../vistra-director/gen/proto
