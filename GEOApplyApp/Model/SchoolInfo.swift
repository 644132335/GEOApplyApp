//
//  SchoolInfo.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/5/28.
//

import Foundation

struct schoolInfo: Codable,Identifiable,Hashable{
    var schoolName:String
    var rank:Int
    var schoolImageUrl:String
    var id=UUID()
}
