#!/bin/bash
clear
[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"
echo "Installing M3rc4nt3 1.0.4"
wget https://www.multichain.com/download/multichain-1.0.4.tar.gz
tar -xvzf multichain-1.0.4.tar.gz
cd multichain-1.0.4
mv multichaind multichain-cli multichain-util /usr/local/bin
rm -f /root/.multichain/mercante/params.dat
mkdir /root/.multichain/mercante/
echo "
chain-protocol = bitcoin
chain-description = M3rc4nt3 is back.
chain-is-testnet = false
target-block-time = 10
maximum-block-size = 1000000
default-network-port = 8666
default-rpc-port = 8667                 

anyone-can-connect = true
anyone-can-send = true
anyone-can-receive = true
anyone-can-issue = true
anyone-can-mine = true
anyone-can-admin = true
allow-p2sh-outputs = true
allow-multisig-outputs = true

setup-first-blocks = 60
mining-diversity = 0.5
admin-consensus-admin = 0.5
admin-consensus-mine = 0.5
mining-requires-peers = false

first-block-reward = 25000000000
initial-block-reward = 25000000000
reward-halving-interval = 10000000
reward-spendable-delay = 1
minimum-per-output = -1 
maximum-per-output = 100000000000000000
minimum-relay-fee = 1000     
native-display-multiple = 100000000

skip-pow-check = false
pow-minimum-bits = 16
target-adjust-freq = 60009600
allow-min-difficulty-blocks = false

only-accept-std-txs = true
max-std-tx-size = 5000000
max-std-op-return-size = 80
max-std-op-drops-count = 0
max-std-op-drop-size = 0

chain-name = mercante
protocol-version = 10002
network-message-start = f9beb4d9
address-pubkeyhash-version = 00
address-scripthash-version = 05
private-key-version = 80
address-checksum-value = 00000000

genesis-pubkey = [null]
genesis-version = [null]
genesis-timestamp = [null]
genesis-nbits = [null]
genesis-nonce = [null]
genesis-pubkey-hash = [null]
genesis-op-return-script = [null]
genesis-hash = [null]
chain-params-hash = [null]
" > /root/.multichain/mercante/params.dat
multichaind mercante@165.227.175.233:8666 -daemon
exit

