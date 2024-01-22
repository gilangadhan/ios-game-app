//
//  ProfileView.swift
//  ios-expert
//
//  Created by Magistra Apta on 22/01/24.
//

import SwiftUI


struct ProfileView: View {
    var body: some View {
        VStack{
            Text("Profile View")
                .font(.title)
                .bold()
            Image("profile")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .clipShape(Circle())
            
            VStack (spacing: 8){
                Text("Muhammad Magistra Apta Paramarta")
                Text("magistraagis@gmail.com")
            }
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProfileView()
        }
    }
}

