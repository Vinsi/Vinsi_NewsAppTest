//
//  ViewController.swift
//  NewsApp
//
//  Created by vinsi on 11/13/18.
//  Copyright © 2018 vinsi. All rights reserved.
//

import UIKit
import RxSwift
public enum NewsType:Int{
    case headLines = 0
    case everything = 1
    func toString()->String{
        return ["Headlines","Everything"] [self.rawValue]
        
    }
    func toggleValue()->NewsType{
        
        if self == .headLines { return .everything}
        else {return .headLines}
    }
}

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
    
  
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var searchTextField:UITextField!
    @IBOutlet var tableView: UITableView!
    @IBAction func searchButtonTapped(sender:UIButton){
        if self.searchTextField.text == ""  {
            self.utility?.alert?.showMessage(text: "please fill keyword", style: 1)
            return
        }
        if  self.viewModel?.newsType.value == NewsType.headLines {
            self.viewModel?.headlinesRequestParam.value.q = self.searchTextField.text
            self.viewModel?.headlinesRequestParam.value.page = 1
        }
        else {
            
            self.viewModel?.everythingRequestParam.value.language = Language.en
            self.viewModel?.everythingRequestParam.value.sortBy   = SortOrder.publishedAt
            self.viewModel?.everythingRequestParam.value.q   = self.searchTextField.text
            self.viewModel?.everythingRequestParam.value.page = 1
        }
      
        self.viewModel?.fetch()
    }
    override func initialize(){
        super.initialize()
        self.viewModel?.alert = self.utility?.alert
        self.tableView.rowHeight =  UITableView.automaticDimension
     
        viewModel?.newsType.asObservable().subscribe({ (event) in
            self.titleLabel.text = event.element?.toString()
           
            
        }).disposed(by: self.disposeBag)
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
    @IBAction func filterButtonTapped(_ sender:UIButton){
        if self.viewModel?.newsType.value == NewsType.everything {
        self.performSegue(withIdentifier: "everyfilter", sender: self.viewModel)
        }
        else {
            
                self.performSegue(withIdentifier: "headlinefilter", sender: self.viewModel)
            
        }
    }
    @IBAction func titleButtonTapped(_ sender:UIButton){
        if let viewmdl = self.viewModel {
           viewmdl.newsType.value =  viewmdl.newsType.value.toggleValue()
        }
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
        else if let vwc = segue.destination as? SearchFilterForEveryNewsViewController{
            vwc.viewModel?.newsViewModel = self.viewModel
            
            
        }
        
        
    }


}

