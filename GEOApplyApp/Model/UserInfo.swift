//
//  UserInfo.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/5/16.
//

import Foundation

struct UserInfo : Codable,Identifiable,Hashable{
   
    var userid:String?
    var name:String?
    var school:String?
    var nation:String?
    var major:String?
    var sat:Double?
    var tofel:Double?
    var gre:Double?
    var gpa:Double?
    var intro:String?
    var view:Int?
    var follow:Int?
    var applyinfo:[schoolReslt]?
    var avatarImageURL:String?
    var degree:String?
    var id=UUID()
}
