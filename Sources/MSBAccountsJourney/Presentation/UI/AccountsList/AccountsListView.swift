//
//  AccountsListView.swift
//  MSBAccountsJourney
//
//  Created by datdv1 on 28/11/24.
//

import SwiftUI
import Combine
import MSBCoreUI

struct AccountsListView: MSBView {
    var identifier: String = String(describing: Self.self)
    
    var viewModel: AccountsListViewModel
    @State private var showLoading = false
    
    init(viewModel: AccountsListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            VStack {
                if let account = viewModel.allAccounts.first {
                    AccountView(account: account) // Bind data to a custom SwiftUI AccountView
                        .padding()
                } else {
                    Text("No Accounts Available")
                        .foregroundColor(.gray)
                }
            }
            if showLoading {
                LoadingView()
            }
        }
        .onAppear {
            viewModel.onEvent(.getAccounts)
        }
        .onReceive(viewModel.$screenState) { state in
            handleScreenState(state)
        }
    }
    
    private func handleScreenState(_ state: AccountListScreenState) {
        switch state {
        case .loading:
            showLoading = true
        case .loaded, .hasError, .emptyResults:
            showLoading = false
        }
    }
}

// MARK: - Preview
struct AccountsListView_Previews: PreviewProvider {
    static var previews: some View {
        AccountsListView(viewModel: AccountsListViewModel())
    }
}
