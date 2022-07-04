//
//  RegistrationViewController.swift
//  mBank
//
//  Created by Tornike Bardadze on 30.06.22.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    private var firstNameLb: UILabel = {
       let ut = UILabel()
        ut.translatesAutoresizingMaskIntoConstraints = false
        ut.text = "First Name"
        ut.font = UIFont(name: "Trebuchet MS", size: 13)
        ut.textColor = .gray
        return ut
    }()
    
    private var firstNameFd: UITextField = {
       let uf = UITextField()
        uf.translatesAutoresizingMaskIntoConstraints = false
        uf.borderStyle = .roundedRect
        uf.keyboardAppearance = .alert
        uf.placeholder = "Enter a Name"
        uf.textContentType = .oneTimeCode
        uf.autocorrectionType = .no
        return uf
    }()
    
    private var lastNameLb: UILabel = {
       let etl = UILabel()
        etl.translatesAutoresizingMaskIntoConstraints = false
        etl.text = "Last Name"
        etl.font = UIFont(name: "Trebuchet MS", size: 13)
        etl.textColor = .gray
        return etl
    }()
    
    private var lastNameFd: UITextField = {
       let ef = UITextField()
        ef.translatesAutoresizingMaskIntoConstraints = false
        ef.borderStyle = .roundedRect
        ef.keyboardAppearance = .alert
        ef.placeholder = "Enter a Last Name"
        ef.textContentType = .oneTimeCode
        ef.autocorrectionType = .no
        return ef
    }()
    
    private var emailLb: UILabel = {
       let ptl = UILabel()
        ptl.translatesAutoresizingMaskIntoConstraints = false
        ptl.text = "Email"
        ptl.font = UIFont(name: "Trebuchet MS", size: 13)
        ptl.textColor = .gray
        return ptl
    }()
    
    private var emailFd: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.borderStyle = .roundedRect
        view.keyboardAppearance = .alert
        view.placeholder = "Enter a Email"
        return view
    }()
    
    private var pswRepTxtLb: UILabel = {
       let ptl = UILabel()
        ptl.translatesAutoresizingMaskIntoConstraints = false
        ptl.text = "Enter a Password"
        ptl.font = UIFont(name: "Trebuchet MS", size: 13)
        ptl.textColor = .gray
        return ptl
    }()
    
    private var repUserPass: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.borderStyle = .roundedRect
        view.keyboardAppearance = .alert
        view.placeholder = "Please Enter a Password"
        view.isSecureTextEntry = true
        view.textContentType = .oneTimeCode
        return view
    }()
    
    private let getStarted: UIButton = {
       let ca = UIButton()
        ca.translatesAutoresizingMaskIntoConstraints = false
        ca.backgroundColor = .blue.withAlphaComponent(0.7)
        ca.setTitle("Get Started", for: .normal)
        ca.tintColor = .white
        ca.layer.cornerRadius = 10
        ca.addTarget(self, action: #selector(regSaveData), for: .touchUpInside)
        return ca
    }()
    
    private var haveAccount: UILabel = {
       let hv = UILabel()
        hv.translatesAutoresizingMaskIntoConstraints = false
        hv.text = "Already have an account? Sign In"
        hv.font = UIFont(name: "Trebuchet MS", size: 13)
        hv.textColor = .black
        hv.textAlignment = .center
        return hv
    }()

    private var errorTextField: UILabel = {
        let etf = UILabel()
        etf.translatesAutoresizingMaskIntoConstraints = false
        etf.textColor = .red
        etf.font = UIFont(name: "Trebuchet MS", size: 15)
        etf.textAlignment = .center
        return etf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
        configureNavBar()
        configureItems()
        haveAccountNavigation()
        dismissKeyboardGesture()
    }


}

//MARK: Setup
extension RegistrationViewController {
    
    private func setup() {
        addSubViews()
        setupConstraints()
    }
    
