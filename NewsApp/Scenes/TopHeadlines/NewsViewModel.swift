//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by vinsi on 11/14/18.
//  Copyright © 2018 vinsi. All rights reserved.
//

import Foundation
import RxSwift
//protocol INewsAPIRequestParam {
//    var q        :String? {get set}
//    var page     :Int?    {get set}
//    var pageLimit:Int?    {get set}
//
//}
//extension EveryThingRequestModel :INewsAPIRequestParam {
//
//
//
//}
//extension TopHeadlinesRequestModel :INewsAPIRequestParam {
//
//
//}
class NewsViewModel{
    
    private let pagestart  :Int   = 1
    private let pageLimit  :Int   = 10
    private var currentPage:Int   = 1
    private var nextpageAvailable:Bool = false
    public  var newsType:Variable<NewsType> = Variable(.headLines)
    public var everythingRequestParam: Variable<EveryThingRequestModel> = Variable(EveryThingRequestModel())
    public var headlinesRequestParam:Variable<TopHeadlinesRequestModel> = Variable(TopHeadlinesRequestModel())
    public var newsRequest:EveryThingRequestModel = EveryThingRequestModel()
    var disposeBag:DisposeBag = DisposeBag()
    var isLoading:Variable<Bool> = Variable(false)
    var contents:Variable<[ArticleModel]> =  Variable([])
    var repo:IRepository? = Repository()
    weak var alert:IAlert?
  
    init() {
        newsRequest.pageSize = pageLimit
        self.newsType.asObservable().subscribe( { (event) in
            if event.element == NewsType.headLines {
                self.everythingRequestParam.value = EveryThingRequestModel()
                self.everythingRequestParam.value.pageSize = self.pageLimit
                self.everythingRequestParam.value.page     = self.pagestart
            }
            else {
                self.headlinesRequestParam.value = TopHeadlinesRequestModel()
                 self.headlinesRequestParam.value.pageSize = self.pageLimit
                 self.everythingRequestParam.value.page = self.pagestart
            }
         }).disposed(by: self.disposeBag)
       
    
    }
    func fetch(){
        
       
        self.isLoading.value = true
        let cpageno:Int = (self.newsType.value == .everything ? self.everythingRequestParam.value.page!: self.headlinesRequestParam.value.page!)
        let callback = { [weak self] (status:APIStatus, response:TopHeadlineResponseModel?) -> Void in
            
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
                
                if cpageno == 1 { //  new search
                    self?.contents.value = response?.articles ?? []
                    
                }
                else { // scrolling
                    
                    self?.contents.value.append(contentsOf: (response?.articles)!)
                }
                self?.nextpageAvailable = response?.isNextPageAvailable(currentPage: cpageno , itemsPerPage: selfObj.pageLimit ) ?? false
            }
            else {
                self?.alert?.showMessage(text: status.statusMessage, style: 1)
            }
        }
        if self.newsType.value == .everything {
             self.repo?.getEveryThing(requestObject: self.everythingRequestParam.value, responseCallback: callback )
        }
        else {
        self.repo?.getTopHeadlines(requestObject: self.headlinesRequestParam.value, responseCallback: callback )
        }
        
    }
    func nextPageFetch(){
        if self.nextpageAvailable {
            if self.newsType.value == .everything {
                self.everythingRequestParam.value.page = self.everythingRequestParam.value.page! + 1
            } else {
                  self.headlinesRequestParam.value.page = self.headlinesRequestParam.value.page! + 1
            }

          fetch()
        }
            
        
    }
}
