#!/bin/bash

XAGENT_URL="https://10.0.1.1/:8081/api/integration/1/functions/UUID/triggers?apiKey=API_KEY"
curl -X POST $XAGENT_URL