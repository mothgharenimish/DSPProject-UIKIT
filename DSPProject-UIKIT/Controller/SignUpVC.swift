//
//  SignUpVC.swift
//  DSPProject-UIKIT
//
//  Created by Nimish Mothghare on 09/08/25.
//

import UIKit
import CountryPickerView
import OTPFieldView
import IQKeyboardManagerSwift

class SignUpVC: UIViewController, OTPFieldViewDelegate{
    
    
    @IBOutlet weak var createaccountBtn: UIButton!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var nametxtField: UITextField!
    @IBOutlet weak var companyView: UIView!
    @IBOutlet weak var companytxtField: UITextField!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailtxtField: UITextField!
    @IBOutlet weak var emailverifyBtn: UIButton!
    @IBOutlet weak var mobilenoView: UIView!
    @IBOutlet weak var mobilenotxtField: UITextField!
    @IBOutlet weak var mobileverifyBtn: UIButton!
    @IBOutlet weak var countrypickerView: UIView!
    @IBOutlet weak var countrypickerImg: UIImageView!
    @IBOutlet weak var countrycodeLbl: UILabel!
    @IBOutlet weak var countrypickerBtn: UIButton!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordtxtField: UITextField!
    @IBOutlet weak var otpView: OTPFieldView!
    @IBOutlet weak var darknessView: UIView!
    @IBOutlet weak var otpverificationView: UIView!
    @IBOutlet weak var otpveriyBtn: UIButton!
    @IBOutlet weak var cancelotpBtn: UIButton!
    @IBOutlet weak var emaildoneImg: UIImageView!
    @IBOutlet weak var mobilenodoneImg: UIImageView!
    
    var currentEnteredOTP: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.otpveriyBtn.setCornerRadiusButton(10)
        self.cancelotpBtn.setCornerRadiusButton(10)
        self.cancelotpBtn.layer.borderColor = UIColor(hex: "#0F5CFF")?.cgColor
        self.cancelotpBtn.layer.borderWidth = 2.0
        
        self.emaildoneImg.isHidden = true
        self.mobilenodoneImg.isHidden = true
        
        self.darknessView.isHidden = true
        self.otpverificationView.isHidden = true
        self.emailverifyBtn.isEnabled = false
        self.mobileverifyBtn.isEnabled = false
        
        self.nameView.setCornerRadiusView(7)
        self.nameView.layer.borderColor = UIColor(hex: "#BFC8D9")?.cgColor
        self.nameView.layer.borderWidth = 2.0
        
        self.companyView.setCornerRadiusView(7)
        self.companyView.layer.borderColor = UIColor(hex: "#BFC8D9")?.cgColor
        self.companyView.layer.borderWidth = 2.0
        
        self.emailView.setCornerRadiusView(7)
        self.emailView.layer.borderColor = UIColor(hex: "#BFC8D9")?.cgColor
        self.emailView.layer.borderWidth = 2.0
        
        self.mobilenoView.setCornerRadiusView(7)
        self.mobilenoView.layer.borderColor = UIColor(hex: "#BFC8D9")?.cgColor
        self.mobilenoView.layer.borderWidth = 2.0
        
        self.passwordView.setCornerRadiusView(7)
        self.passwordView.layer.borderColor = UIColor(hex: "#BFC8D9")?.cgColor
        self.passwordView.layer.borderWidth = 2.0
        
