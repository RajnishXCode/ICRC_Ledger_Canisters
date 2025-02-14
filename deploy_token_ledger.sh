# Step 1: Create a new identity for the "minter" role.
# dfx identity new minter

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
      minting_account = \"$MINTER_ACCOUNT_ID\"; 
      initial_values = vec {
        record {
          \"$DEFAULT_ACCOUNT_ID\"; 
          record {
            e8s = 10_000_000_000 : nat64; 
          };
        };
      };
      send_whitelist = vec {}; 
      transfer_fee = opt record {
        e8s = 10_000 : nat64; 
      };
      token_symbol = opt \"MY-ICP\";
      token_name = opt \"Local ICP\"; 
      feature_flags = opt record { icrc2 = true };
    }
  })
"

# Step 8: Deploy the ckUSDC  Ledger Canister. (e6s)
# Replace `xevnm-gaaaa-aaaar-qafnq-cai` with your desired canister ID.
dfx deploy --specified-id xevnm-gaaaa-aaaar-qafnq-cai ckUSDC_ledger_canister --argument "
  (variant {
    Init = record {
      minting_account = \"$MINTER_ACCOUNT_ID\";
      initial_values = vec {
        record {
          \"$DEFAULT_ACCOUNT_ID\";
          record {
            e6s = 10_000_000_000 : nat64;
          };
        };
      };
      send_whitelist = vec {};
      transfer_fee = opt record {
        e6s = 1_000 : nat64;
      };
      token_symbol = opt \"ckUSDC\";
      token_name = opt \"Local ckUSDC\";
      feature_flags = opt record { icrc2 = true };
    }
  })
"

# Step 9: Deploy the LIFT Ledger Canister. (Custom Token)
# Replace `ss2fx-dyaaa-aaaar-qacoq-cai` with your desired canister ID.
dfx deploy --specified-id ss2fx-dyaaa-aaaar-qacoq-cai LIFT_ledger_canister --argument "
  (variant {
    Init = record {
      minting_account = \"$MINTER_ACCOUNT_ID\";
      initial_values = vec {
        record {
          \"$DEFAULT_ACCOUNT_ID\";
          record {
            e8s = 10_000_000_000 : nat64;
          };
        };
      };
      send_whitelist = vec {};
      transfer_fee = opt record {
        e8s = 10_000 : nat64;
      };
      token_symbol = opt \"LIFT\";
      token_name = opt \"LIFT Token\";
      feature_flags = opt record { icrc2 = true };
    }
  })
"

# Step 11: Switch back to the "office" identity.
dfx identity use office

# Notes:
# - Customize canister IDs, token details, and amounts as needed for your use case.
# - Always ensure your ledger canisters are correctly configured before deployment.

