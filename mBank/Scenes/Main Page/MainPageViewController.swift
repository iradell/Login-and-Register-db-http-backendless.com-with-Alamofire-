//
//  MainPageViewController.swift
//  mBank
//
//  Created by Tornike Bardadze on 01.07.22.
//

import UIKit

class MainPageViewController: UIViewController {

    
    private let balanceLabel: UILabel = {
        let bl = UILabel()
        bl.translatesAutoresizingMaskIntoConstraints = false
        bl.font = UIFont(name: "Trebuchet MS", size: 15)
        bl.text = "Balance"
        bl.textColor = .black.withAlphaComponent(0.85)
        return bl
    }()
    
    
    private let moneyLabel: UILabel = {
        let ml = UILabel()
        ml.translatesAutoresizingMaskIntoConstraints = false
        ml.font = UIFont(name: "Trebuchet MS", size: 50)
        ml.text = "86.73 $"
        ml.textColor = .black
        return ml
    }()
    
    private let imageView: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "2.jpg")
        iv.layer.cornerRadius = 30
        iv.clipsToBounds = true
        return iv
    }()
    
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 38
        return sv
    }()
    
    private let topUpBtn: UIView = {
       let tpb = UIView()
        tpb.translatesAutoresizingMaskIntoConstraints = false
        tpb.backgroundColor = .blue.withAlphaComponent(0.7)
        tpb.layer.cornerRadius = 24
        tpb.clipsToBounds = true
        return tpb
    }()
    
    private let topUpBtnImg: UIImageView = {
       let rmi = UIImageView()
        rmi.translatesAutoresizingMaskIntoConstraints = false
        rmi.image = UIImage(systemName: "iphone")
        rmi.tintColor = .white
        return rmi
    }()
    
    private let topUpTxt: UILabel = {
       let tp = UILabel()
        tp.translatesAutoresizingMaskIntoConstraints = false
        tp.text = "Top Up"
        tp.textColor = .black
        tp.font = UIFont(name: "Trebuchet MS", size: 15)
        return tp
    }()
    
    private let requestMn: UIView = {
       let tpb = UIView()
        tpb.translatesAutoresizingMaskIntoConstraints = false
        tpb.backgroundColor = .blue.withAlphaComponent(0.7)
        tpb.layer.cornerRadius = 24
        tpb.clipsToBounds = true
        return tpb
    }()
    
    private let requestMnImg: UIImageView = {
       let rmi = UIImageView()
        rmi.translatesAutoresizingMaskIntoConstraints = false
        rmi.image = UIImage(systemName: "giftcard")
        rmi.tintColor = .white
        return rmi
    }()
    
    
    private let requestMnTxt: UILabel = {
       let tp = UILabel()
        tp.translatesAutoresizingMaskIntoConstraints = false
        tp.text = "Request Money"
        tp.numberOfLines = 0
        tp.textColor = .black
        tp.font = UIFont(name: "Trebuchet MS", size: 15)
        return tp
    }()
    
    
    private let withdrawMn: UIView = {
       let tpb = UIView()
        tpb.translatesAutoresizingMaskIntoConstraints = false
        tpb.backgroundColor = .blue.withAlphaComponent(0.7)
        tpb.layer.cornerRadius = 24
        tpb.clipsToBounds = true
        return tpb
    }()
    
    private let withdrawMnImg: UIImageView = {
       let rmi = UIImageView()
        rmi.translatesAutoresizingMaskIntoConstraints = false
        rmi.image = UIImage(systemName: "creditcard.circle")
        rmi.tintColor = .white
        return rmi
    }()
    
    private let withdrawMnTxt: UILabel = {
       let tp = UILabel()
        tp.translatesAutoresizingMaskIntoConstraints = false
        tp.text = "Withdraw"
        tp.numberOfLines = 0
        tp.textColor = .black
        tp.font = UIFont(name: "Trebuchet MS", size: 15)
        return tp
    }()
    
    private let cardDetails: UIView = {
       let tpb = UIView()
        tpb.translatesAutoresizingMaskIntoConstraints = false
        tpb.backgroundColor = .blue.withAlphaComponent(0.7)
        tpb.layer.cornerRadius = 24
        tpb.clipsToBounds = true
        return tpb
    }()
    
    private let cardDetailsImg: UIImageView = {
       let rmi = UIImageView()
        rmi.translatesAutoresizingMaskIntoConstraints = false
        rmi.image = UIImage(systemName: "creditcard.and.123")
        rmi.tintColor = .white
        return rmi
    }()
    
    private let cardDetailsTxt: UILabel = {
       let tp = UILabel()
        tp.translatesAutoresizingMaskIntoConstraints = false
        tp.text = "Card Details"
        tp.numberOfLines = 0
        tp.textColor = .black
        tp.font = UIFont(name: "Trebuchet MS", size: 15)
        return tp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
        navBarItems()
    }

}

