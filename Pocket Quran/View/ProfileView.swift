//
//  ProfileView.swift
//  Pocket Quran
//
//  Created by Imam Nurrahmat on 19/07/21.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .center) {
            Image("imam")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .shadow(radius: 10)
                .frame(width: 250, height: 250)
            Text("Imam Nurrahmat").padding()
            Text("nurrehmet@gmail.com")
        }.edgesIgnoringSafeArea(.top)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

