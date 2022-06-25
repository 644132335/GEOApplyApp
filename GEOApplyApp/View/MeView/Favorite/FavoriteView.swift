//
//  PostView.swift
//  Me View
//
//  Created by Chris Yang on 5/18/22.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var manager : AppManager
    var body: some View {
        VStack{
            ForEach(manager.followedUsers, id:\.self){i in
                NavigationLink(destination: ApplyDetail(name: i.name ?? "unnamed", school: i.school ?? "unnamed", nation: i.nation ?? "unnamed", major: i.major ?? "unnamed", sat: i.sat!, tofel: i.tofel!,gre:i.gre ?? 0.0, gpa: i.gpa!, intro: i.intro ?? "Lazy and did not write anything",view: i.view ?? 0,follow:i.follow ?? 0,applyinfo: i.applyinfo ?? [],uid: i.userid ?? "",avatarURL:i.avatarImageURL ?? manager.DefaultAvatarUrl,degree: i.degree ?? "Master",applyby: i.applyby ?? "")){
                    ApplyInfoCard(name: i.name ?? "unnamed", nation: i.nation ?? "unnamed", school: i.school ?? "unnamed", gpa: i.gpa!, sat: i.sat!, tofel: i.tofel!,gre:i.gre ?? 0.0,avatarURL:i.avatarImageURL ?? manager.DefaultAvatarUrl, degree:i.degree ?? "Master",schoolImage: manager.findSchoolImageURL(schoolname: i.school ?? "")).padding(3)
                }.padding(3)
            }
            Spacer().frame(height:manager.screenHeight*0.05)
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
