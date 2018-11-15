//
//  File.swift
//  NewsApp
//
//  Created by vinsi on 11/14/18.
//  Copyright © 2018 vinsi. All rights reserved.
//

import Foundation
import UIKit

class SearchFilterEveryNewsViewModel{
    
    weak var newsViewModel:NewsViewModel?
    func search(){
        
        newsViewModel?.fetch()
    }

 }
class SearchFilterForEveryNewsViewController:UIViewController{
    
    
    
    var viewModel:SearchFilterEveryNewsViewModel? =  SearchFilterEveryNewsViewModel()
    @IBOutlet weak var searchTextField  : UITextField!
    
    @IBOutlet weak var languageTextField: VITextPicker!
    
    @IBOutlet weak var sourceTextField  : UITextField!
    
    @IBOutlet weak var domainTextField   :UITextField!
    
    @IBOutlet weak var excludedTextField: UITextField!
    
    @IBOutlet weak var fromDateTextField: UITextField!
    
    @IBOutlet weak var toDateTextField  : UITextField!
    @IBOutlet weak var sortbyTextField  : VITextPicker!
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        
        guard var param = self.viewModel?.newsViewModel?.everythingRequestParam.value else {
          return
        }
      
        param.q              = (searchTextField  .text == "" )    ? nil:searchTextField      .text
        param.sources        = (sourceTextField  .text == "" )    ? nil:sourceTextField      .text
        param.domains        = (domainTextField  .text == "" )    ? nil:domainTextField      .text
        param.excludeDomains = (excludedTextField.text == "" )    ? nil:excludedTextField    .text
        param.page           = 1
        param.pageSize       = 10
        self.viewModel?.newsViewModel?.everythingRequestParam.value = param
        
          self.dismiss(animated: true, completion: nil)
          self.viewModel?.search()


        
        
  
        
        
    }
    
    
    override func viewDidLoad() {
        
        let frompickerview = UIDatePicker()
             let topickerview = UIDatePicker()
        self.languageTextField.picker.contents = Language.allValues()
        self.languageTextField.picker.onTitleCallBack = {
            return $0 as? String ?? ""
        }
        self.languageTextField.picker.onSelectCallBack = {
            self.languageTextField.text = $0 as? String ?? ""
            self.viewModel?.newsViewModel?.everythingRequestParam.value.language = Language(rawValue: $0 as! String)
        }
        
        self.languageTextField.inputView = self.languageTextField.picker.getPickerView()
        
        
        self.sortbyTextField.picker.contents = SortOrder.allValues()
        self.sortbyTextField.picker.onTitleCallBack = {
            return $0 as? String ?? ""
        }
        self.sortbyTextField.picker.onSelectCallBack = {
            self.sortbyTextField.text = $0 as? String ?? ""
            self.viewModel?.newsViewModel?.everythingRequestParam.value.sortBy = SortOrder(rawValue: $0 as! String)
        }
        self.sortbyTextField.inputView = self.sortbyTextField.picker.getPickerView()
        self.fromDateTextField.inputView = frompickerview
        self.toDateTextField.inputView = topickerview
        
        
        frompickerview.addTarget(self, action: #selector(SearchFilterForEveryNewsViewController.handleFromDatePicker(sender:)), for: UIControl.Event.valueChanged)
        topickerview.addTarget(self, action: #selector(SearchFilterForEveryNewsViewController.handleToDatePicker(sender:)), for: UIControl.Event.valueChanged)
        
    }
    
   @objc func handleFromDatePicker(sender: UIDatePicker) {
    let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
    self.fromDateTextField.text = dateFormatter.string(from: sender.date)
    self.viewModel?.newsViewModel?.everythingRequestParam.value.from
        = sender.date
    }
        
   @objc func handleToDatePicker(sender: UIDatePicker) {
    let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
       self.toDateTextField.text = dateFormatter.string(from: sender.date)
       self.viewModel?.newsViewModel?.everythingRequestParam.value.to = sender.date
    
    }
        
    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
