#!/bin/bash
clear
[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"
echo "Installing M3rc4nt3 1.0b
                                     _                ___  __ 
                                    | |              / _ \/_ |
  _ __ ___   ___ _ __ ___ __ _ _ __ | |_ ___  __   _| | | || |
 | '_ ` _ \ / _ \ '__/ __/ _` | '_ \| __/ _ \ \ \ / / | | || |
 | | | | | |  __/ | | (_| (_| | | | | ||  __/  \ V /| |_| || |
 |_| |_| |_|\___|_|  \___\__,_|_| |_|\__\___|   \_(_)\___(_)_|
                                                              
                                                              

"
git clone https://github.com/M3rc4nt3/mercante1.0b.git
cd mercante1.0b
mv mercanted mercante-cli mercante-util /usr/local/bin/
mkdir /root/.mercante
mkdir /root/.mercante/mercante
echo "
# ==== Mercante configuration file ====

# Created by mercante-util 
# Protocol version: 10002 

# This parameter set is VALID. 
# To join network please run "mercanted mercante".

# The following parameters can only be edited if this file is a prototype of another configuration file. 
# Please run "mercante-util clone mercante <new-network-name>" to generate new network. 


# Basic chain parameters

chain-protocol = bitcoin                # Chain protocol: mercante (permissions, native assets) or bitcoin
chain-description = M3rc4nt3 cryptocurrency2017. # Chain description, embedded in genesis block coinbase, max 90 chars.
chain-is-testnet = false                # Content of the 'testnet' field of API responses, for compatibility.
target-block-time = 10                  # Target time between blocks (transaction confirmation delay), seconds. (2 - 86400)
maximum-block-size = 1000000            # Maximum block size in bytes. (5000 - 1000000000)

# Global permissions

anyone-can-connect = true               # Anyone can connect, i.e. a publicly readable blockchain.
anyone-can-send = true                  # Anyone can send, i.e. transaction signing not restricted by address.
anyone-can-receive = true               # Anyone can receive, i.e. transaction outputs not restricted by address.
anyone-can-issue = true                 # Anyone can issue new native assets.
anyone-can-mine = true                  # Anyone can mine blocks (confirm transactions).
anyone-can-admin = true                 # Anyone can grant or revoke all permissions.
allow-p2sh-outputs = true               # Allow pay-to-scripthash (P2SH) scripts, often used for multisig. Ignored if allow-arbitrary-outputs=true.
allow-multisig-outputs = true           # Allow bare multisignature scripts, rarely used but still supported. Ignored if allow-arbitrary-outputs=true.

# Consensus requirements

setup-first-blocks = 60                 # Length of initial setup phase in blocks, in which mining-diversity,
                                        # admin-consensus-* and mining-requires-peers are not applied. (1 - 31536000)
mining-diversity = 0.5                  # Miners must wait <mining-diversity>*<active miners> between blocks. (0 - 1)
admin-consensus-admin = 0.5             # <admin-consensus-admin>*<active admins> needed to change admin perms. (0 - 1)
admin-consensus-mine = 0.5              # <admin-consensus-mine>*<active admins> to change mining permissions. (0 - 1)
mining-requires-peers = false           # Nodes only mine blocks if connected to other nodes (ignored if only one permitted miner).

# Native blockchain currency (likely not required)

initial-block-reward = 25000000000      # Initial block mining reward in raw native currency units. (0 - 1000000000000000000)
first-block-reward = 25000000000        # Different mining reward for first block only, ignored if negative. (-1 - 1000000000000000000)
reward-halving-interval = 10000000      # Interval for halving of mining rewards, in blocks. (60 - 1000000000)
reward-spendable-delay = 1              # Delay before mining reward can be spent, in blocks. (1 - 100000)
minimum-per-output = -1                 # Minimum native currency per output (anti-dust), in raw units.
                                        # If set to -1, this is calculated from minimum-relay-fee. (-1 - 1000000000)
maximum-per-output = 100000000000000000 # Maximum native currency per output, in raw units. (0 - 1000000000000000000)
minimum-relay-fee = 1000                # Minimum transaction fee, per 1000 bytes, in raw units of native currency. (0 - 1000000000)
native-currency-multiple = 100000000    # Number of raw units of native currency per display unit. (0 - 1000000000)

# Advanced mining parameters

skip-pow-check = false                  # Skip checking whether block hashes demonstrate proof of work.
pow-minimum-bits = 16                   # Initial and minimum proof of work difficulty, in leading zero bits. (1 - 32)
target-adjust-freq = 1209600            # Interval between proof of work difficulty adjustments, in seconds, if negative - never adjusted. (-1 - 4294967295)
allow-min-difficulty-blocks = false     # Allow lower difficulty blocks if none after 2*<target-block-time>.

# Standard transaction definitions

only-accept-std-txs = true              # Only accept and relay transactions which qualify as 'standard'.
max-std-tx-size = 5000000               # Maximum size of standard transactions, in bytes. (1024 - 100000000)
max-std-op-return-size = 80             # Maximum size of OP_RETURN metadata in standard transactions, in bytes. (0 - 67108864)
max-std-op-drops-count = 0              # Maximum number of OP_DROPs per output in standard transactions. (0 - 100)
max-std-op-drop-size = 0                # Obsolete. Maximum size of OP_DROP metadata in standard transactions, in bytes. (0 - 32768)

# The following parameters were generated by mercante-util.
# They SHOULD ONLY BE EDITED IF YOU KNOW WHAT YOU ARE DOING. 

default-network-port = 8666             # Default TCP/IP port for peer-to-peer connection with other nodes.
default-rpc-port = 8667                 # Default TCP/IP port for incoming JSON-RPC API requests.
chain-name = mercante                   # Chain name, used as first argument for mercanted and mercante-cli.
protocol-version = 10002                # Protocol version at the moment of blockchain genesis.
network-message-start = f9beb4d9        # Magic value sent as the first 4 bytes of every peer-to-peer message.
address-pubkeyhash-version = 00         # Version bytes used for pay-to-pubkeyhash addresses.
address-scripthash-version = 05         # Version bytes used for pay-to-scripthash addresses.
private-key-version = 80                # Version bytes used for exporting private keys.
address-checksum-value = 00000000       # Bytes used for XOR in address checksum calculation.

# The following parameters were generated by mercanted.
# They SHOULD NOT BE EDITED. 

genesis-pubkey = 02088c02d1c1eae8251ae3b6e78d752fc05ce78a89ec40d1dc09048e438741dc6d # Genesis block coinbase output public key.
genesis-version = 1                     # Genesis block version.
genesis-timestamp = 1527448519          # Genesis block timestamp.
genesis-nbits = 520159231               # Genesis block difficulty (nBits).
genesis-nonce = 33112                   # Genesis block nonce.
genesis-pubkey-hash = 75f101ca39f15b077bb0c82464d85aa600fcc942 # Genesis block coinbase output public key hash.
genesis-op-return-script = 5b6e6f74207365745d # Genesis block coinbase OP_RETURN script.
genesis-hash = 0000d412c28c27570d2441316c80c7cdb8af25030c9ba8e13f9cb5f2e818da86 # Genesis block hash.
chain-params-hash = ca652eb7df52f6e8358ed8572f68f235f41bba6caf8fd4b6334405e39c177450 # Hash of blockchain parameters, to prevent accidental changes.
" > /root/.mercante/mercante/params.dat
mercanted mercante@209.97.138.252:8666
echo 'For interactive mode 

mercante-cli mercante

to stop the daemon
mercante-cli mercante stop

Have fun. 
il M3rc4nt3
'
cd ..
rm -r mercante1.0b
rm mercante_linux_1.0b.tar.gz
exit
