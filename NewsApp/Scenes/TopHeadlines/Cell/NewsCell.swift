//
//  NewsCell.swift
//  NewsApp
//
//  Created by vinsi on 11/14/18.
//  Copyright © 2018 vinsi. All rights reserved.
//

import Foundation
import UIKit
import DateToolsSwift
import Kingfisher
class DetailCellButton:UIButton {
    var article:ArticleModel!
    weak var  viewController:UIViewController?
}
class NewsCell:UITableViewCell,CellConfigurable {
   
    

    
    
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var authorLabel:UILabel!
    @IBOutlet weak var descriptionLabel:UILabel!
    @IBOutlet weak var publishedAtLabel:UILabel!
    @IBOutlet weak var contentLabel:UILabel!
    @IBOutlet weak var newsImageView:UIImageView!
    @IBOutlet weak var detailButton:DetailCellButton!
  
    static var identifier: String { return "NewsCell" }
    
    func configure(modelObject: [ArticleModel], rowAt: IndexPath , viewController:UIViewController) {
        
        let data = modelObject[rowAt.row]
        titleLabel         .text = data.title ?? "Unknown"
        authorLabel        .text = data.author ?? "Unknown"
        descriptionLabel   .text = data.description ?? "Unknown"
        publishedAtLabel   .text = data.publishedAt?.timeAgoSinceNow ?? "Unknown"
        contentLabel       .text = data.content ?? "Unknown"
        newsImageView      .kf.setImage(with: data.urlToImage)
        detailButton.article = data
        detailButton.viewController = viewController
        
        
     
        
        
        
    }
    
    @IBAction func detailButtonTapped(_ sender: DetailCellButton) {
        
        sender.viewController?.performSegue(withIdentifier: "showdetail", sender: detailButton.article)
        
        
    }
    
}
