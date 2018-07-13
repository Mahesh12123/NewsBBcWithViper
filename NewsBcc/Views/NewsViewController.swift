//
//  NewsViewController.swift
//  NewsBcc
//
//  Created by mahesh mahara on 7/6/18.
//  Copyright © 2018 mahesh mahara. All rights reserved.
//

import UIKit

protocol NewsViewProtocal:class {
    
    func dataget(newsdata:[[String:Any]])
    func showerror(error:String)
}

class NewsViewController: UIViewController ,UITableViewDataSource ,UITableViewDelegate  , NewsViewProtocal
{
    
    var presenter :PresentProtocal
    
    let tableview:UITableView
    
    init(presenter:PresentProtocal)
    {
        
        self.presenter = presenter
        tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        super.init(nibName:nil , bundle:nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    var news:[[String:Any]] = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        self.view.addSubview(tableview)
        self.tableview.register(CustomTableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        self.presenter.fetchnewdata()
        
        let views = ["tableview":tableview]
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[tableview]|", options: [], metrics: nil, views: views))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[tableview]|", options: [], metrics: nil, views: views))
        
        
    }
    
    
    func dataget(newsdata: [[String:Any]]) {
        
        self.news = newsdata
        self.tableview.reloadData()
        
    }
    
    func showerror(error: String) {
        let alert = UIAlertController(title: "Alert", message: error, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return news.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        if self.news.count > 0 {
            
            let eachnews = self.news[indexPath.row]
            
            cell.titlelabel.text = (eachnews["title"] as? String ) ?? ""
            cell.describelabel.text = (eachnews["description"] as? String) ?? ""
            cell.showurl.text = (eachnews["url"] as? String) ?? ""
          
         
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 180.0
        
        
    }
    
    
    
}
