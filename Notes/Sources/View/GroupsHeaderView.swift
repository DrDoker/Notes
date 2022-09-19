//
//  He.swift
//  Notes
//
//  Created by Serhii  on 19/09/2022.
//

import UIKit
import SnapKit

final class GroupsHeaderView: UITableViewHeaderFooterView {

    // MARK: - Outlets

    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        return label
    }()

    // MARK: - Initializers

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupHierarchy() {
        contentView.addSubview(label)
    }

    private func setupLayout() {
        label.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(contentView).offset(10)
        }
    }
}
