//
//  Class+Extension.swift
//  
//
//  Created by alexey sorochan on 04.02.2020.
//

import UIKit

extension UIApplication {
    var keyWindow: UIWindow? {
        return windows.first(where: { $0.isKeyWindow})
    }
}

extension UIViewController {
    
        func showErrorAlert(_ message: String) {
        let customKeyWindow: UIWindow? = UIApplication.shared.keyWindow
        let alertController = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { (_) in }
        alertController.addAction(alertAction)
        customKeyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
}

