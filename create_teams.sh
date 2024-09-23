#!/bin/bash

# Add <auth_token> below
AUTH_TOKEN="<auth_token>"

# Loop from 02 to 99
for i in $(seq -w 2 99)
do
    TEAM_NAME="Team$i"
    echo "Creating $TEAM_NAME"

    # Send the POST request
    curl -X POST "https://api.kudosapp.dev/identity/teams" \
        -H "Authorization: Bearer $AUTH_TOKEN" \
        -H "Content-Type: application/json" \
        -d '{"name": "'"$TEAM_NAME"'", "description": ""}'

    echo -e "\n"
done
