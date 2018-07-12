//
//  RouterViewController.swift
//  NewsBcc
//
//  Created by mahesh mahara on 7/10/18.
//  Copyright © 2018 mahesh mahara. All rights reserved.
//

import UIKit

protocol RouterProtocal
{
    func presenterpost(view:NewsViewProtocal)
}


class RouterViewController: RouterProtocal {
    func presenterpost(view: NewsViewProtocal) {
        
        print("hello")
    }
    

}
