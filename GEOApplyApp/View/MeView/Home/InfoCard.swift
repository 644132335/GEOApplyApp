//
//  InfoCard.swift
//  Me View
//
//  Created by Chris Yang on 5/12/22.
//

import SwiftUI
import Foundation
struct InfoCard: View {
    let daysLeft : String
    let schoolName : String
    let country : String
    let major : String
    
    @EnvironmentObject var manager : AppManager
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some View {
        VStack {
                VStack{
                        Spacer().frame(height:20)
                        Text("General Information")
                            .foregroundColor(isDarkMode ? .white : .black)
                            .bold()
                            .font(.title2)
                        Spacer().frame(width:15)
                        
                        VStack{
                            HStack{
                                Text("Membership Left:")
                                    .foregroundColor(isDarkMode ? .white : .black)
                                Spacer()
                                Text(daysLeft)
                                    .foregroundColor(isDarkMode ? .white : .black)
                            }
                            Spacer().frame(height:11)
                            HStack{
                                Text("School:")
                                    .foregroundColor(isDarkMode ? .white : .black)
                                Spacer()
                                Text(schoolName)
                                    .foregroundColor(isDarkMode ? .white : .black)
                            }
                            Spacer().frame(height:11)
                            HStack{
                                Text("Country:")
                                    .foregroundColor(isDarkMode ? .white : .black)
                                Spacer()
                                Text(country)
                                    .foregroundColor(isDarkMode ? .white : .black)
                            }
                            Spacer().frame(height:11)
                            HStack{
                                Text("Major:")
                                    .foregroundColor(isDarkMode ? .white : .black)
                                Spacer()
                                Text(major)
                                    .foregroundColor(isDarkMode ? .white : .black)
                            }
                        }
                        .padding()
                }
                .frame(width: manager.screenWidth*0.95, height: manager.screenHeight*0.25, alignment: .center)
                .background(isDarkMode ? .black : .white)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(color: .gray, radius: 5)
                .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(manager.LoginbuttonColor, lineWidth: 2)
                        )
        }
    }
}

struct InfoCard_Previews: PreviewProvider {
    static var previews: some View {
        InfoCard(daysLeft: "999 days left",schoolName: "Penn State", country: "China",major: "Computer Science")
    }
}

