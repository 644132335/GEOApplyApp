//
//  BasicCard.swift
//  Me View
//
//  Created by Chris Yang on 5/12/22.
//

import SwiftUI

struct BasicCard: View {
    let userName : String
    let likeNumber : Double
    let viewNumber : Double
    let postNumber : Double
    var body: some View {
        
        ZStack {
            CircleImage()
                .offset(y:-130)
                .padding(.bottom, -40)
            VStack{
                Text(userName)
                    .font(.title)
                    .bold()
                Spacer().frame(height: 5)
                HStack{
                    VStack{
                        Text(likeNumber.roundDouble()).fontWeight(.light)
                        Text("LIKE").bold()
                    }.padding()
                    VStack{
                        Text(viewNumber.roundDouble()).fontWeight(.light)
                        Text("VIEW").bold()
                    }.padding()
                    VStack{
                        Text(postNumber.roundDouble()).fontWeight(.light)
                        Text("POST").bold()
                    }.padding()
                }
            }.frame(width: 400, height: 150, alignment: .center)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .gray, radius: 5)
        }
    }
}

struct BasicCard_Previews: PreviewProvider {
    static var previews: some View {
        BasicCard(userName: "Matthew1234", likeNumber: 100, viewNumber: 45, postNumber: 10)
    }
}
