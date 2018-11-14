//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by vinsi on 11/14/18.
//  Copyright © 2018 vinsi. All rights reserved.
//

import Foundation
import RxSwift
class NewsViewModel{
    private let pagestart  :Int   = 1
    private let pageLimit  :Int   = 10
    private var currentPage:Int   = 1
    private var nextpageAvailable:Bool = false
    public var newsRequest:EveryThingRequestModel = EveryThingRequestModel()
    
    var isLoading:Variable<Bool> = Variable(false)
    var contents:Variable<[ArticleModel]> =  Variable([])
    var repo:IRepository? = Repository()
    weak var alert:IAlert?
    init() {
        newsRequest.pageSize = pageLimit
    
    }
    func fetch(){
        
        self.currentPage = newsRequest.page ?? 0
        self.isLoading.value = true
        
        self.repo?.getEveryThing(requestObject: newsRequest, responseCallback: { [weak self](status, response) in
            
            defer {
                self?.isLoading.value = false
            }
            
            if status.isSuccess(){
                guard let selfObj = self else{
                    
                    
                    return
                }
                guard (response?.articles?.count ?? -1)  > 0 else {
                    if self?.currentPage == 1 {
                          self?.contents.value = []
                        
                    }
                     self?.alert?.showMessage(text: "No search matching, please try again", style: 1)
                    return
                }
                if self?.currentPage == 1 { //  new search
                    self?.contents.value = response?.articles ?? []
                    
                }
                else { // scrolling
                
                self?.contents.value.append(contentsOf: (response?.articles)!)
                }
                self?.nextpageAvailable = response?.isNextPageAvailable(currentPage: selfObj.currentPage , itemsPerPage: selfObj.pageLimit ) ?? false
             }
            else {
                self?.alert?.showMessage(text: status.statusMessage, style: 1)
            }
        })
        
    }
    func nextPageFetch(){
        if self.nextpageAvailable {
          newsRequest.page = currentPage + 1
          fetch()
        }
            
        
    }
}
