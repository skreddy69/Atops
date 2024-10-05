module MyModule::RentalAgreementManager {

    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    /// Struct representing a rental agreement.
    struct RentalAgreement has store, key {
        deposit: u64,         // Deposit amount
        rent_due: u64,        // Monthly rent due
        landlord: address,    // Address of the landlord
        tenant: address,      // Address of the tenant
    }

    /// Function to create a new rental agreement.
    public fun create_agreement(
        landlord: &signer, 
        tenant: address, 
        deposit: u64, 
        rent_due: u64
    ) {
        let agreement = RentalAgreement {
            deposit,
            rent_due,
            landlord: signer::address_of(landlord),
            tenant,
        };
        move_to(landlord, agreement);
    }

}
