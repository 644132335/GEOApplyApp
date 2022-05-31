//
//  ApplyDetail.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/4/28.
//

import SwiftUI

struct ApplyDetail: View {
    @EnvironmentObject var manager : AppManager
    var name:String
    var school:String
    var nation:String
    var major:String
    var sat:Double
    var tofel:Double
    var gpa:Double
    var intro:String
    var applyinfo:[schoolReslt]
    var body: some View {
        ZStack{
            
            ScrollView{
            VStack{
                HStack{
                    Spacer()
                    VStack{
                        Circle().frame(width: 60, height: 60).clipShape(Circle()).shadow(radius: 6).foregroundColor(.blue.opacity(0.4))
                        Text(name).foregroundColor(.black.opacity(0.8)).bold()
                        Text(school).foregroundColor(.black.opacity(0.4)).font(.footnote)
                    }
                    Spacer()
                }
                Divider()
                VStack{
                   IntroSec(text: intro)
                   BasicInfo(nationality: nation, school: school, major: major)
                   ApplyInfoSec(userinfo:applyinfo)
                   ScoreSec(sat: sat, tofel: tofel, gpa: gpa)
                   EssaySec()
                }
                
            }
            }
        }.toolbar(){
            ToolbarItem(placement: .navigationBarTrailing){
                
            }
        }
    }
}

