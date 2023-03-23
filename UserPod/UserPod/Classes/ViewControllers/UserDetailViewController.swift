//
//  UserDetailViewController.swift
//  UserPod
//
//  Created by Bryan Vivo on 3/23/23.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    var viewModel: UserDetailViewModel?
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var mobileLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    
    private lazy var birthLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        return label
    }()

    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    

    private func setupUI() {
        if stackView.superview == nil {
            view.addSubview(stackView)
            stackView.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(16)
                make.trailing.equalToSuperview().offset(-16)
                make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            }
            
            stackView.addArrangedSubview(nameLabel)
            stackView.addArrangedSubview(addressLabel)
            stackView.addArrangedSubview(birthLabel)
            stackView.addArrangedSubview(emailLabel)
            stackView.addArrangedSubview(mobileLabel)
        }
        
        nameLabel.text = "\(viewModel?.user.name?.firstName ?? "") \(viewModel?.user.name?.lastName ?? "")"
        addressLabel.text =  "\(viewModel?.user.address?.street?.number ?? 0) \(viewModel?.user.address?.street?.name ?? ""), \(viewModel?.user.address?.city ?? ""), \(viewModel?.user.address?.state ?? ""), \(viewModel?.user.address?.country ?? "")"
        birthLabel.text = "Birthday: \(viewModel?.convertDate(dateString: viewModel?.user.birthday?.date ?? "") ?? "") Age: \(viewModel?.user.birthday?.age ?? 0)"
        emailLabel.text = viewModel?.user.email
        mobileLabel.text = viewModel?.user.cell
        
    }
    

}
