//
//  ApplyInfoCard.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/4/28.
//

import SwiftUI

struct ApplyInfoCard: View {
    var name:String
    var nation:String
    var school:String
    var gpa:Double
    var sat:Double
    var tofel:Double
    var body: some View {
        VStack{
            HStack{
                VStack{
                    Circle().frame(width: 60, height: 60).clipShape(Circle()).shadow(radius: 6).foregroundColor(.blue.opacity(0.4)).padding()
                }
               
                VStack{
                    HStack{
                        Text(name).foregroundColor(.black.opacity(0.8)).bold()
                        Spacer()
                    }
                    HStack{
                        Text(nation).foregroundColor(.black.opacity(0.6)).font(Font.footnote)
                        Spacer()
                    }
                    HStack{
                        Text(school).foregroundColor(.black.opacity(0.6)).font(Font.footnote)
                        Spacer()
                    }
                    
                }
                
                Spacer()
            }
            HStack{
                Text("TOFEL: "+String(format: "%.0f", tofel)).foregroundColor(.black.opacity(0.6)).font(Font.footnote)
                Divider()
                Text("GPA: "+String(format: "%.2f", gpa)).foregroundColor(.black.opacity(0.6)).font(Font.footnote)
                Divider()
                Text("SAT: "+String(format: "%.0f", sat)).foregroundColor(.black.opacity(0.6)).font(Font.footnote)
            }
            
        
        }.padding().background(RoundedRectangle(cornerRadius: 5).fill(.white).shadow(radius: 2))
    }
}


