//
//  ApplyDetail.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/4/28.
//

import SwiftUI

struct ApplyDetail: View {
    @EnvironmentObject var manager : AppManager
    
    var body: some View {
        ZStack{
            
            ScrollView{
            VStack{
                HStack{
                    Spacer()
                    VStack{
                        Circle().frame(width: 60, height: 60).clipShape(Circle()).shadow(radius: 6).foregroundColor(.blue.opacity(0.4))
                        Text("Matthew Jiang").foregroundColor(.black.opacity(0.8)).bold()
                        Text("Havard University").foregroundColor(.black.opacity(0.4)).font(.footnote)
                    }
                    Spacer()
                }
                Divider()
                VStack{
                   IntroSec(text: "In an essay, article, or book, an introduction is a beginning section which states the purpose and goals of the following writing. This is generally followed by the body and conclusion. The introduction typically describes the scope of the document")
                   
                   BasicInfo(manager: _manager, nationality: "China", school: "Havard", major: "Computer Science")
                   ApplyInfoSec()
                   ScoreSec()
                }
                
            }
            }
        }.toolbar(){
            ToolbarItem(placement: .navigationBarTrailing){
                
            }
        }
    }
}

