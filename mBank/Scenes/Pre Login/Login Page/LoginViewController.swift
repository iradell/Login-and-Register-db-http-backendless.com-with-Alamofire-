//
//  LoginViewController.swift
//  mBank
//
//  Created by Tornike Bardadze on 30.06.22.
//

import UIKit

class LoginViewController: UIViewController {

    private var firstName: UILabel = {
       let fn = UILabel()
        fn.translatesAutoresizingMaskIntoConstraints = false
        fn.text = "Email"
        fn.font = UIFont(name: "Trebuchet MS", size: 13)
        fn.textColor = .gray
        return fn
    }()
    
    private var userId: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.borderStyle = .roundedRect
        view.keyboardAppearance = .alert
        view.placeholder = "Enter a Email"
        view.textContentType = .oneTimeCode
        view.autocorrectionType = .no
        return view
    }()
    
    private var Password: UILabel = {
       let psw = UILabel()
        psw.translatesAutoresizingMaskIntoConstraints = false
        psw.text = "Password"
        psw.font = UIFont(name: "Trebuchet MS", size: 13)
        psw.textColor = .gray
        return psw
    }()
    
    private var userPass: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.borderStyle = .roundedRect
        view.keyboardAppearance = .alert
        view.placeholder = "Enter a Password"
        view.isSecureTextEntry = true
        view.textContentType = .oneTimeCode
        return view
    }()
    
    private let signIn: UIButton = {
       let ca = UIButton()
        ca.translatesAutoresizingMaskIntoConstraints = false
        ca.backgroundColor = .blue.withAlphaComponent(0.7)
        ca.setTitle("Sign In", for: .normal)
        ca.tintColor = .white
        ca.layer.cornerRadius = 10
        ca.addTarget(self, action: #selector(signInTapButton), for: .touchUpInside)
        return ca
    }()
    
    private var forgotPassword: UILabel = {
       let psw = UILabel()
        psw.translatesAutoresizingMaskIntoConstraints = false
        psw.text = "Forgot Password?"
        psw.font = UIFont(name: "Trebuchet MS", size: 13)
        psw.textColor = .gray
        psw.textAlignment = .right
        return psw
    }()
    
    private var incorrectPassword: UILabel = {
        let ip = UILabel()
        ip.translatesAutoresizingMaskIntoConstraints = false
        ip.text = ""
        ip.font = UIFont(name: "Trebuchet MS", size: 13)
        ip.textAlignment = .center
        return ip
    }()
    
    private var dontHaveAccount: UILabel = {
       let dha = UILabel()
        dha.translatesAutoresizingMaskIntoConstraints = false
        dha.text = "Don't have an account? Sign up"
        dha.font = UIFont(name: "Trebuchet MS", size: 13)
        dha.textColor = .black
        dha.textAlignment = .center
        return dha
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavBar()
        configureItems()
        setup()
        dismissKeyboardGesture()
        dontHaveAccNavigation()
    }


}


//MARK: Setup
extension LoginViewController {
    
    private func setup() {
        addSubViews()
        setupConstraints()
    }
    
    private func addSubViews() {
        view.addSubview(firstName)
        view.addSubview(userId)
        view.addSubview(Password)
        view.addSubview(userPass)
        view.addSubview(signIn)
        view.addSubview(forgotPassword)
        view.addSubview(incorrectPassword)
        view.addSubview(dontHaveAccount)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            firstName.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height / 6),
            firstName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            firstName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
        