    private func addSubViews() {
        view.addSubview(firstNameLb)
        view.addSubview(firstNameFd)
        view.addSubview(lastNameLb)
        view.addSubview(lastNameFd)
        view.addSubview(emailLb)
        view.addSubview(emailFd)
        view.addSubview(pswRepTxtLb)
        view.addSubview(repUserPass)
        view.addSubview(errorTextField)
        view.addSubview(getStarted)
        view.addSubview(haveAccount)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            firstNameLb.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height / 7),
            firstNameLb.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            firstNameLb.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
        
        NSLayoutConstraint.activate([
            firstNameFd.topAnchor.constraint(equalTo: firstNameLb.bottomAnchor, constant: 15),
            firstNameFd.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            firstNameFd.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            firstNameFd.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            lastNameLb.topAnchor.constraint(equalTo: firstNameFd.bottomAnchor, constant: 15),
            lastNameLb.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            lastNameLb.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
        
        NSLayoutConstraint.activate([
            lastNameFd.topAnchor.constraint(equalTo: lastNameLb.bottomAnchor, constant: 15),
            lastNameFd.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            lastNameFd.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            lastNameFd.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            emailLb.topAnchor.constraint(equalTo: lastNameFd.bottomAnchor, constant: 15),
            emailLb.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emailLb.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
        
        NSLayoutConstraint.activate([
            emailFd.topAnchor.constraint(equalTo: emailLb.bottomAnchor, constant: 15),
            emailFd.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            emailFd.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            emailFd.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            pswRepTxtLb.topAnchor.constraint(equalTo: emailFd.bottomAnchor, constant: 15),
            pswRepTxtLb.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            pswRepTxtLb.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
        
        NSLayoutConstraint.activate([
            repUserPass.topAnchor.constraint(equalTo: pswRepTxtLb.bottomAnchor, constant: 15),
            repUserPass.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            repUserPass.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            repUserPass.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            errorTextField.topAnchor.constraint(equalTo: repUserPass.bottomAnchor, constant: 20),
            errorTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            errorTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        ])
        
        NSLayoutConstraint.activate([
            getStarted.topAnchor.constraint(equalTo: errorTextField.bottomAnchor, constant: 40),
            getStarted.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            getStarted.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            getStarted.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            haveAccount.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35),
            haveAccount.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            haveAccount.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            haveAccount.heightAnchor.constraint(equalToConstant: 30)
        ])
        
    }
    
}

//MARK: TAP, DISMISS AND ETC LOGICS
extension RegistrationViewController {
    
    @objc func handleTap(sender:UITapGestureRecognizer) {
        let loginPageVC = UINavigationController(rootViewController: LoginViewController())
        loginPageVC.modalPresentationStyle = .fullScreen
            self.present(loginPageVC, animated: true, completion: nil)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func haveAccountNavigation() {
        let navigation = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        haveAccount.isUserInteractionEnabled = true
        haveAccount.addGestureRecognizer(navigation)
    }
    
    private func dismissKeyboardGesture() {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    private func configureNavBar() {
        navigationItem.title = "Create An Account"
    }
    
    private func configureItems() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chevron.backward"),
            style: .done,
            target: self,
            action: #selector(backToMainPg))
        
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc func backToMainPg() {
        let preLogin = UINavigationController(rootViewController: PreLoginViewController(configurator: PreLoginConfiguratorImpl()))
        preLogin.modalPresentationStyle = .fullScreen
        self.present(preLogin, animated: true, completion: nil)
    }
    
    @objc func regSaveData() {
        guard let fname = self.firstNameFd.text else { return }
        guard let lname = self.lastNameFd.text else { return }
        guard let email = self.emailFd.text else { return }
        guard let password = self.repUserPass.text else { return }
        
        let register = RegisterModel(name: fname + lname, email: email, password: password)
        APIManager.shareInstance.callingRegisterAPI(register: register)
        {
            (isSuccess) in
            if isSuccess {
                print("User registered successfully")
                self.errorTextField.textColor = .green
                self.errorTextField.text = "User created successfully"
            } else {
                self.errorTextField.text = "Please try again"
            }
        }
    }
    
}
