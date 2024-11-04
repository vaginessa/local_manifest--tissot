#!/bin/bash

set -e
#Credit to Meghthedev for the initial script and rktdnt

# Initialize repo with specified manifest
repo init -u https://github.com/alphadroid-project/manifest -b alpha-14 --git-lfs
crave set --projectID 72

crave run --no-patch -- "wget -O a.sh https://raw.githubusercontent.com/mdalam073/local_manifest/alpha-14-merlinx/a.sh && chmod +x a.sh && ./a.sh" 

# Clean up
rm -rf merlinx/

# Pull generated zip files
crave pull out/target/product/*/*.zip 

# Pull generated img files
crave pull out/target/product/*/*.img
