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
                        //own info
                        NavigationLink(destination: ApplyDetail(name: "Matthew", school: "Havard University", nation: "China", major: "Computer Science", sat: 1600, tofel: 110, gpa: 3.9)){
                            ApplyInfoCard(name: "Matthew", nation: "United States", school: "Harvard University", gpa: 3.75, sat: 1550, tofel: 110).padding(3)
                        }.padding(3)
                        
                        //other info
                        ForEach(manager.users, id:\.self){i in
                            NavigationLink(destination: ApplyDetail(name: i.name ?? "unnamed", school: i.school ?? "unnamed", nation: i.nation ?? "unnamed", major: i.major ?? "unnamed", sat: i.sat!, tofel: i.tofel!, gpa: i.gpa!)){
                                ApplyInfoCard(name: i.name ?? "unnamed", nation: i.nation ?? "unnamed", school: i.school ?? "unnamed", gpa: i.gpa!, sat: i.sat!, tofel: i.tofel!).padding(3)
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
               
            }
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Explore")
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
