//
//  AccountView.swift
//  MSBAccountsJourney
//
//  Created by doandat on 12/11/24.
//
import SwiftUI

struct AccountView: View {
    let account: AccountUIModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(account.name ?? "")
                .font(.headline)
                .foregroundColor(.primary)
            
            Text(account.balanceFormatted ?? "")
                .font(.headline)
                .foregroundColor(.primary)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

// MARK: - Preview
struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(account: AccountUIModel(name: "Sample Account", balance: Currency(amount: "10000", currencyCode: "VND")))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
