//
//  BasicUser.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/5/20.
//

import Foundation

struct BasicUser : Codable,Identifiable,Hashable{
    var email:String?
    var userid:String?
    var name:String?
    var school:String?
    var nation:String?
    var major:String?
    var sat:Double?
    var tofel:Double?
    var gpa:Double?
    var gre:Double?
    var profile:Bool?
    var applyDegree:String?
    var gender:String?
    var age:Int?
    var avatarImageUrl:String?
    var id=UUID()
}
