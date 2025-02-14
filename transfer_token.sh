dfx identity use minter

# Perform an ICRC1 transfer from the ICP Ledger Canister.
# Replace the `to` owner principal ID with the target account's principal.
# dfx canister call icp_ledger_canister icrc1_transfer "(record { 
#   to = record { owner = principal \"fyiut-j73av-2zli6-cz2i3-cohwo-uagay-44e3e-srhfh-yofro-vfrsl-mqe\"; }; 
#   amount = 2_000_000_000;
# })"

# --------------------------------------------------------------------------------

# Step 10: Perform an ICRC1 transfer from the ckETH Ledger Canister.
# Replace the `to` owner principal ID with the target account's principal.
# dfx canister call ckEth_ledger_canister icrc1_transfer "(record { 
#   to = record { owner = principal \"fyiut-j73av-2zli6-cz2i3-cohwo-uagay-44e3e-srhfh-yofro-vfrsl-mqe\"; }; 
#   amount = 2_000_000_000;
# })"

# --------------------------------------------------------------------------------

# Step 11: Perform an ICRC2 transfer from the ckUSDC Ledger Canister.
# Replace the `to` owner principal ID with the target account's principal.
# dfx canister call ckUSDC_ledger_canister icrc1_transfer "(record { 
#   to = record { owner = principal \"jx6i7-5jspk-utdzz-ojqku-5z3q4-nsom2-dzs54-thpzl-ce3gx-siggk-iqe\"; }; 
#   amount = 2_00_000_000;
# })"

# --------------------------------------------------------------------------------

# Step 12: Perform an ICRC2 transfer from the RJ Ledger Canister.
# Replace the `to` owner principal ID with the target account's principal.
dfx canister call LIFT_ledger_canister icrc1_transfer "(record { 
  to = record { owner = principal \"fyiut-j73av-2zli6-cz2i3-cohwo-uagay-44e3e-srhfh-yofro-vfrsl-mqe\"; }; 
  amount = 2_000_000_000;
})"

# Switch back to the "office" identity.
dfx identity use office

# NOTE:
# Replace the `to` owner principal ID with the target account's principal.

