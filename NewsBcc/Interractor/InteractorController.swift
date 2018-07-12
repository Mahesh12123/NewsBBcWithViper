//
//  InteractorController.swift
//  NewsBcc
//
//  Created by mahesh mahara on 7/6/18.
//  Copyright © 2018 mahesh mahara. All rights reserved.
//

import UIKit

protocol InteractorProtocal:class {
    var presenter:PresentProtocal?{get set}
    
    func newsfetchfromdatamanger(News:[[String:Any]])
    func fetchdatafromapi()
    func errorfetchfrmdatamager(error:String)
    
}

class InteractorController: InteractorProtocal   {
    
    
    var presenter: PresentProtocal?
    var datamaneger:DataApiProtocal?
    
    init(datamager1:DataApiProtocal) {
        self.datamaneger = datamager1
        
    }
    
    func fetchdatafromapi() {
        let when = DispatchTime.now() + 0.5
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.datamaneger?.NewsFetchBcc()
        }
        
    }
    
    
    func newsfetchfromdatamanger(News: [[String:Any]]) {
        
        self.presenter?.bccnewsfetch(news: News)
        
    }
    
    func errorfetchfrmdatamager(error: String) {
        
        self.errorfetchfrmdatamager(error: error)
        
    }
    
    
    
}
