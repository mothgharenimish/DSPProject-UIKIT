//
//  SignUpVC.swift
//  DSPProject-UIKIT
//
//  Created by Nimish Mothghare on 09/08/25.
//

import UIKit
import CountryPickerView

class SignUpVC: UIViewController{
  
    
    
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

       
    }
    

 
    @IBAction func emailverifyAction(_ sender: UIButton) {
        
    }
    
    
    @IBAction func mobileverifyAction(_ sender: UIButton) {
        
    }
    
    
    @IBAction func countrypickerAction(_ sender: UIButton) {

       
    }
    
    
  
    
}
