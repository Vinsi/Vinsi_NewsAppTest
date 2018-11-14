//
//  File.swift
//  NewsApp
//
//  Created by vinsi on 11/14/18.
//  Copyright © 2018 vinsi. All rights reserved.
//

import Foundation
import UIKit
class SearchViewController:UIViewController{
    
    @IBOutlet weak var searchTextField  : UITextField!
    
    @IBOutlet weak var languageTextField: VITextPicker!
    
    @IBOutlet weak var sourceTextField  : UITextField!
    
    @IBOutlet weak var domainTextField   :UITextField!
    
    @IBOutlet weak var excludedTextField: UITextField!
    
    @IBOutlet weak var fromDateTextField: UITextField!
    
    @IBOutlet weak var toDateTextField: UITextField!
    @IBOutlet weak var sortbyTextField: VITextPicker!
    
    @IBAction func searchButtonTapped(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        let frompickerview = UIDatePicker()
        
        self.languageTextField.picker.contents = Language.allValues()
        self.languageTextField.picker.onTitleCallBack = {
            return $0 as? String ?? ""
        }
        self.languageTextField.picker.onSelectCallBack = {
            self.languageTextField.text = $0 as? String ?? ""
        }
        self.languageTextField.inputView = self.languageTextField.picker.getPickerView()
        
        
        self.sortbyTextField.picker.contents = SortOrder.allValues()
        self.sortbyTextField.picker.onTitleCallBack = {
            return $0 as? String ?? ""
        }
        self.sortbyTextField.picker.onSelectCallBack = {
            self.sortbyTextField.text = $0 as? String ?? ""
        }
        self.sortbyTextField.inputView = self.sortbyTextField.picker.getPickerView()
        self.fromDateTextField.inputView = frompickerview
        self.toDateTextField.inputView = frompickerview
        
        
      
        
    
    }
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
