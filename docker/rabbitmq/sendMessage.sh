HOSTNAME=localhost
PORT=8001
EXCHANGE=TopicOne
USER=user
PASSWORD=password
ROUTING_KEY=
PAYLOAD="<data>
<vehicle_id>1234</vehicle_id>
<customer_id>5678</customer_id>
</data>"


while true
do
	PAYLOAD="<data>
<vehicle_id>1234</vehicle_id>
<customer_id>5678</customer_id>
<date>$(date)</date>
</data>"
	echo "curl --request POST --user $USER:$PASSWORD --data '{"properties":{"delivery_mode": 2},"routing_key":"$ROUTING_KEY","payload":"$PAYLOAD","payload_encoding":"string"}' http://$HOSTNAME:$PORT/api/exchanges/%2f/$EXCHANGE/publish"
	curl \
	--request POST \
	--user $USER:$PASSWORD \
	--data "{\"properties\":{\"delivery_mode\": 2},\"routing_key\":\"$ROUTING_KEY\",\"payload\":\"$PAYLOAD\",\"payload_encoding\":\"string\"}"  \
	http://$HOSTNAME:$PORT/api/exchanges/%2f/$EXCHANGE/publish
	sleep 1
	echo ""
done