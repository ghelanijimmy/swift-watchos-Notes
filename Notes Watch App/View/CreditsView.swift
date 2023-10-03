//
//  CreditsView.swift
//  Notes Watch App
//
//  Created by Jimmy Ghelani on 2023-10-03.
//

import SwiftUI

struct CreditsView: View {
    // MARK: - PROPERTIES
    @State private var randomNumber: Int = Int.random(in: 1..<4)
    
    private var randomImage: String {
        return "developer-no\(randomNumber)"
    }
    var body: some View {
        VStack(spacing: 3, content: {
            // PROFILE IMAGE
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            
            // HEADER
            HeaderView(title: "Credits")
            // CONTENT
            Text("Jimmy Ghelani")
                .foregroundStyle(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .fontWeight(.light)
        }) //: VSTACK
    }
}

#Preview {
    CreditsView()
}
