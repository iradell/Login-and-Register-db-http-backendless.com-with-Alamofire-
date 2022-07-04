//
//  PreLoginConfigurator.swift
//  mBank
//
//  Created by Tornike Bardadze on 30.06.22.
//

import Foundation

protocol PreLoginConfigurator {
    func configure(vc: PreLoginViewController)
}

class PreLoginConfiguratorImpl: PreLoginConfigurator {
    
    
    func configure(vc: PreLoginViewController) {
        let presenter = PreLoginPresenterImpl(view: vc)
        vc.presenter = presenter
    }
    
    
}
