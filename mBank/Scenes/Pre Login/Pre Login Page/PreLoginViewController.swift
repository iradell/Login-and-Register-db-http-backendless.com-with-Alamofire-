//
//  PreLoginViewController.swift
//  mBank
//
//  Created by Tornike Bardadze on 30.06.22.
//

import UIKit

class PreLoginViewController: UIViewController {
    
    private let loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView(style: .medium)
        loader.translatesAutoresizingMaskIntoConstraints = false
        return loader
    }()

    private let imageView: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "1.png")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let welcomeTxt: UILabel = {
       let wt = UILabel()
        wt.translatesAutoresizingMaskIntoConstraints = false
        wt.font = UIFont(name: "Trebuchet MS", size: 30)
        wt.text = "Lets Get Started"
        wt.textAlignment = .center
        wt.textColor = .black
        return wt
    }()
    
    private let descTxt: UILabel = {
       let dt = UILabel()
        dt.translatesAutoresizingMaskIntoConstraints = false
        dt.font = UIFont(name: "Trebuchet MS", size: 15)
        dt.text = "We should love, not fall in love, becouse everything that falls gets broken."
        dt.numberOfLines = 0
        dt.textAlignment = .center
        return dt
    }()
    
    private let createAccount: UIButton = {
       let ca = UIButton()
        ca.translatesAutoresizingMaskIntoConstraints = false
        ca.backgroundColor = .blue.withAlphaComponent(0.7)
        ca.setTitle("Create Account", for: .normal)
        ca.tintColor = .white
        ca.layer.cornerRadius = 10
        ca.addTarget(self, action: #selector(createAccountTap), for: .touchUpInside)
        return ca
    }()
    
    private let signInToContinue: UIButton = {
        let sc = UIButton()
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.backgroundColor = .gray.withAlphaComponent(0.2)
        sc.setTitle("Sign in to continue", for: .normal)
        sc.setTitleColor(UIColor.black, for: .normal)
        sc.layer.cornerRadius = 10
        sc.addTarget(self, action: #selector(logInTap), for: .touchUpInside)
        return sc
    }()
    
    var presenter: PreLoginPresenter!
    
    init(configurator: PreLoginConfigurator) {
        super.init(nibName: nil, bundle: nil)
        configurator.configure(vc: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
        presenter.viewDidLoad()
    }

}

extension PreLoginViewController: PreLoginView {
    
    func startLoading() {
        loader.startAnimating()
    }
    
    func endLoading() {
        loader.stopAnimating()
    }
    
}

//MARK: Setup
extension PreLoginViewController {
    
    private func setup() {
        addSubViews()
        setupConstraints()
    }
    
    private func addSubViews() {
        view.addSubview(imageView)
        view.addSubview(welcomeTxt)
        view.addSubview(descTxt)
        view.addSubview(createAccount)
        view.addSubview(signInToContinue)
        view.addSubview(loader)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            loader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height / 8),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            imageView.widthAnchor.constraint(equalToConstant: 120),
        ])
        
        NSLayoutConstraint.activate([
            welcomeTxt.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
            welcomeTxt.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            welcomeTxt.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
        ])
        
        NSLayoutConstraint.activate([
            descTxt.topAnchor.constraint(equalTo: welcomeTxt.bottomAnchor, constant: 20),
            descTxt.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            descTxt.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
        ])
        
        NSLayoutConstraint.activate([
            createAccount.topAnchor.constraint(equalTo: descTxt.bottomAnchor, constant: 160),
            createAccount.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            createAccount.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            createAccount.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            signInToContinue.topAnchor.constraint(equalTo: createAccount.bottomAnchor, constant: 10),
            signInToContinue.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            signInToContinue.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            signInToContinue.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}

extension PreLoginViewController {
    
    
  @objc func createAccountTap() {
      let registrationPageVC = UINavigationController(rootViewController: RegistrationViewController())
      registrationPageVC.modalPresentationStyle = .fullScreen
          self.present(registrationPageVC, animated: true, completion: nil)
  }
    
    @objc func logInTap() {
        let loginPageVC = UINavigationController(rootViewController: LoginViewController())
        loginPageVC.modalPresentationStyle = .fullScreen
            self.present(loginPageVC, animated: true, completion: nil)
    }

}
