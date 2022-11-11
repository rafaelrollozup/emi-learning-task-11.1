//
//  RepoTableViewCell.swift
//  LearningTask-11.1
//
//  Created by rafael.rollo on 11/11/2022.
//

import UIKit

class RepoTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var visibilityTagView: VisibilityTag!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var languageMarkerView: LanguageMarker!
    @IBOutlet weak var starsIndicatorView: StarsIndicator!
    @IBOutlet weak var updateInfoLabel: UILabel!
    
    var repo: Repo? {
        didSet {
            guard let repo = repo else { return }
            
            titleLabel.text = repo.name
            visibilityTagView.text = repo.visibility.textValue
            descriptionLabel.text = repo.description
            
            languageMarkerView.language = repo.language
            starsIndicatorView.stars = String(describing: repo.stars)
            
            let formattedDate = DateFormatter.format(
                date: repo.updatedAt,
                to: .dayPlusAbbreviatedMonth
            ).capitalized
            
            updateInfoLabel.text = "Updated on \(formattedDate)"
        }
    }
}
