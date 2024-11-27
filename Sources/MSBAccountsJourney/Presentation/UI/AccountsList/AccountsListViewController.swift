//
//  AccountsListViewController.swift
//  MSBAccountsJourney
//
//  Created by doandat on 12/11/24.
//

import UIKit
import Combine
import Resolver
import SnapKit
import MSBCoreUI
import CombineCocoa
import MSBUtilities

final class AccountsListViewController: UIViewController {
    
    // MARK: - Properties
    var viewModel: AccountsListViewModel = AccountsListViewModel()
    private var cancellables = Set<AnyCancellable>()
    private let viewDidAppearSubject = PassthroughSubject<Void, Never>()

    private let loadingView = MSBLoadingView()

    private lazy var accountView: AccountView = {
        let v = AccountView()
        return v
    }()
        
    private var cancellableSet: Set<AnyCancellable> = []

    // MARK: - Initialisation
    init(viewModel: AccountsListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

//    private let loadingView = LoadingView()
        
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBindings()
        viewModel.onEvent(.getAccounts)
        setupSubscriptions()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewDidAppearSubject.send()
    }
    
    private func setupSubscriptions() {
        cancellableSet = []
    }
    
    // MARK: - Private methods
        
    private func setupLayout() {
        accountView.snp.makeConstraints {
//            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        loadingView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
                
        
    }
    
    private func setupBindings() {
        viewModel
            .$screenState
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] state in
                guard let self else { return }
                switch state {
                case .loading:
                    self.showLoadingView()
                    guard let account = self.viewModel.allAccounts.first else { return }
                    self.accountView.bind(account: account)
                case .loaded:
                    self.hideLoadingView()
                case .hasError:
                    self.hideLoadingView()
                case .emptyResults:
                    self.hideLoadingView()
                }
            })
            .store(in: &cancellables)
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(accountView)
        view.addSubview(loadingView)
        setupLayout()
    }
    
    private func showLoadingView() {
        loadingView.isHidden = false
        loadingView.startAnimating()
    }
    
    private func hideLoadingView(){
        loadingView.isHidden = true
        loadingView.stopAnimating()
    }
    
}
