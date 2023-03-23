//
//  UserTableViewCell.swift
//  UserPod
//
//  Created by Bryan Vivo on 3/23/23.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        return label
    }()

    func setupCell(name: String?) {
        if nameLabel.superview == nil {
            contentView.addSubview(nameLabel)
            nameLabel.snp.makeConstraints { make in
                make.top.leading.equalToSuperview().offset(16)
                make.bottom.trailing.equalToSuperview().offset(-16)
            }
        }
        nameLabel.text = name
    }

}
