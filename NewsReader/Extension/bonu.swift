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

extension UIViewController {
    
    var viewForActivityIndicator: Int { return 666}
    
    func showActivityIndicator(indiText: String) {
        let viewForActivity = UIView()
        let activityIndicator = UIActivityIndicatorView()
        let blurView = UIVisualEffectView()
        let label = UILabel()
        
        label.frame = CGRect(x: 50, y: 0, width: 160, height: 46)
        label.text = indiText
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = UIColor.black
        
        blurView.effect = UIBlurEffect(style: .systemThickMaterial)
        blurView.clipsToBounds = true
        blurView.layer.masksToBounds = true
        blurView.layer.cornerRadius = 12
        blurView.translatesAutoresizingMaskIntoConstraints = false
        viewForActivity.insertSubview(blurView, at: 0)

        NSLayoutConstraint.activate([
        blurView.heightAnchor.constraint(equalTo: viewForActivity.heightAnchor),
        blurView.widthAnchor.constraint(equalTo: viewForActivity.widthAnchor),
        ])
        viewForActivity.tag = self.viewForActivityIndicator
        viewForActivity.layer.cornerRadius = 12
        viewForActivity.clipsToBounds = true
        viewForActivity.frame = CGRect(x: view.frame.midX - label.frame.width / 2, y: view.frame.midY - label.frame.height / 2, width: 160, height: 46)
        
        activityIndicator.style = .medium
        activityIndicator.color = .black
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
        activityIndicator.startAnimating()
        
        viewForActivity.addSubview(label)
        viewForActivity.addSubview(activityIndicator)
        
        view.addSubview(viewForActivity)
    }
    
    func hideActivityIndicator() {
        if let viewInicator = self.view.subviews.filter( { $0.tag == self.viewForActivityIndicator}).first {
            viewInicator.removeFromSuperview()
        }
    }
}


