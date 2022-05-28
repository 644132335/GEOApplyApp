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
    @EnvironmentObject var manager : AppManager
    
    
    var body: some View {
        
        ZStack {
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
            }.frame(width: manager.screenWidth*0.95, height: manager.screenHeight*0.2, alignment: .center)
            .background(Color.white)
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
        BasicCard(userName: "Matthew1234", likeNumber: 100, viewNumber: 45, postNumber: 10)
    }
}
