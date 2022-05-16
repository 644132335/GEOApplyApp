//
//  UserInfo.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/5/16.
//

import Foundation

struct UserInfo : Codable{
   
    var userid:String?
    var name:String?
    var school:String?
    var nation:String?
    var major:String?
    var sat:Int?
    var tofel:Int?
    var gpa:Int?
    var id:String{userid ?? "00000"}
}
