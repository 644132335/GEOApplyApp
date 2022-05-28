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

    var body: some View {
        VStack {
                VStack{
                        Spacer().frame(height:20)
                        Text("General Information")
                            .foregroundColor(Color.black)
                            .bold()
                            .font(.title2)
                        Spacer().frame(width:15)
                        
                        VStack{
                            HStack{
                                Text("Membership Left:")
                                Spacer()
                                Text(daysLeft)
                            }
                            Spacer().frame(height:11)
                            HStack{
                                Text("School:")
                                Spacer()
                                Text(schoolName)
                            }
                            Spacer().frame(height:11)
                            HStack{
                                Text("Country:")
                                Spacer()
                                Text(country)
                            }
                            Spacer().frame(height:11)
                            HStack{
                                Text("Major:")
                                Spacer()
                                Text(major)
                            }
                        }
                        .padding()
                }
                .frame(width: manager.screenWidth*0.95, height: manager.screenHeight*0.25, alignment: .center)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(color: .gray, radius: 5)     
        }
    }
}

struct InfoCard_Previews: PreviewProvider {
    static var previews: some View {
        InfoCard(daysLeft: "999 days left",schoolName: "Penn State", country: "China",major: "Computer Science")
    }
}

