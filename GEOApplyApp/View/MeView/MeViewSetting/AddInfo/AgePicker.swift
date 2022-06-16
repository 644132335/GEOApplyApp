//
//  AgePicker.swift
//  GEOApplyApp
//
//  Created by Chris Yang on 6/3/22.
//

import SwiftUI

struct AgePicker: View {
    @EnvironmentObject var manager : AppManager
    @State private var age = 1

    var body: some View {
        Spacer().frame(height: manager.screenHeight*0.05)
        Text("Age : \(age)")
            .font(.title)
            .frame(width: manager.screenWidth*0.95, height: manager.screenHeight*0.05, alignment: .center)
            .background(manager.LoginbuttonColor)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .gray, radius: 5)
        Spacer()
        Picker("年龄", selection: $age){
            ForEach(1...100, id: \.self){
                Text("\($0)")
            }
        }.pickerStyle(WheelPickerStyle())
         .padding()
    }
}

struct AgePicker_Previews: PreviewProvider {
    static var previews: some View {
        AgePicker()
    }
}
