#!/bin/bash

# Define variables for the API endpoint and the API key
endpoint="https://api.opensea.io/api/v1/assets"
api_key="YOUR_API_KEY_HERE"

# Define the JSON payload with the asset metadata
json_payload='{
    "name": "Example Asset",
    "description": "This is an example asset description.",
    "external_link": "https://example.com",
    "image_url": "https://example.com/asset-image.jpg",
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

# Make the API request using curl
curl -X POST "$endpoint" \
     -H "Content-Type: application/json" \
     -H "Authorization: Bearer $api_key" \
     -d "$json_payload"
