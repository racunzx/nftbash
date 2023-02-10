#!/bin/bash

# Define variables for the API endpoint, the API key, and the number of assets per iteration
endpoint="https://api.opensea.io/api/v1/assets"
api_key="YOUR_API_KEY_HERE"
assets_per_iteration=10

# Define an array with the JSON payloads for each asset
declare -a assets=(
'{
    "name": "Asset 1",
    "description": "This is the description for Asset 1.",
    "external_link": "https://example.com/asset1",
    "image_url": "https://example.com/asset1-image.jpg",
    "attributes": [
        {
            "trait_type": "color",
            "value": "red"
        },
        {
            "trait_type": "size",
            "value": "small"
        }
    ]
}'
'{
    "name": "Asset 2",
    "description": "This is the description for Asset 2.",
    "external_link": "https://example.com/asset2",
    "image_url": "https://example.com/asset2-image.jpg",
    "attributes": [
        {
            "trait_type": "color",
            "value": "blue"
        },
        {
            "trait_type": "size",
            "value": "large"
        }
    ]
}'
...
'{
    "name": "Asset 1000",
    "description": "This is the description for Asset 1000.",
    "external_link": "https://example.com/asset1000",
    "image_url": "https://example.com/asset1000-image.jpg",
    "attributes": [
        {
            "trait_type": "color",
            "value": "green"
        },
        {
            "trait_type": "size",
            "value": "medium"
        }
    ]
}'
)

# Calculate the number of iterations required to upload all assets
num_assets=${#assets[@]}
num_iterations=$((num_assets / assets_per_iteration + (num_assets % assets_per_iteration > 0)))

# Loop through the iterations and upload the assets
for i in $(seq 1 $num_iterations); do
  start=$(((i - 1) * assets_per_iteration))
  end=$((i * assets_per_iteration - 1))
  if [ $end -ge $num_assets ]; then
    end=$((num_assets - 1))
  fi

  # Define the JSON payload with the current set of assets
  json_payload='['
  for j in $(seq $start $end); do
    asset="${assets[j]}"
    json_payload="$json
