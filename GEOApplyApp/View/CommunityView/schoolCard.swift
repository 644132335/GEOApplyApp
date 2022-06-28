//
//  schoolCard.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/6/27.
//

import SwiftUI
import SDWebImageSwiftUI

struct schoolCard: View {
    @EnvironmentObject var manager : AppManager
    var rank: Int
    var Imageurl: String
    var schoolname: String
    
    var body: some View {
        
        VStack(alignment: .center){
            HStack{
                //Spacer().frame(width: manager.screenWidth*0.05)
                ZStack{
                    Image(systemName:"bookmark.fill").resizable().frame(width: manager.screenWidth*0.12, height: manager.screenWidth*0.13).foregroundStyle(manager.LoginbuttonColor)
                    Text("#\(rank)").font(.system(size: manager.screenWidth*0.05,weight: .bold, design: .rounded)).foregroundColor(.black)
                }
                
                Spacer()
            }
            WebImage(url: URL(string: Imageurl))
                .resizable()
                .frame(width:manager.screenWidth*0.25, height: manager.screenWidth*0.25)
                .shadow(radius: 3).padding(manager.screenWidth*0.00)
                .padding()
            
            HStack(){
                Spacer()
                Text(schoolname).font(.system(size: manager.screenWidth*0.05,weight: .bold, design: .rounded)).multilineTextAlignment(.center).foregroundColor(.black)
                Spacer()
            }.padding(manager.screenWidth*0.03).background(Rectangle().foregroundStyle(manager.LoginbuttonColor)).cornerRadius(10,corners: [.bottomLeft,.bottomRight])
            
            
        }.background(RoundedRectangle(cornerRadius: 10).fill(.white).shadow(radius: 2))
            .frame(width: manager.screenWidth*0.84, height: manager.screenWidth*0.7, alignment: .center)
    }
}

struct schoolCard_Previews: PreviewProvider {
    static var previews: some View {
        schoolCard(rank: 1, Imageurl: "https://upload.wikimedia.org/wikipedia/zh/thumb/7/71/Princeton_shield.svg/330px-Princeton_shield.svg.png", schoolname: "Pennsylvania State University—University Park").environmentObject(AppManager())
        
        
    }
}
