//
//  BasicCard.swift
//  Me View
//
//  Created by Chris Yang on 5/12/22.
//

import SwiftUI

struct BasicCard: View {
    let userName : String
    //let personalProfile : String
    let viewNumber : Double
    let likeNumber : Double
//    let postNumber : Double
    @EnvironmentObject var manager : AppManager
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        
        ZStack {
            VStack{
                Spacer().frame(height: manager.screenHeight*0.03)
                Text(userName)
                    .foregroundColor(isDarkMode ? .white : .black)
                    .font(.title)
                    .bold()
                Spacer().frame(height: manager.screenHeight*0.01)
                    HStack{
                        
                        VStack{
                            Text("View")
                                .bold()
                                .foregroundColor(isDarkMode ? .white : .black)
                            Text(viewNumber.roundDouble())
                                .fontWeight(.ultraLight)
                                .foregroundColor(isDarkMode ? .white : .black)
                            
                        }
                        Spacer().frame(width: manager.screenWidth*0.3)

                        VStack{
                            Text("Like")
                                .bold()
                                .foregroundColor(isDarkMode ? .white : .black)
                            Text(likeNumber.roundDouble())
                                .fontWeight(.ultraLight)
                                .foregroundColor(isDarkMode ? .white : .black)
                            
                        }
                    }
                    
                Spacer().frame(height: manager.screenHeight*0.03)
            }.frame(width: manager.screenWidth*0.95, height: manager.screenHeight*0.15, alignment: .center)
                .background(isDarkMode ? .black : .white)
            .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(manager.LoginbuttonColor, lineWidth: 5)
                    )
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .gray, radius: 5)
            
            
            // Account image selected
            VStack {
                Button(action: {
                        manager.changeAcountImage = true
                        manager.openConfirmationDialog = true
                    }, label: {
                        if manager.changeAcountImage {
                            Image(uiImage: manager.imageSelected)
                                .resizable()
                                .clipShape(Circle())
                                .frame(width:manager.screenWidth*0.32, height: manager.screenHeight*0.32)
                                .overlay{
                                    Circle().stroke(.white, lineWidth:4)
                                }
                                .shadow(radius: 7)
                            
                        }else{
                            CircleImage()
                        }
                    })
                    .offset(y:-140)
                    .padding(.bottom, -40)
                    .confirmationDialog("Alubms/Camera", isPresented:$manager.openConfirmationDialog, titleVisibility: .visible){
                            Button(action: {
                                manager.source = .library
                                manager.showPicker = true
                            }, label: {
                                Text("Alubms")
                            })
                            Button(action: {
                                manager.source = .camera
                                manager.showPicker = true
                            }, label: {
                                Text("Camera")
                            })
                        }
            }
            .fullScreenCover(isPresented: $manager.showPicker, onDismiss: nil) {
                ImagePicker(selectedImage: $manager.imageSelected, sourceType: manager.source == .library ? .photoLibrary : .camera)
                            .ignoresSafeArea()
                    }
        }
    }
}

struct BasicCard_Previews: PreviewProvider {
    static var previews: some View {
//        BasicCard(userName: "Matthew1234", personalProfile: "None", viewNumber: 45, postNumber: 10)
        BasicCard(userName: "Matthew1234", viewNumber:  20, likeNumber: 10)
    }
}