        NSLayoutConstraint.activate([
            userId.topAnchor.constraint(equalTo: firstName.bottomAnchor, constant: 15),
            userId.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            userId.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            userId.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            Password.topAnchor.constraint(equalTo: userId.bottomAnchor, constant: 15),
            Password.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            Password.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
        
        NSLayoutConstraint.activate([
            userPass.topAnchor.constraint(equalTo: Password.bottomAnchor, constant: 15),
            userPass.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            userPass.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            userPass.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            forgotPassword.topAnchor.constraint(equalTo: userPass.bottomAnchor, constant: 15),
            forgotPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            forgotPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
        ])
        
        NSLayoutConstraint.activate([
            incorrectPassword.topAnchor.constraint(equalTo: forgotPassword.bottomAnchor, constant: 15),
            incorrectPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            incorrectPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        ])
        
        NSLayoutConstraint.activate([
            signIn.topAnchor.constraint(equalTo: incorrectPassword.bottomAnchor, constant: 30),
            signIn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            signIn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            signIn.heightAnchor.constraint(equalToConstant: 60)
        ])
        NSLayoutConstraint.activate([
            dontHaveAccount.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -35),
            dontHaveAccount.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            dontHaveAccount.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dontHaveAccount.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
}


//MARK: TAP AND DISMISS
extension LoginViewController {
    
    @objc func handleTap(sender:UITapGestureRecognizer) {
        let registrationPageVC = UINavigationController(rootViewController: RegistrationViewController())
        registrationPageVC.modalPresentationStyle = .fullScreen
            self.present(registrationPageVC, animated: true, completion: nil)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    private func dontHaveAccNavigation() {
        let navigation = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        dontHaveAccount.isUserInteractionEnabled = true
        dontHaveAccount.addGestureRecognizer(navigation)
    }
    
    private func dismissKeyboardGesture() {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    private func configureNavBar() {
        navigationItem.title = "Sign In To Continue"
    }
    
    private func configureItems() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chevron.backward"),
            style: .done,
            target: self,
            action: #selector(backToMainPg))
        
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc
    private func signInTapButton() {
        guard let email = userId.text else { return }
        guard let password = userPass.text else { return }
        
        let modelLogin = LoginModel(login: email, password: password)
        APIManager.shareInstance.callingLoginAPI(login: modelLogin) { (result) in
            switch result {
            case .success(_):
                self.incorrectPassword.textColor = .green
                self.incorrectPassword.text = "Success"
                self.tabBarConfig()
            case .failure(_):
                self.incorrectPassword.textColor = .red
                self.incorrectPassword.text = "Incorrect password or username, please try again"
            }
        }
    }
    
    func tabBarConfig() {
        let tabBarVC = UITabBarController()
        
        let mainVC = UINavigationController(rootViewController: MainPageViewController())
        let offersVC = UINavigationController(rootViewController: OffersViewController())
        let OperationsVC = UINavigationController(rootViewController: OperationsViewController())
        let ProfileVC = UINavigationController(rootViewController: ProfileViewController())
        
        
        let iconMainVC = UITabBarItem(title: "Main",
                                      image: UIImage(systemName: "house"),
                                      selectedImage: UIImage(systemName: "house.fill"))
       
        let iconOffersVC = UITabBarItem(title: "Offers",
                                        image: UIImage(systemName: "gift"),
                                        selectedImage: UIImage(systemName: "gift.fill"))
        
        let iconOperationVC =  UITabBarItem(title: "Operations",
                                            image: UIImage(systemName: "creditcard"),
                                            selectedImage: UIImage(systemName: "creditcard.fill"))
        
        let iconProfileVC =  UITabBarItem(title: "Profile",
                                            image: UIImage(systemName: "person"),
                                            selectedImage: UIImage(systemName: "person.fill"))
        
        mainVC.tabBarItem = iconMainVC
        offersVC.tabBarItem = iconOffersVC
        OperationsVC.tabBarItem = iconOperationVC
        ProfileVC.tabBarItem = iconProfileVC
        
        
        tabBarVC.setViewControllers([mainVC,offersVC,OperationsVC,ProfileVC], animated: true)
        
        tabBarVC.modalPresentationStyle = .fullScreen
        
        present(tabBarVC, animated: true)
    }
    
    
    @objc
    func backToMainPg() {
        let preLogin = UINavigationController(rootViewController: PreLoginViewController(configurator: PreLoginConfiguratorImpl()))
        preLogin.modalPresentationStyle = .fullScreen
            self.present(preLogin, animated: true, completion: nil)
    }
    
    
}
