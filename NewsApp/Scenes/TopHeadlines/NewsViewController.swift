//
//  ViewController.swift
//  NewsApp
//
//  Created by vinsi on 11/13/18.
//  Copyright © 2018 vinsi. All rights reserved.
//

import UIKit
import RxSwift

class BaseViewController :UIViewController {
     var utility:IBasicUtility? = BasicUtility()
    func initialize(){
        self.navigationController?.navigationBar.isHidden = true
        self.utility?.alert?.initialize(baseController: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
    }
}
class NewsViewController: BaseViewController {
    
    var viewModel:NewsViewModel? = NewsViewModel()
   
    let disposeBag:DisposeBag = DisposeBag()
    @IBOutlet var searchTextField:UITextField!
    @IBOutlet var tableView: UITableView!
    @IBAction func searchButtonTapped(sender:UIButton){
        if self.searchTextField.text == ""  {
            self.utility?.alert?.showMessage(text: "please fill keyword", style: 1)
            return
        }
        self.viewModel?.newsRequest.language = Language.en
        self.viewModel?.newsRequest.sortBy   = SortOrder.publishedAt
        self.viewModel?.newsRequest.q   = self.searchTextField.text
        self.viewModel?.newsRequest.page = 1
        self.viewModel?.fetch()
    }
    override func initialize(){
        super.initialize()
        self.viewModel?.alert = self.utility?.alert
        self.tableView.rowHeight =  UITableView.automaticDimension
     
        
        viewModel?.isLoading.asObservable().subscribe({ (event) in
           
            if event.element == true {
                DispatchQueue.main.async {
                    self.utility?.activity?.showHud(inView: UIApplication.shared.keyWindow!)
                }
                
                
                
            }
            else {
                DispatchQueue.main.async {
                  
                  
                    self.tableView.reloadData()
                    self.utility?.activity?.hide()
                }
                }
            
                
               
                
            
            
        }).disposed(by: self.disposeBag)
        
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()

       
      
       
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
}
extension NewsViewController :UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.contents.value.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.identifier, for: indexPath) as! NewsCell
        cell.configure(modelObject: self.viewModel?.contents.value ?? [] ,rowAt: indexPath ,viewController: self )
        if indexPath.row == (self.viewModel?.contents.value.count ?? 0) - 1 {
            self.viewModel?.nextPageFetch()
        }
        return cell
        
    }

  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "showdetail" {
            if let article = sender as?ArticleModel {
            if let vwc = segue.destination as? WebViewController {
                vwc.viewModel?.article = article
                
            }
            }
        }
        
        
    }


}

