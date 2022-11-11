//
//  StarsIndicator.swift
//  LearningTask-11.1
//
//  Created by rafael.rollo on 11/11/2022.
//

import UIKit

@IBDesignable class StarsIndicator: UIView {
    
    override var intrinsicContentSize: CGSize {
        return .init(width: .zero,
                     height: DesignConstants.iconSize.height)
    }
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.Icons.star
                                    ?? UIImage(systemName: "star"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .secondaryLabel
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: DesignConstants.iconSize.width),
            imageView.heightAnchor.constraint(equalToConstant: DesignConstants.iconSize.height),
        ])
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = String(describing: Int.zero)
        label.textColor = .secondaryLabel
        label.font = .helveticaNeue(size: DesignConstants.fontSize)
        return label
    }()
    
    private lazy var containerView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            iconImageView, label
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = DesignConstants.interItemSpacing
        return stackView
    }()
    
    @IBInspectable var stars: String? {
        didSet {
            guard let stars = stars,
                  let numberOfStars = Int(stars),
                  numberOfStars > 0 else { return }
            
            label.text = stars
            isHidden = false
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        applyTheme()
        
        addSubview(containerView)
        addConstraints()
    }
    
    private func applyTheme() {
        isHidden = true
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

fileprivate extension StarsIndicator {
    struct DesignConstants {
        static let iconSize: CGSize = .init(width: 20, height: 20)
        static let fontSize: CGFloat = 14
        static let interItemSpacing: CGFloat = 4
    }
}

