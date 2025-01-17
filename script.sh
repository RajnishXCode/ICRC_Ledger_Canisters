# dfx identity new minter
dfx identity use minter
# export MINTER_ACCOUNT_ID=$(dfx ledger account-id)
# dfx identity use office
# export DEFAULT_ACCOUNT_ID=$(dfx ledger account-id)
# dfx identity use minter

# dfx deploy --specified-id ryjl3-tyaaa-aaaaa-aaaba-cai icp_ledger_canister --argument "
#   (variant {
#     Init = record {
#       minting_account = \"$MINTER_ACCOUNT_ID\";
#       initial_values = vec {
#         record {
#           \"$DEFAULT_ACCOUNT_ID\";
#           record {
#             e8s = 10_000_000_000 : nat64;
#           };
#         };
#       };
#       send_whitelist = vec {};
#       transfer_fee = opt record {
#         e8s = 10_000 : nat64;
#       };
#       token_symbol = opt \"LICP\";
#       token_name = opt \"Local ICP\";
#       feature_flags = opt record { icrc2 = true };
#     }
#   })
# "




# dfx deploy --specified-id mxzaz-hqaaa-aaaar-qaada-cai btc_ledger_canister --argument "
#   (variant {
#     Init = record {
#       minting_account = \"$MINTER_ACCOUNT_ID\";
#       initial_values = vec {
#         record {
#           \"$DEFAULT_ACCOUNT_ID\";
#           record {
#             e8s = 10_000_000_000 : nat64;
#           };
#         };
#       };
#       send_whitelist = vec {};
#       transfer_fee = opt record {
#         e8s = 10_000 : nat64;
#       };
#       token_symbol = opt \"LBTC\";
#       token_name = opt \"Local BTC\";
#       feature_flags = opt record { icrc2 = true };
#     }
#   })
# "

# dfx deploy --specified-id ss2fx-dyaaa-aaaar-qacoq-cai rj_ledger_canister --argument "
# dfx deploy rj_ledger_canister --argument "
#   (variant {
#     Init = record {
#       minting_account = \"$MINTER_ACCOUNT_ID\";
#       initial_values = vec {
#         record {
#           \"$DEFAULT_ACCOUNT_ID\";
#           record {
#             e8s = 10_000_000_000 : nat64;
#           };
#         };
#       };
#       send_whitelist = vec {};
#       transfer_fee = opt record {
#         e8s = 10_000 : nat64;
#       };
#       token_symbol = opt \"RJC\";
#       token_name = opt \"Local RJ-COIN\";
#       feature_flags = opt record { icrc2 = true };
#     }
#   })
# "
dfx canister call icp_ledger_canister icrc1_transfer "(record { to = record { owner = principal \"zntu5-hhlwa-qgro2-sfxt7-c2pm5-7pa6y-brjps-x7r67-35slw-5bwjq-jqe\";}; amount = 2000_000_000;})"
# dfx canister call btc_ledger_canister icrc1_transfer "(record { to = record { owner = principal \"sfwko-hd7us-gen5t-ssuci-vfjwf-afepb-a7p4y-guh5l-s5n2e-zuxvt-dae\";}; amount = 100_000_000;})"
# dfx canister call eth_ledger_canister icrc1_transfer "(record { to = record { owner = principal \"sfwko-hd7us-gen5t-ssuci-vfjwf-afepb-a7p4y-guh5l-s5n2e-zuxvt-dae\";}; amount = 100_000_000;})"

dfx identity use office
# # sfwko-hd7us-gen5t-ssuci-vfjwf-afepb-a7p4y-guh5l-s5n2e-zuxvt-dae

# dfx canister call rj_ledger_canister icrc1_transfer "(record { to = record { owner = principal \"a7bvt-75bcc-77vhh-6ljps-3d2oz-5jolv-2zuzi-4r5zk-tf6vl-qhlsm-hae\";}; amount = 50000_000_000;})"


# HL : 7rdme-3ekma-q43vc-gftmy-z4tbe-o33wx-dldtm-pnfpb-opnn3-esjbr-gae
# CN : 
# UR : lyruk-6lu53-qsd4t-7likt-kmkl2-6rvia-qbbsf-dzva6-chubv-leqgq-sae