set -e

MDL=$1

mkdir -p cache outputs_block
mkdir -p cache outputs_control
mkdir -p cache outputs_api
python generate.py \
       $MDL \
       block \
       cache/${MDL}-fim-tb.json \
       outputs_block/${MDL}-fim-tb.jsonl \
       fewshot \
       --post_processors extract_code truncate_fewshot truncate_line_until_block \
       --sample_n 20

python generate.py \
       $MDL \
       control \
       cache/${MDL}-fim-tc.json \
       outputs_control/${MDL}-fim-tc.jsonl \
       fewshot \
       --post_processors extract_code truncate_fewshot truncate_control \
       --sample_n 20

python generate.py \
       $MDL \
       api \
       cache/${MDL}-fim-ta.json \
       outputs_api/${MDL}-fim-ta.jsonl \
       fewshot \
       --post_processors extract_code truncate_fewshot truncate_api_call \
       --sample_n 20
