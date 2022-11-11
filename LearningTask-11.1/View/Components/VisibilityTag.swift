//
//  VisibilityTag.swift
//  LearningTask-11.1
//
//  Created by rafael.rollo on 11/11/2022.
//

import UIKit

@IBDesignable class VisibilityTag: UIView {
    
    override var intrinsicContentSize: CGSize {
        return .init(width: .zero,
                     height: DesignConstants.height)
    }
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.font = .helveticaNeue(.medium, size: 14)
        return label
    }()
    
    @IBInspectable var text: String? {
        didSet {
            label.text = text
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
        
        addSubview(label)
        addContraints()
    }
    
    private func applyTheme() {
        backgroundColor = .clear
        
        layer.cornerRadius = DesignConstants.height / 2
        layer.borderColor = UIColor.tertiaryLabel.cgColor
        layer.borderWidth = DesignConstants.border
    }
    
    private func addContraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: DesignConstants.height)
        ])
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                           constant: DesignConstants.padding),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                            constant: -DesignConstants.padding),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}

fileprivate extension VisibilityTag {
    struct DesignConstants {
        static let border: CGFloat = 1
        static let height: CGFloat = 24
        static let padding: CGFloat = 12
    }
}
