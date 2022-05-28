//
//  schoolApplyCard.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/4/29.
//

import SwiftUI

struct schoolApplyCard: View {
    @EnvironmentObject var manager : AppManager
    var result : Bool
    var school : String
    var schoolImageURL : String
    
    var body: some View {
        if result == true{
            VStack{
                AsyncImage(url: URL(string: schoolImageURL)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: manager.screenWidth*0.15, height: manager.screenWidth*0.15)
                .padding(5)
                
                HStack{
                    Spacer()
                    Text(school).font(.footnote).fixedSize(horizontal: false, vertical: true).frame(width: 100, height: 40, alignment: .center).padding(1).multilineTextAlignment(.center)
                    
                    
                    Spacer()
                    
                }.padding(2)
                HStack{
                    Spacer()
                    Image(systemName: "checkmark").padding(2).foregroundColor(Color.green)
                    
                }
            }.padding(1).background(RoundedRectangle(cornerRadius: 5).fill(.white).shadow(radius: 3)).padding(2)
        }
        
        else{
            VStack{
                
                AsyncImage(url: URL(string: schoolImageURL)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: manager.screenWidth*0.15, height: manager.screenWidth*0.15)
                .padding(5)
               
                HStack{
                    Spacer()
                    Text(school).font(.footnote).fixedSize(horizontal: false, vertical: true).frame(width: 100, height: 40, alignment: .center).padding(1).multilineTextAlignment(.center)
                    
                    Spacer()
                    
                }.padding(2)
                HStack{
                    Spacer()
                    Image(systemName: "xmark").padding(2).foregroundColor(Color.red)
                }
            }.padding(1).background(RoundedRectangle(cornerRadius: 5).fill(.white).shadow(radius: 3)).padding(2)
        }
        
            
        
    }
}

