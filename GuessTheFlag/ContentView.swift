//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Remitbee on 04/10/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Button 1") { }
                .buttonStyle(.bordered)
//                .tint(.mint)

            Button("Button 2", role: .destructive) { }
                .buttonStyle(.bordered)
            Button("Button 3") { }
                .buttonStyle(.borderedProminent)
                .tint(.mint)
            Button("Button 4", role: .destructive) { }
                .buttonStyle(.borderedProminent)
            Button {
                print("Button was tapped")
            } label: {
                Text("Tap me!")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
            }
            
            Button {
                print("Edit button was tapped")
            } label : {
                Image(systemName: "pencil")
            }
            Button("Edit", systemImage: "pencil") {
                print("Edit button was tapped")
            }
            Button {
                print("Edit button was tapped")
            } label: {
                Label("Edit", systemImage: "pencil")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
            }
        }
    }
    
    func executeDelete() {
        print("Now deleting…")
    }
}


#Preview {
    ContentView()
}
