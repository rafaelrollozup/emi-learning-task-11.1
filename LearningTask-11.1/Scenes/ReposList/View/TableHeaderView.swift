//
//  TableHeaderView.swift
//  LearningTask-11.1
//
//  Created by rafael.rollo on 11/11/2022.
//

import UIKit

class TableHeaderView: UIView {
    // MARK: - factory method
    
    static func build(from user: User) -> TableHeaderView {
        let frame = CGRect(x: 0, y: 0, width: 0, height: 112)
        
        let headerView = TableHeaderView.init(with: frame, and: user)
        return headerView
    }
    // MARK: - Subviews
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Avatar"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 72),
            imageView.heightAnchor.constraint(equalToConstant: 72),
        ])
        
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 36
        imageView.layer.borderColor = UIColor.quaternaryLabel.cgColor
        imageView.layer.borderWidth = 2
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .helveticaNeue(.medium, size: 28)
        label.text = self.user.fullName
        return label
    }()
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .helveticaNeue(size: 24)
        label.text = self.user.username
        return label
    }()
    
    private lazy var titlesStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            nameLabel,
            usernameLabel,
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            avatarImageView, titlesStackView
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 20
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
        return stackView
    }()
    // MARK: - Properties
    
    private var user: User
    // MARK: - Initialization
    
    private init(with frame: CGRect, and user: User) {
        self.user = user
        super.init(frame: frame)
        
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("""
            Este componente de view deve ser utilizado como código.
            Consulte a documentação da API da classe UITableView e sua propriedade `tableHeaderView`.
        """)
    }
    
    private func setup() {
        addSubview(containerStackView)
        addContraints()
    }
    
    private func addContraints() {
        NSLayoutConstraint.activate([
            containerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerStackView.topAnchor.constraint(equalTo: self.topAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
