//
//  schoolApplyCard.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/4/29.
//

import SwiftUI
import SDWebImageSwiftUI
struct schoolApplyCard: View {
    @EnvironmentObject var manager : AppManager
    var result : String
    var school : String
    var schoolImageURL : String
    var major : String
    
    var body: some View {
        if result == "accepted"{
            VStack{
//                WebImage(url: URL(string: schoolImageURL))
//                .resizable()
                AsyncImage(url: URL(string: schoolImageURL)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: manager.screenWidth*0.15, height: manager.screenWidth*0.15)
                .padding(5)
                
                HStack{
                    Spacer()
                    Text(school).font(.footnote).fixedSize(horizontal: false, vertical: true).frame(width: manager.screenWidth*0.3, height: manager.screenWidth*0.02, alignment: .center).padding(1).multilineTextAlignment(.center).lineLimit(2).foregroundColor(.black)
                    
                    
                    Spacer()
                    
                }.padding(2)
                Spacer().frame(height:manager.screenWidth*0.03)
                HStack{
                    Spacer()
                    Text(major).font(.footnote).bold().foregroundColor(Color.gray).lineLimit(1).frame(width: manager.screenWidth*0.3, height: manager.screenWidth*0.1)
                    Spacer()
                    Image(systemName: "checkmark").padding(2).foregroundColor(Color.green)
                    
                    
                }.frame(width: manager.screenWidth*0.3, height: manager.screenWidth*0.1).padding(EdgeInsets(top: 0, leading: manager.screenWidth*0.05, bottom: 0, trailing: manager.screenWidth*0.05))
            }.padding(1).background(RoundedRectangle(cornerRadius: 5).fill(.white).shadow(radius: 3)).padding(2)
        }
        
        else if result=="rejected"{
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
                    Text(school).font(.footnote).fixedSize(horizontal: false, vertical: true).frame(width: manager.screenWidth*0.3, height: manager.screenWidth*0.02, alignment: .center).padding(1).multilineTextAlignment(.center).lineLimit(2).foregroundColor(.black)
                    
                    
                    Spacer()
                    
                }.padding(2)
                Spacer().frame(height:manager.screenWidth*0.03)
                HStack{
                    Spacer()
                    Text(major).font(.footnote).bold().foregroundColor(Color.gray).lineLimit(1).frame(width: manager.screenWidth*0.3, height: manager.screenWidth*0.1)
                    Spacer()
                    Image(systemName: "xmark").padding(2).foregroundColor(Color.red)
                    
                    
                }.frame(width: manager.screenWidth*0.3, height: manager.screenWidth*0.1).padding(EdgeInsets(top: 0, leading: manager.screenWidth*0.05, bottom: 0, trailing: manager.screenWidth*0.05))
            }.padding(1).background(RoundedRectangle(cornerRadius: 5).fill(.white).shadow(radius: 3)).padding(2)
        }else{
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
                    Text(school).font(.footnote).fixedSize(horizontal: false, vertical: true).frame(width: manager.screenWidth*0.3, height: manager.screenWidth*0.02, alignment: .center).padding(1).multilineTextAlignment(.center).lineLimit(2).foregroundColor(.black)
                    
                    
                    Spacer()
                    
                }.padding(2)
                Spacer().frame(height:manager.screenWidth*0.03)
                HStack{
                    Spacer()
                    Text(major).font(.footnote).bold().foregroundColor(Color.gray).lineLimit(1).frame(width: manager.screenWidth*0.3, height: manager.screenWidth*0.1)
                    Spacer()
                    Image(systemName: "questionmark").padding(2).foregroundColor(Color.yellow)
                    
                    
                }.frame(width: manager.screenWidth*0.3, height: manager.screenWidth*0.1).padding(EdgeInsets(top: 0, leading: manager.screenWidth*0.05, bottom: 0, trailing: manager.screenWidth*0.05))
            }.padding(1).background(RoundedRectangle(cornerRadius: 5).fill(.white).shadow(radius: 3)).padding(2)
        }
        
            
        
    }
}