        setupOtpView()
        
    }
    
    
    func setupOtpView(){
        self.otpView.fieldsCount = 6
        self.otpView.fieldBorderWidth = 2
        self.otpView.defaultBorderColor = UIColor.gray
        self.otpView.filledBorderColor = UIColor(hex: "#0F5EFF")!
        self.otpView.cursorColor = UIColor.red
        self.otpView.displayType = .square
        self.otpView.fieldSize = 45
        self.otpView.separatorSpace = 10
        self.otpView.shouldAllowIntermediateEditing = true
        self.otpView.delegate = self
        self.otpView.initializeUI()
        
        // Apply corner radius to each OTP field
        for field in self.otpView.subviews {
            field.layer.cornerRadius = 8
            field.layer.masksToBounds = true
        }
    }
    
    
    
    @IBAction func emailverifyAction(_ sender: UIButton) {
        
        guard let email = emailtxtField.text,!email.isEmpty else {
            
            print("Please enter the Email ID")
            return
        }
        
        APIManager.shared.OtpsendbyEmail(email: email) { [self] result in
            
            switch result {
                
                
            case .success(let json):
                print("OTP Response: \(json)")
                self.otpverificationView.isHidden = false
                self.darknessView.isHidden = false
                
            case .failure(let error):
                print(" API Error: \(error.localizedDescription)")
                
            }
        }
    }
    
    
    @IBAction func mobileverifyAction(_ sender: UIButton) {
        
        guard let mobile = mobilenotxtField.text,!mobile.isEmpty else {
            
            print("Please enter the Email ID")
            return
        }
        
        APIManager.shared.OtpsendbyMobile(mobile: mobile){ [self] result in
            
            switch result {
                
                
            case .success(let json):
                print("OTP Response: \(json)")
                self.otpverificationView.isHidden = false
                self.darknessView.isHidden = false
                
            case .failure(let error):
                print(" API Error: \(error.localizedDescription)")
                
            }
        }
    }
    
    
    @IBAction func countrypickerAction(_ sender: UIButton) {
        
        
    }
    
    
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otp: String) {
        print("OTPString: \(otp)")
        currentEnteredOTP = otp
        
    }
    
    func hasEnteredAllOTP(hasEnteredAll: Bool) -> Bool {
        return true
        
    }
    
    
    
    
    @IBAction func createaccountAction(_ sender: UIButton) {
        
        guard let name = nametxtField.text, !name.isEmpty,
              let email = emailtxtField.text, !email.isEmpty,
              let mobileno = mobilenotxtField.text, !mobileno.isEmpty,
              let companyname = companytxtField.text, !companyname.isEmpty,
              let password = passwordtxtField.text, !password.isEmpty else {
            print("Please enter all the Fields")
            
            return
            
        }
        
        APIManager.shared.signup(name: name, email: email, companyname: companyname, phonenumber: mobileno, countrycode: "91", password: password) { [self] result in
            
            switch result {
                
            case .success(let json):
                print("SignUp Response: \(json)")
                self.emailverifyBtn.isEnabled = true
                self.mobileverifyBtn.isEnabled = true
                
                showAlert(title: "Sign Up", message: "Sign Up is Successfully done")
                
            case .failure(let error):
                print(" API Error: \(error.localizedDescription)")
                showAlert(title: "Sign Up", message: "Sign Up is Failed try it again")

                
            }
            
        }
    }
    
    
    
    
    @IBAction func cancelotpAction(_ sender: UIButton) {
        
        
    }
    
    
    
    @IBAction func otpverifyAction(_ sender: UIButton) {
        
        guard !currentEnteredOTP.isEmpty else {
               print("Please enter the OTP")
               return
           }
           
           let email = emailtxtField.text ?? ""
           let mobile = mobilenotxtField.text ?? ""
           
           if !email.isEmpty {
               APIManager.shared.OtpverifydbyEmail(email: email, otp: currentEnteredOTP) { [weak self] result in
                   guard let self = self else { return }
                   switch result {
                   case .success(let json):
                       print("OTP verify by email Response: \(json)")
                       self.darknessView.isHidden = true
                       self.otpverificationView.isHidden = true
                       self.emailverifyBtn.isHidden = true
                       self.emaildoneImg.isHidden = false
                       
                   case .failure(let error):
                       print("API Error (Email): \(error.localizedDescription)")
                   }
               }
           }
           
           if !mobile.isEmpty {
               APIManager.shared.OtpverifydbyMobile(mobile: mobile, otp: currentEnteredOTP) { [weak self] result in
                   guard let self = self else { return }
                   switch result {
                   case .success(let json):
                       print("OTP verify by mobile Response: \(json)")
                       self.darknessView.isHidden = true
                       self.otpverificationView.isHidden = true
                       self.mobileverifyBtn.isHidden = true
                       self.mobilenodoneImg.isHidden = false
                       
                   case .failure(let error):
                       print("API Error (Mobile): \(error.localizedDescription)")
                   }
               }
           }
    }
    
    
    
    
    @IBAction func loginAction(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)

    }
    
    
    func showAlert(title: String, message: String) {
          let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
          self.present(alert, animated: true, completion: nil)
      }
    
    
    
}
