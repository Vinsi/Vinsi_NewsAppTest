//
//  IOnePicker.swift
//  NewsApp
//
//  Created by vinsi on 11/14/18.
//  Copyright © 2018 vinsi. All rights reserved.
//

import Foundation
import UIKit
class VITextPicker:UITextField {
    var picker:VIOnePicker = VIOnePicker()
}
class VIOnePicker :NSObject{
    
    let picker:UIPickerView  = UIPickerView()
    var contents:[Any]?
    var onTitleCallBack:((_ object:Any?)->String)?
    var onSelectCallBack:(( _ object:Any?)->Void)?
    func getPickerView()->UIView {
        return picker
    }
    override init(){
      super.init()
        self.picker.delegate = self
         self.picker.dataSource = self
    }
   
}

extension VIOnePicker : UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return self.contents?.count ?? 0
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            
            return self.onTitleCallBack?(self.contents?[row])
        }
        return ""
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.onSelectCallBack?(self.contents?[row])
    }
  
 

    
}

