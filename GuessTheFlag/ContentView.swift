//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Remitbee on 04/10/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LinearGradient(
            stops: [
                .init(color: .white, location: 0.45),
                .init(color: .black, location: 0.55),
            ],
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
        
        RadialGradient(colors: [Color.blue, Color.green], center: .center, startRadius: 20, endRadius: 200)
        AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)

        Text("Your content")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundStyle(.white)
            .background(.red.gradient)
        
        
    }
}

#Preview {
    ContentView()
}
