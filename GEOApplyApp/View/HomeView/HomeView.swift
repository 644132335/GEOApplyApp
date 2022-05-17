//
//  HomeView.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/4/28.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var manager : AppManager
    var body: some View {
        NavigationView{
            ZStack{
                ScrollView{
                    VStack{
                        NavigationLink(destination: ApplyDetail()){
                            ApplyInfoCard(name: "Matthew", nation: "United States", school: "Harvard University", gpa: 3.75, sat: 1550).padding(3)
                        }.padding(3)
                        ForEach(manager.users, id:\.self){i in
                            NavigationLink(destination: ApplyDetail()){
                                ApplyInfoCard(name: i.name ?? "unnamed", nation: i.nation ?? "unnamed", school: i.school ?? "unnamed", gpa: i.gpa!, sat: i.sat!).padding(3)
                            }.padding(3)
                        }
                            }
                }
                
                //floating action button for adding info
                VStack(){
                    Spacer()
                    HStack{
                        Spacer()
                        NavigationLink(destination: AddInfo()){
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 57, height: 57)
                                .foregroundColor(manager.themeColor)
                                .shadow(color: .gray, radius: 0.4, x: 1, y: 1)
                                .background(Circle().fill(Color.white).frame(width: 57, height: 57))
                        }.padding()
                        
                    }
                    
                    //Spacer().frame(height:10)
                }
               
            }.navigationTitle("Explore")
        }
            .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
