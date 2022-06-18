//
//  ApplyInfoCard.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/4/28.
//

import SwiftUI

struct ApplyInfoCard: View {
    @EnvironmentObject var manager : AppManager
    var name:String
    var nation:String
    var school:String
    var gpa:Double
    var sat:Double
    var tofel:Double
    var body: some View {
        VStack{
            HStack{
                HStack{
                    
                }
                Image("DefaultAvatar")
                    .resizable()
                    .scaledToFit()
                
                    .clipShape(Circle())
                    .frame(width:manager.screenWidth*0.2, height: manager.screenWidth*0.2)
                    .overlay{
                        Circle().stroke(lineWidth:3).foregroundStyle(manager.LoginbuttonColor)
                    }.shadow(radius: 3)
                
                
                
               
                VStack{
                    HStack{
                        Text(name).foregroundColor(.black.opacity(0.8)).bold().lineLimit(1)
                        Spacer()
                    }
                    HStack{
                        Text(nation).foregroundColor(.black.opacity(0.6)).font(Font.footnote).lineLimit(1)
                        Spacer()
                    }
                    HStack{
                        Text(school).foregroundColor(.black.opacity(0.6)).font(Font.footnote).lineLimit(1)
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
struct ApplyInfoCard_preview: PreviewProvider {
    static var previews: some View {
        ApplyInfoCard(name: "dasdasd", nation: "China", school: "jdklsajdklasjldjdlskad", gpa: 3.2, sat: 1100.0, tofel: 110.0).environmentObject(AppManager())
    }
}
