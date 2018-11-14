//
//  SourceRequestModel.swift
//  NewsApp
//
//  Created by vinsi on 11/13/18.
//  Copyright © 2018 vinsi. All rights reserved.
//

import Foundation
public struct SourcesRequestModel:Codable {
    var category:Category?
    var language:Language?
    var country:Countries?

}
public extension SourcesRequestModel {
public func toDictionary()->[String:String]{
    
    var param:[String:String] = [:]
    if let  category                             =  self.category                { param["category"             ] =  category.rawValue            }
    if let  language                       =  self.language          { param["language"       ] =  language.rawValue        }
    if let  country                       =  self.country          { param["country"       ] =  country.rawValue        }

    
    return param
}
}
public enum Countries:String,Codable{
    
   case  ae = "ae"
   case  ar = "ar"
   case  at = "at"
   case  au = "au"
   case  be = "be"
   case  bg = "bg"
   case  br = "br"
   case  ca = "ca"
   case  ch = "ch"
   case  cn = "cn"
   case  co = "co"
   case  cu = "cu"
   case  cz = "cz"
   case  de = "de"
   case  eg = "eg"
   case  fr = "fr"
   case  gb = "gb"
   case  gr = "gr"
   case  hk = "hk"
   case  hu = "hu"
   case  id = "id"
   case  ie = "ie"
   case  il = "il"
   case  ind = "in"
   case  it = "it"
   case  jp = "jp"
   case  kr = "kr"
   case  lt = "lt"
   case  lv = "lv"
   case  ma = "ma"
   case  mx = "mx"
   case  my = "my"
   case  ng = "ng"
   case  nl = "nl"
   case  no = "no"
   case  nz = "nz"
   case  ph = "ph"
   case  pl = "pl"
   case  pt = "pt"
   case  ro = "ro"
   case  rs = "rs"
   case  ru = "ru"
   case  sa = "sa"
   case  se = "se"
   case  sg = "sg"
   case  si = "si"
   case  sk = "sk"
   case  th = "th"
   case  tr = "tr"
   case  tw = "tw"
   case  ua = "ua"
   case  us = "us"
   case  ve = "ve"
   case  za = "za"
    public func allValues() ->[String] {
        let items = [
             Countries.ae.rawValue,
             Countries.ar.rawValue,
             Countries.at.rawValue,
             Countries.au.rawValue,
             Countries.be.rawValue,
             Countries.bg.rawValue,
             Countries.br.rawValue,
             Countries.ca.rawValue,
             Countries.ch.rawValue,
             Countries.cn.rawValue,
             Countries.co.rawValue,
             Countries.cu.rawValue,
             Countries.cz.rawValue,
             Countries.de.rawValue,
             Countries.eg.rawValue,
             Countries.fr.rawValue,
             Countries.gb.rawValue,
             Countries.gr.rawValue,
             Countries.hk.rawValue,
             Countries.hu.rawValue,
             Countries.id.rawValue,
             Countries.ie.rawValue,
             Countries.il.rawValue,
             Countries.ind.rawValue,
             Countries.it.rawValue,
             Countries.jp.rawValue,
             Countries.kr.rawValue,
             Countries.lt.rawValue,
             Countries.lv.rawValue,
             Countries.ma.rawValue,
             Countries.mx.rawValue,
             Countries.my.rawValue,
             Countries.ng.rawValue,
             Countries.nl.rawValue,
             Countries.no.rawValue,
             Countries.nz.rawValue,
             Countries.ph.rawValue,
             Countries.pl.rawValue,
             Countries.pt.rawValue,
             Countries.ro.rawValue,
             Countries.rs.rawValue,
             Countries.ru.rawValue,
             Countries.sa.rawValue,
             Countries.se.rawValue,
             Countries.sg.rawValue,
             Countries.si.rawValue,
             Countries.sk.rawValue,
             Countries.th.rawValue,
             Countries.tr.rawValue,
             Countries.tw.rawValue,
             Countries.ua.rawValue,
             Countries.us.rawValue,
             Countries.ve.rawValue,
             Countries.za.rawValue
            
        ]
        return items
    }
}
