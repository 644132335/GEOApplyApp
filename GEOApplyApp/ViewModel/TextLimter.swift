//
//  TextLimter.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/5/22.
//

import Foundation

class TextLimiter: ObservableObject {
    @Published var text = "" {
        didSet {
            if text.count > characterLimit && oldValue.count <= characterLimit {
                text = oldValue
            }
        }
    }
    let characterLimit: Int
    
    init(limit: Int = 5){
        characterLimit = limit
    }
}
