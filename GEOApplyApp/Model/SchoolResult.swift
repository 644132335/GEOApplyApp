//
//  SchoolResult.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/5/30.
//

import Foundation

struct schoolReslt: Codable,Identifiable,Hashable{
    var schoolName:String
    var result:String
    var schoolurl:String
    var id=UUID()
}

