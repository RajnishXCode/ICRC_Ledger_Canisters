# Step 1: Create a new identity for the "minter" role.
dfx identity new minter

# Step 2: Switch to the "minter" identity.
dfx identity use minter

# Step 3: Get the account ID for the "minter" identity and store it in the MINTER_ACCOUNT_ID variable.
export MINTER_ACCOUNT_ID=$(dfx ledger account-id)

# Step 4: Switch to the "office" identity to fetch its account ID.
# This identity will be used to receive initial tokens in the ledger canisters.
# You can replace "office" with any other identity you want to use.
dfx identity use office

# Step 5: Get the account ID for the "office" identity and store it in the DEFAULT_ACCOUNT_ID variable.
export DEFAULT_ACCOUNT_ID=$(dfx ledger account-id)

# Step 6: Switch back to the "minter" identity to perform further operations.
dfx identity use minter

# --- Below 3 Ledger Canisters are created for ICP, BTC, and RJ tokens respectively. ---
# -- Deploy the canisters with the your own configurations. --
# -- Customize the canister IDs, token details, and amounts as needed for your use case. --

# Step 7: Deploy the ICP Ledger Canister.
# Replace `ryjl3-tyaaa-aaaaa-aaaba-cai` with your desired canister ID.
dfx deploy --specified-id ryjl3-tyaaa-aaaaa-aaaba-cai icp_ledger_canister --argument "
  (variant {
    Init = record {
      minting_account = \"$MINTER_ACCOUNT_ID\"; # Set the minter's account ID.
      initial_values = vec {
        record {
          \"$DEFAULT_ACCOUNT_ID\"; # Assign initial tokens to the office account.
          record {
            e8s = 10_000_000_000 : nat64; # 10 ICP tokens in e8s (1 ICP = 100,000,000 e8s).
          };
        };
      };
      send_whitelist = vec {}; # Specify addresses allowed to receive transfers (empty = unrestricted).
      transfer_fee = opt record {
        e8s = 10_000 : nat64; # Transfer fee of 0.0001 ICP.
      };
      token_symbol = opt \"MY-ICP\"; # Symbol for the token.
      token_name = opt \"Local ICP\"; # Name of the token.
      feature_flags = opt record { icrc2 = true }; # Enable ICRC2 features.
    }
  })
"

# Step 8: Deploy the BTC Ledger Canister.
# Replace `mxzaz-hqaaa-aaaar-qaada-cai` with your desired canister ID.
dfx deploy --specified-id mxzaz-hqaaa-aaaar-qaada-cai btc_ledger_canister --argument "
  (variant {
    Init = record {
      minting_account = \"$MINTER_ACCOUNT_ID\"; # Set the minter's account ID.
      initial_values = vec {
        record {
          \"$DEFAULT_ACCOUNT_ID\"; # Assign initial tokens to the office account.
          record {
            e8s = 10_000_000_000 : nat64; # 10 BTC tokens in e8s.
          };
        };
      };
      send_whitelist = vec {}; # Specify addresses allowed to receive transfers (empty = unrestricted).
      transfer_fee = opt record {
        e8s = 10_000 : nat64; # Transfer fee of 0.0001 BTC.
      };
      token_symbol = opt \"LBTC\"; # Symbol for the token.
      token_name = opt \"Local BTC\"; # Name of the token.
      feature_flags = opt record { icrc2 = true }; # Enable ICRC2 features.
    }
  })
"

# Step 9: Deploy the RJ Ledger Canister.
# Replace `ss2fx-dyaaa-aaaar-qacoq-cai` with your desired canister ID.
dfx deploy --specified-id ss2fx-dyaaa-aaaar-qacoq-cai rj_ledger_canister --argument "
  (variant {
    Init = record {
      minting_account = \"$MINTER_ACCOUNT_ID\"; # Set the minter's account ID.
      initial_values = vec {
        record {
          \"$DEFAULT_ACCOUNT_ID\"; # Assign initial tokens to the office account.
          record {
            e8s = 10_000_000_000 : nat64; # 10 RJ tokens in e8s.
          };
        };
      };
      send_whitelist = vec {}; # Specify addresses allowed to receive transfers (empty = unrestricted).
      transfer_fee = opt record {
        e8s = 10_000 : nat64; # Transfer fee of 0.0001 RJ.
      };
      token_symbol = opt \"RJC\"; # Symbol for the token.
      token_name = opt \"Local RJ-COIN\"; # Name of the token.
      feature_flags = opt record { icrc2 = true }; # Enable ICRC2 features.
    }
  })
"

# Step 10: Perform an ICRC1 transfer from the ICP Ledger Canister.
# Replace the `to` owner principal ID with the target account's principal.
dfx canister call icp_ledger_canister icrc1_transfer "(record { 
  to = record { owner = principal \"oet34-p2e2h-wp2yv-jy7kz-kgscj-bj5j2-a72fh-ivb26-at2ss-htoiu-vae\"; }; 
  amount = 2_000_000_000; # Transfer 2 ICP tokens in e8s.
})"

# Step 11: Switch back to the "office" identity.
dfx identity use office

# Notes:
# - Replace `principal` IDs with actual target principals for each transaction.
# - Customize canister IDs, token details, and amounts as needed for your use case.
# - Always ensure your ledger canisters are correctly configured before deployment.
