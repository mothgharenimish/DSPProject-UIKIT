//
//  LoginVC.swift
//  DSPProject-UIKIT
//
//  Created by Nimish Mothghare on 08/08/25.
//

import UIKit

class LoginVC: UIViewController {
    
    //MARK: -IBOutlet
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailtxtField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordtxtField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    //MARK: -View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailView.setCornerRadiusView(7)
        self.emailView.layer.borderColor = UIColor(hex: "#BFC8D9")?.cgColor
        self.emailView.layer.borderWidth = 2.0
        
        self.passwordView.setCornerRadiusView(7)
        self.passwordView.layer.borderColor = UIColor(hex: "#BFC8D9")?.cgColor
        self.passwordView.layer.borderWidth = 2.0
        
        self.loginBtn.setCornerRadiusButton(7)
        
        
        
    }
    
    
    //MARK: -Login IbAction
    @IBAction func loginAction(_ sender: UIButton) {
        
        
        guard let username = emailtxtField.text, !username.isEmpty,
              let password = passwordtxtField.text, !password.isEmpty else {
            print("Please enter both Email id and password")
            showAlert(title: "Login filled", message: "Please Enter a Email and Password ")
            return
        }
    
        APIManager.shared.login(username: username, password: password) { [self] result in
            switch result {
            case .success(let json):
                print("Login Response: \(json)")
                showAlert(title: "Login Suceess", message: "Login is Sucessfully")
                
            case .failure(let error):
                print(" API Error: \(error.localizedDescription)")
                showAlert(title: "Login Failed", message: "Login is Failed Try again%")
            }
        }
        
        
    }
    
    
     func showAlert(title: String, message: String) {
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           self.present(alert, animated: true, completion: nil)
       }
    
    
    
    @IBAction func signupAction(_ sender: UIButton) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignUpVC") as? SignUpVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
}
