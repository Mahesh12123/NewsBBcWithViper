//
//  CustomTableViewCell.swift
//  NewsBcc
//
//  Created by mahesh mahara on 7/11/18.
//  Copyright © 2018 mahesh mahara. All rights reserved.
//

import UIKit
import Foundation

class CustomTableViewCell: UITableViewCell {

    var titlelabel = UILabel()
    var describelabel = UILabel()
    var showmorebtn = UIButton()
    var showurl = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titlelabel.translatesAutoresizingMaskIntoConstraints = false
        describelabel.translatesAutoresizingMaskIntoConstraints = false
        showmorebtn.translatesAutoresizingMaskIntoConstraints = false
        showurl.translatesAutoresizingMaskIntoConstraints = false
     
        titlelabel  = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 30))
        titlelabel.font = UIFont.boldSystemFont(ofSize: 20)
        titlelabel.numberOfLines = 0

        
        describelabel  = UILabel(frame: CGRect(x: 0, y: 30, width: 400, height: 70))
        describelabel.font = UIFont.boldSystemFont(ofSize: 15)
        describelabel.numberOfLines = 0
   
        
        showmorebtn = UIButton(frame: CGRect(x: 0, y: 100, width: 400, height: 60))
        showmorebtn.setTitle("ShowDetail", for: .normal)
        showmorebtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        showmorebtn.backgroundColor = .blue
        
        self.showmorebtn.addTarget(self, action: #selector(showdetail), for: .touchUpInside)
        self.contentView.addSubview(titlelabel)
        self.contentView.addSubview(describelabel)
        self.contentView.addSubview(showmorebtn)
    
    }

    @objc   func showdetail() {
        print("showdetail = \(showurl)")
        if let url = URL(string: "showurl") {
            UIApplication.shared.open(url, options: [:])
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
