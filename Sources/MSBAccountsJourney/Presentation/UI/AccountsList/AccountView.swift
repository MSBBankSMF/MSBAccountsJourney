//
//  AccountView.swift
//  MSBAccountsJourney
//
//  Created by doandat on 12/11/24.
//
import UIKit
import SnapKit

final class AccountView: UIView {
    public let accountNameLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        label.textColor = .label
        return label
    }()
    
    public let balanceLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        label.textColor = .label
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        let stackView = UIStackView(arrangedSubviews: [accountNameLabel, balanceLabel])
        stackView.spacing = 10
        stackView.axis = .vertical
        addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func bind(account: AccountUIModel) {
        accountNameLabel.text = account.name
        balanceLabel.text = account.balanceFormatted
    }
}
