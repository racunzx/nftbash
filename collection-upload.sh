#!/bin/bash

# Define variables for the API endpoint and the API key
endpoint="https://api.opensea.io/api/v1/collections"
api_key="YOUR_API_KEY_HERE"

# Define the JSON payload with the collection metadata
json_payload='{
    "name": "Example Collection",
    "description": "This is an example collection description.",
    "external_link": "https://example.com",
    "image_url": "https://example.com/collection-image.jpg",
    "assets": [
        {
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
        },
        {
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
        }
    ]
}'

# Make the API request using curl
curl -X POST "$endpoint" \
     -H "Content-Type: application/json" \
     -H "Authorization: Bearer $api_key" \
     -d "$json_payload"
