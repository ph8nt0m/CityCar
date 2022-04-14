//
//  LaunchScreen.swift
//  CityCar
//
//  Created by 이동준 on 2022/04/13.
//

import Foundation
import SwiftUI

extension ContentView {
    
    var launchScreenView: some View {
        
        ZStack(alignment: .center) {
            LinearGradient(gradient: Gradient(colors: [Color("PrimaryColor"), Color("SubPrimaryColor")]),
                           startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            VStack() {
                Image("textLogo")
                Text("내 앞까지 찾아오는 렌트카")
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .padding(.top, 5.0)
                
            }.padding(.bottom, 250.0)
        }.zIndex(100)
    }
}

struct LaunchScreen: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
