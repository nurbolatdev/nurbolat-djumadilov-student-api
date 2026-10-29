#!/bin/bash
# API test with curl - Nurbolat Djumadilov, IT2-2313
# Run after: docker compose up -d
URL="http://localhost:8080/api/students"

echo "1) CREATE student"
curl -s -i -X POST "$URL" -H "Content-Type: application/json" \
  -d '{"firstName":"Nurbolat","lastName":"Djumadilov","email":"nurbolat.djumadilov@iitu.edu.kz","groupName":"IT2-2313"}'
echo; echo

echo "2) GET all students"
curl -s -i "$URL"
echo; echo

ID=$(curl -s "$URL" | grep -o '"id":[0-9]*' | tail -1 | cut -d: -f2)
echo "3) GET student by id = $ID"
curl -s -i "$URL/$ID"
echo; echo

echo "4) UPDATE student $ID"
curl -s -i -X PUT "$URL/$ID" -H "Content-Type: application/json" \
  -d '{"firstName":"Nurbolat","lastName":"Djumadilov","email":"nurbolat.djumadilov@iitu.edu.kz","groupName":"SE-2027"}'
echo; echo

echo "5) DELETE student $ID"
curl -s -i -X DELETE "$URL/$ID"
echo; echo

echo "6) GET nonexistent student (id = 99999)"
curl -s -i "$URL/99999"
echo
