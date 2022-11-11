//
//  SimpleAlert+UIAlertController.swift
//  LearningTask-11.1
//
//  Created by rafael.rollo on 11/11/2022.
//

import UIKit

extension UIAlertController {
    
    static func showError(_ message: String, in controllerOnTheTop: UIViewController) {
        let title = "Erro"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(cancel)
        
        controllerOnTheTop.present(alert, animated: true)
    }
    
}


