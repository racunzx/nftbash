#!/bin/bash

# Set the API key for authentication
API_KEY="YOUR_API_KEY"

# Set the collection ID
COLLECTION_ID="COLLECTION_ID"

# Set the folder containing the NFT metadata files
METADATA_FOLDER="nft_metadata_folder"

# Loop through all the files in the folder
for file in $METADATA_FOLDER/*.json; do
  # Read the NFT metadata file line by line
  while read -r line; do
    # Get the NFT contract address and token ID
    CONTRACT_ADDRESS=$(echo $line | jq -r '.contractAddress')
    TOKEN_ID=$(echo $line | jq -r '.tokenId')

    # Upload the NFT to the collection
    curl -X POST \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $API_KEY" \
      -d "{\"token_ids\": [\"$TOKEN_ID\"], \"contract_address\": \"$CONTRACT_ADDRESS\", \"external_link\": \"\"}" \
      "https://api.opensea.io/api/v1/collections/$COLLECTION_ID/add_items"

    # Print the response
    echo ""
  done < "$file"
done
