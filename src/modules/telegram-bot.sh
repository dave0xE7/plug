#!/bin/bash


# https://api.telegram.org/bot<token>/METHOD_NAME

token="987778764:AAEPxxoPmkv6h_i2tDncPdB_0lLEtiJb4vM"

tele_url="https://api.telegram.org/bot${token}"


#curl -s "${tele_url}/getMe" | json_reformat
#{"ok":true,"result":{"id":547870369,"is_bot":true,"first_name":"epsi_bot","username":"epsi_bot"}}

echo ""

#curl -s "${tele_url}/getUpdates" | json_reformat

updates=$(curl -s "${tele_url}/getUpdates" | jq -r ".result")

funtion tell() {
	curl -s "${tele_url}/sendMessage?chat_id=${chat_id}" \
  --data-urlencode "text=Thank you for visiting" | json_reformat
}
