//
//  ApplyInfoCard.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/4/28.
//

import SwiftUI
import SDWebImageSwiftUI

struct ApplyInfoCard: View {
    @EnvironmentObject var manager : AppManager
    var name:String
    var nation:String
    var school:String
    var gpa:Double
    var sat:Double
    var tofel:Double
    var gre:Double
    var avatarURL:String
    var degree:String
    var schoolImage:String
    
    var body: some View {
        VStack{
            HStack{
                
                WebImage(url: URL(string: avatarURL))
                    .resizable()
                    .clipShape(Circle())
                    .frame(width:manager.screenWidth*0.17, height: manager.screenWidth*0.17)
                    .shadow(radius: 3)
               
                VStack{
                    HStack{
                        Text(name).foregroundColor(.black.opacity(0.8)).bold().lineLimit(1)
                        Spacer()
                            
                        WebImage(url: URL(string: schoolImage))
                            .resizable()
                            .frame(width:manager.screenWidth*0.1, height: manager.screenWidth*0.1)
                            .opacity(0.5)
                    }
                    HStack{
                        Text(nation).foregroundColor(.black.opacity(0.6)).font(Font.footnote).lineLimit(1)
                        Spacer()
                    }
                    HStack{
                        Text(school).foregroundColor(.black.opacity(0.6)).font(Font.footnote).lineLimit(1)
                        Spacer()
                    }
                    HStack{
                        Text(degree).foregroundColor(.black.opacity(0.6)).font(Font.footnote).lineLimit(1)
                        Spacer()
                    }
                    
                }
                
                Spacer()
            }
            if degree == "Bachelor"{
                HStack{
                    Text("TOFEL: "+String(format: "%.0f", tofel)).foregroundColor(.black.opacity(0.6)).font(Font.footnote)
                    Divider()
                    Text("GPA: "+String(format: "%.2f", gpa)).foregroundColor(.black.opacity(0.6)).font(Font.footnote)
                    Divider()
                    Text("SAT: "+String(format: "%.0f", sat)).foregroundColor(.black.opacity(0.6)).font(Font.footnote)
                }
            }else if degree == "Master"{
                HStack{
                    Text("TOFEL: "+String(format: "%.0f", tofel)).foregroundColor(.black.opacity(0.6)).font(Font.footnote)
                    Divider()
                    Text("GPA: "+String(format: "%.2f", gpa)).foregroundColor(.black.opacity(0.6)).font(Font.footnote)
                    Divider()
                    Text("GRE: "+String(format: "%.0f", gre)).foregroundColor(.black.opacity(0.6)).font(Font.footnote)
                }
            }else{
                HStack{
                    Text("TOFEL: "+String(format: "%.0f", tofel)).foregroundColor(.black.opacity(0.6)).font(Font.footnote)
                    Divider()
                    Text("GPA: "+String(format: "%.2f", gpa)).foregroundColor(.black.opacity(0.6)).font(Font.footnote)
                    
                }
            }
            
            
        
        }.padding().background(RoundedRectangle(cornerRadius: 5).fill(.white).shadow(radius: 2))
    }
}
