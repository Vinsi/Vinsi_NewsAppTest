//
//  searcha.swift
//  NewsApp
//
//  Created by vinsi on 11/15/18.
//  Copyright © 2018 vinsi. All rights reserved.
//

import Foundation
import UIKit
class SearchFilterHeadlinesViewModel {
    weak var newsViewModel:NewsViewModel?
    func search(){
        self.newsViewModel?.fetch()
    }
}
class SearchFilterForHeadlinesViewController:UIViewController{
    
    
    
    var viewModel:SearchFilterHeadlinesViewModel? =  SearchFilterHeadlinesViewModel()
    

    @IBOutlet weak var searchTextField  : UITextField!
    
    @IBOutlet weak var countryTextField: VITextPicker!
    
    @IBOutlet weak var sourceTextField  : UITextField!
    
    @IBOutlet weak var categoryTextField   :VITextPicker!

    
    @IBAction func searchButtonTapped(_ sender: Any) {
        
        guard var param = self.viewModel?.newsViewModel?.headlinesRequestParam.value else {
            return
        }
        
        param.q              = (searchTextField  .text == "" )    ? nil:searchTextField      .text
        param.sources        = (sourceTextField  .text == "" )    ? nil:sourceTextField      .text
       
        param.page           = 1
        param.pageSize       = 10
        self.viewModel?.newsViewModel?.headlinesRequestParam.value = param
        
        self.dismiss(animated: true, completion: nil)
        self.viewModel?.search()
        
        
        
        
        
        
        
    }
    
    
    override func viewDidLoad() {
        
        self.countryTextField.picker.contents = Countries.allValues()
        self.countryTextField.picker.onTitleCallBack = {
            return $0 as? String ?? ""
        }
        self.countryTextField.picker.onSelectCallBack = {
            self.countryTextField.text = $0 as? String ?? ""
            self.viewModel?.newsViewModel?.headlinesRequestParam.value.country = Countries(rawValue: $0 as! String)
        }
        
        self.countryTextField.inputView = self.countryTextField.picker.getPickerView()
        
        
        self.categoryTextField.picker.contents = Category.allValues()
        self.categoryTextField.picker.onTitleCallBack = {
            return $0 as? String ?? ""
        }
        self.categoryTextField.picker.onSelectCallBack = {
            self.categoryTextField.text = $0 as? String ?? ""
            self.viewModel?.newsViewModel?.headlinesRequestParam.value.category = Category(rawValue: $0 as! String)
        }
       
         self.categoryTextField.inputView = self.categoryTextField.picker.getPickerView()
        
    }
    

    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
