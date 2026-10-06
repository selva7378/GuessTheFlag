//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Remitbee on 04/10/26.
//

import SwiftUI

struct ContentView: View {
        @State private var showingAlert = false
        
        var body: some View {
            Button ("Show Alert") {
                print(showingAlert)
                showingAlert = true
            }
            .alert("Important message", isPresented: $showingAlert) {
                Button("Delete", role: .destructive) {
                    
                }
                Button("Cancel", role: .cancel) {
                    
                }
            } message: {
                Text("Please read this.")
            }
        }
    
}

#Preview {
    ContentView()
}
