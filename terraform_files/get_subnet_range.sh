#!/bin/bash
SUBNET=$(docker inspect --type network kind | jq -r '.[0].IPAM.Config[0].Subnet')
IP=${SUBNET%/*}
MASK=${SUBNET#*/}
IFS='.' read -r a b c d <<< "$IP"
END_IP="$a.$b.$c.10"
RANGE="$SUBNET - $END_IP/$MASK"
echo "{\"range\":\"$RANGE\"}"