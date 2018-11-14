//
//  TableViewController.swift
//  NewsApp
//
//  Created by vinsi on 11/14/18.
//  Copyright © 2018 vinsi. All rights reserved.
//

import Foundation
import UIKit


protocol CellConfigurable {
    associatedtype T
    
    static var identifier: String { get }
    func configure(modelObject: [T],rowAt:IndexPath ,viewController:UIViewController )
}
class GenericTableViewController<Cell: CellConfigurable> : UIViewController ,UITableViewDelegate, UITableViewDataSource where Cell:UITableViewCell {
   var  tableView:UITableView!
    var source: [Cell.T] = []
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return source.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.identifier, for: indexPath) as! Cell
        //cell.configure(modelObject: source as [Cell.T],rowAt: indexPath )
        
        return cell as UITableViewCell
        
    }
    
   
}

