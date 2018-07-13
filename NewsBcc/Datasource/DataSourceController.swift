//
//  DataSourceController.swift
//  NewsBcc
//
//  Created by mahesh mahara on 7/6/18.
//  Copyright © 2018 mahesh mahara. All rights reserved.
//

import UIKit
import Alamofire


protocol DataApiProtocal:class {
    var interacrotor :InteractorProtocal?{get set}
    func NewsFetchBcc()
    
    
}

class DataSourceController: DataApiProtocal{
    
    var interacrotor: InteractorProtocal?
    
    func NewsFetchBcc() {
        
        Alamofire.request(Urllink.url).responseJSON { (responce) in
            
            if let responcevalue = responce.result.value as! [String:Any]? {
                
                if let responcenews = responcevalue["articles"] as! [[String:Any]]?
                {
                    let when = DispatchTime.now()
                    DispatchQueue.main.asyncAfter(deadline: when) {
                        
                       self.interacrotor?.newsfetchfromdatamanger(News: responcenews)
                        
                    }
                    
                }
                    
                else {
                    self.interacrotor?.errorfetchfrmdatamager(error: "Error Fetch News From Api")
                    
                }
                
            }
            
        }
        
    }
    
    
}
