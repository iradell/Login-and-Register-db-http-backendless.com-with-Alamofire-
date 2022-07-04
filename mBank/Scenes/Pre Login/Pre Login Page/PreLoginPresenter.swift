//
//  PreLoginPresenter.swift
//  mBank
//
//  Created by Tornike Bardadze on 30.06.22.
//

import Foundation

protocol PreLoginView: AnyObject {
    func startLoading()
    func endLoading()
}

protocol PreLoginPresenter {
    func viewDidLoad()
}

class PreLoginPresenterImpl: PreLoginPresenter {
    
    weak var view: PreLoginView?
    
    init (view: PreLoginView) {
        self.view = view
    }
    
    func viewDidLoad() {
        view?.endLoading()
    }
    
    
    
}
