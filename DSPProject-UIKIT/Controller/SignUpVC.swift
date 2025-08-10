//
//  SignUpVC.swift
//  DSPProject-UIKIT
//
//  Created by Nimish Mothghare on 09/08/25.
//

import UIKit
import CountryPickerView
import OTPFieldView

class SignUpVC: UIViewController, OTPFieldViewDelegate{
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
               return true
    }
    
    func enteredOTP(otp: String) {
        print("OTPString: \(otp)")

    }
    
    func hasEnteredAllOTP(hasEnteredAll: Bool) -> Bool {
        return true

    }
    
  
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
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
        
    }
    
    
    @IBAction func mobileverifyAction(_ sender: UIButton) {
        
    }
    
    
    @IBAction func countrypickerAction(_ sender: UIButton) {

       
    }
    
    
  
    
}