//MARK: Setup
extension MainPageViewController {
    
    private func setup() {
        addSubViews()
        setupConstraints()
    }
    
    private func addSubViews() {
        view.addSubview(balanceLabel)
        view.addSubview(moneyLabel)
        view.addSubview(imageView)
        view.addSubview(stackView)
        stackView.addArrangedSubview(topUpBtn)
        stackView.addArrangedSubview(requestMn)
        stackView.addArrangedSubview(withdrawMn)
        stackView.addArrangedSubview(cardDetails)
        topUpBtn.addSubview(topUpBtnImg)
        requestMn.addSubview(requestMnImg)
        withdrawMn.addSubview(withdrawMnImg)
        cardDetails.addSubview(cardDetailsImg)
        view.addSubview(topUpTxt)
        view.addSubview(requestMnTxt)
        view.addSubview(withdrawMnTxt)
        view.addSubview(cardDetailsTxt)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            balanceLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height / 6),
            balanceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
        NSLayoutConstraint.activate([
            moneyLabel.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 5),
            moneyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height / 7 ),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 130),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 60),
        ])
        NSLayoutConstraint.activate([
            topUpBtnImg.centerXAnchor.constraint(equalTo: topUpBtn.centerXAnchor),
            topUpBtnImg.centerYAnchor.constraint(equalTo: topUpBtn.centerYAnchor),
            topUpBtnImg.heightAnchor.constraint(equalToConstant: 35),
            topUpBtnImg.widthAnchor.constraint(equalToConstant: 35),
            
            topUpTxt.topAnchor.constraint(equalTo: topUpBtnImg.bottomAnchor, constant: 18),
            topUpTxt.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27),
        
            requestMnImg.centerXAnchor.constraint(equalTo: requestMn.centerXAnchor),
            requestMnImg.centerYAnchor.constraint(equalTo: requestMn.centerYAnchor),
            requestMnImg.heightAnchor.constraint(equalToConstant: 32),
            requestMnImg.widthAnchor.constraint(equalToConstant: 35),
        
            requestMnTxt.topAnchor.constraint(equalTo: requestMnImg.bottomAnchor,constant: 22),
            requestMnTxt.leadingAnchor.constraint(equalTo: topUpTxt.trailingAnchor, constant: 20),
            
            withdrawMnImg.centerXAnchor.constraint(equalTo: withdrawMn.centerXAnchor),
            withdrawMnImg.centerYAnchor.constraint(equalTo: withdrawMn.centerYAnchor),
            withdrawMnImg.heightAnchor.constraint(equalToConstant: 35),
            withdrawMnImg.widthAnchor.constraint(equalToConstant: 35),
            
            withdrawMnTxt.topAnchor.constraint(equalTo: withdrawMnImg.bottomAnchor, constant: 22),
            withdrawMnTxt.leadingAnchor.constraint(equalTo: requestMnTxt.trailingAnchor, constant: 18),
            
            cardDetailsImg.centerXAnchor.constraint(equalTo: cardDetails.centerXAnchor),
            cardDetailsImg.centerYAnchor.constraint(equalTo: cardDetails.centerYAnchor),
            cardDetailsImg.heightAnchor.constraint(equalToConstant: 32),
            cardDetailsImg.widthAnchor.constraint(equalToConstant: 35),
            
            cardDetailsTxt.topAnchor.constraint(equalTo: cardDetailsImg.bottomAnchor, constant: 24),
            cardDetailsTxt.leadingAnchor.constraint(equalTo: withdrawMnTxt.trailingAnchor, constant: 20),
            cardDetailsTxt.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
    }
    
}






//MARK: NAVBAR CONFIG
extension MainPageViewController {
    
    private func navBarItems() {
        navLeftBar()
        navRightBar()
        
    }
    
    private func navLeftBar() {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont(name: "Graphik Medium", size: 15)
        label.text = "Main Page"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
    }
    
    private func navRightBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "gearshape"),
            style: .done,
            target: self,
            action: #selector(logOut))
        
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @objc func logOut() {
        let preLogin = UINavigationController(rootViewController: PreLoginViewController(configurator: PreLoginConfiguratorImpl()))
        preLogin.modalPresentationStyle = .fullScreen
        self.present(preLogin, animated: true, completion: nil)
    }
    
}
