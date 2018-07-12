//
//  PresenterController.swift
//  NewsBcc
//
//  Created by mahesh mahara on 7/6/18.
//  Copyright © 2018 mahesh mahara. All rights reserved.
//

import UIKit

protocol PresentProtocal {
    var view:NewsViewProtocal?{get set}
    func bccnewsfetch(news:[[String:Any]])
    func fetchnewdata()
    
    func fetcherror(error:String)
    
}

class PresenterController: PresentProtocal {
    
    var view: NewsViewProtocal?
    var interactor1:InteractorProtocal
    var router:RouterProtocal
    
    
    init(interactor1:InteractorProtocal  ,wirefram:RouterProtocal ) {
        self.interactor1 = interactor1
        self.router = wirefram
        
    }
    
    
    func bccnewsfetch(news: [[String:Any]]) {
        self.view?.dataget(newsdata: news)
        
    }
    
    func fetcherror(error: String) {
        self.view?.showerror(error: error)
        
        
    }
    
    func fetchnewdata() {
        
        self.interactor1.fetchdatafromapi()
        
    }
    
}
