//
//  ViewController.swift
//  Biometric
//
//  Created by Batıkan SOSUN on 15.02.2021.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        userBiometricAuthentication()
    }
    
    
    func userBiometricAuthentication() {
        let localAuthenticationContext = LAContext()
        var authorizationError: NSError?
        let reason = "Authentication required to login"

        if localAuthenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authorizationError) {
            localAuthenticationContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, evaluateError in
                if success {
                    print("Authenticated succesfully!")
                    
                } else {
                    // Failed to authenticate
                    guard let error = evaluateError else {
                        return
                    }
                    print(error)
                }
            }
        } else {
            guard let error = authorizationError else {
                return
            }
            print(error)
        }
    }


}

