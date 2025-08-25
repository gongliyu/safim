set -e

MDL=$1

mkdir -p results_block
python evaluate.py \
  block \
  outputs_block/${MDL}-fim-tb.jsonl \
  results_block/${MDL}-fim-tb.jsonl \
  --sample_n 20

mkdir -p results_control
python evaluate.py \
  control \
  outputs_control/${MDL}-fim-tc.jsonl \
  results_control/${MDL}-fim-tc.jsonl \
  --sample_n 20

mkdir -p results_api
python evaluate.py \
  api \
  outputs_api/${MDL}-fim-ta.jsonl \
  results_api/${MDL}-fim-ta.jsonl \
  --sample_n 20
