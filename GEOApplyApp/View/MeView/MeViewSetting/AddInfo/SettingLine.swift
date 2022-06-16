//
//  SettingLine.swift
//  GEOApplyApp
//
//  Created by Chris Yang on 6/3/22.
//

import SwiftUI



struct SettingLine: View {
    @EnvironmentObject var manager : AppManager
    @AppStorage("isDarkMode") private var isDarkMode = false
    var imageName : String
    var color : Color
    var title : String
    var option : String
    var body: some View {
        HStack{
            Spacer().frame(width: manager.screenWidth*0.011)
            Image(systemName: imageName)
              //  .font(.headline)
                .foregroundColor(color)
            //    .padding(.horizontal, 4)
            Spacer().frame(width: manager.screenHeight*0.015)
            Text(title)
                .foregroundColor(isDarkMode ? .white : .black)
               // .padding(.leading, 10)
            
            Spacer()
            
            Text(option)
                .font(.headline)
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
            
        }
    }
}

struct SettingLine_Previews: PreviewProvider {
    static var previews: some View {
        SettingLine(imageName: "sparks", color: .blue, title: "age", option: "男")
    }
}
