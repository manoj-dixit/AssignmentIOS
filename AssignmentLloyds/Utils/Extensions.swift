//
//  Extensions.swift
//  AssignmentLloyds
//
//  Created by Manoj kumar Dixit on 18/12/22.
//

import UIKit

// MARK: - UIViewController extension
extension  UIViewController {
    // Show text alert
    func showAlert(withTitle title: String? = Constants.Alert.title, withMessage message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: Constants.Alert.buttonTitleOk, style: .default, handler: { action in
        })
        
        alert.addAction(ok)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
    
    // Show Loading
    func showLoading() {
        
        let alert = UIAlertController(title: nil, message: Constants.Alert.loading, preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    // Hide Loading
    func hideLoading() {
        
        DispatchQueue.main.async(execute: {
            self.dismiss(animated: false, completion: nil)
        })
    }
}
