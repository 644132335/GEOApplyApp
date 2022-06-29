//
//  SchoolDetail.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/6/28.
//

import SwiftUI
import SDWebImageSwiftUI

struct SchoolDetail: View {
    @EnvironmentObject var manager : AppManager
    var schoolname:String
    var schoolimage:String
    var rank:Int
    var intro:String
    
    var body: some View {
            ScrollView(showsIndicators: false){
                VStack{
                    // top school info
                    VStack{
                        ZStack{
                            //school image
                            HStack{
                                Spacer()
                                WebImage(url: URL(string: schoolimage))
                                    .resizable()
                                    .frame(width:manager.screenWidth*0.3, height: manager.screenWidth*0.3)
                                    .padding().opacity(0.5)
                            }
                            //school infos
                            VStack{
                                HStack{
                                    Text(schoolname).font(.system(size: manager.screenWidth*0.055,weight: .bold, design: .rounded)).multilineTextAlignment(.leading)
                                    Spacer()
                                }.padding(EdgeInsets(top: manager.screenWidth*0.05, leading: manager.screenWidth*0.05, bottom: manager.screenWidth*0.03, trailing: 0))
                                HStack{
                                    Text("US News Ranked: #\(rank)").font(.system(size: manager.screenWidth*0.04,weight: .bold, design: .rounded)).multilineTextAlignment(.leading)
                                    Spacer()
                                }.padding(EdgeInsets(top: manager.screenWidth*0.01, leading: manager.screenWidth*0.05, bottom: 0, trailing: 0))
                                
                                HStack{
                                    Text("10 People Collected").font(.footnote).multilineTextAlignment(.leading)
                                    Spacer()
                                }.padding(EdgeInsets(top: 0, leading: manager.screenWidth*0.05, bottom: 0, trailing: 0))
                                
                                //follow button
                                HStack{
                                    Button(action: {
                                        
                                    }, label: {
                                        HStack{
                                            Text("Collected").bold()
                                            Image(systemName: "checkmark")
                                        }.padding(manager.screenWidth*0.01).background(RoundedRectangle(cornerRadius: 5).fill(Color.gray.opacity(0.2))).foregroundColor(.black.opacity(0.8))
                                        
                                    })
                                    Spacer()
                                }.padding(EdgeInsets(top: 0, leading: manager.screenWidth*0.05, bottom: manager.screenWidth*0.01, trailing: 0))
                                Spacer().frame(height:manager.screenWidth*0.1)
                            }
                        }
                        
                    }.background(Rectangle().foregroundStyle(manager.LoginbuttonColor).cornerRadius(15,corners: [.bottomRight,.bottomLeft]))
                    
                    //bottom infos
                    VStack{
                        HStack{
                            Text("School Information").font(.system(size: manager.screenWidth*0.05,weight: .bold, design: .rounded)).multilineTextAlignment(.leading).opacity(0.7)
                            Spacer()
                        }.padding(EdgeInsets(top: manager.screenWidth*0.05, leading: manager.screenWidth*0.05, bottom: manager.screenWidth*0.02, trailing: 0))
                        HStack{
                            HStack{
                                Text(intro).font(.system(size: manager.screenWidth*0.04,weight: .light, design: .rounded)).multilineTextAlignment(.leading).opacity(0.7).lineLimit(5).multilineTextAlignment(.leading)
                                Spacer()
                            }.padding(EdgeInsets(top: 0, leading: manager.screenWidth*0.05, bottom: manager.screenWidth*0.05, trailing: 0))
                        }
                        
                        //applied profiles
                        HStack{
                            Text("Applied Profiles").font(.system(size: manager.screenWidth*0.05,weight: .bold, design: .rounded)).multilineTextAlignment(.leading).opacity(0.7)
                            Spacer()
                        }.padding(EdgeInsets(top: manager.screenWidth*0.01, leading: manager.screenWidth*0.05, bottom: manager.screenWidth*0.02, trailing: 0))
                        
                        //school applied users
                        schoolApplyUsersView().onAppear{
                            manager.getSchoolUsers(schoolname: schoolname)
                        }
                        Spacer().frame(height:manager.screenHeight*0.05)
                    }.frame(width: manager.screenWidth*0.95).background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(radius: 5))
                        
                        
                    
                    
                }
                
            }.navigationTitle("School Detail").navigationBarTitleDisplayMode(.inline)
        }
    
}

struct SchoolDetail_Previews: PreviewProvider {
    static var previews: some View {
        SchoolDetail(schoolname: "Pennsylvania State University-University Park ", schoolimage: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/University_of_Virginia_seal.svg/300px-University_of_Virginia_seal.svg.png", rank: 77, intro: "The University of Virginia (U.Va. or UVA) is a public research university in Charlottesville, Virginia, founded in 1819 by Thomas Jefferson. It is the flagship university of Virginia and home to the Academical Village, a UNESCO World Heritage Site.[9][10] UVA is considered a Public Ivy, or a public institution which offers an academic experience similar to that of an Ivy League university.").environmentObject(AppManager())
    }
}
