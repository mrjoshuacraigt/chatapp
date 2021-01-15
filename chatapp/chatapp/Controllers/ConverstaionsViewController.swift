//
//  ViewController.swift
//  chatapp
//
//  Created by Joshua Taylor on 1/3/21.
//

import UIKit
import FirebaseAuth

class ConverstaionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        validateAuth()
        
    }
    
    func validateAuth() {
        if FirebaseAuth.Auth.auth().currentUser == nil {
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)
        }

    }
    
    

    

}

