//
//  LanguageMarker.swift
//  LearningTask-11.1
//
//  Created by rafael.rollo on 11/11/2022.
//

import UIKit

@IBDesignable class LanguageMarker: UIView {
    
    override var intrinsicContentSize: CGSize {
        return .init(width: .zero,
                     height: DesignConstants.markerSize.height)
    }
    
    private lazy var circleMarker: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = DesignConstants.markerSize.width / 2
        
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: DesignConstants.markerSize.width),
            view.heightAnchor.constraint(equalToConstant: DesignConstants.markerSize.height),
        ])
        return view
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.font = .helveticaNeue(size: DesignConstants.fontSize)
        return label
    }()
    
    private lazy var containerView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            circleMarker, label
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = DesignConstants.interItemSpacing
        return stackView
    }()
    
    @IBInspectable var language: String? {
        didSet {
            guard let language = language else { return }
            
            circleMarker.backgroundColor = UIColor.of(language)
            label.text = language
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
        addSubview(containerView)
        addConstraints()
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

fileprivate extension LanguageMarker {
    struct DesignConstants {
        static let markerSize: CGSize = .init(width: 16, height: 16)
        static let fontSize: CGFloat = 14
        static let interItemSpacing: CGFloat = 4
    }
}
