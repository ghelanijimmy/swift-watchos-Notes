//
//  HeaderView.swift
//  Notes Watch App
//
//  Created by Jimmy Ghelani on 2023-10-03.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - PROPERTIES
    var title: String = ""
    // MARK: - BODY
    var body: some View {
        VStack {
            // TITLE
            if title != "" {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.accent)
            }
            
            //SEPARATOR
            HStack {
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            } //: HSTACK
            .foregroundStyle(.accent)
        } //: VSTACK
    }
}

#Preview {
    HeaderView()
}

#Preview("With Title") {
    HeaderView(title: "Credits")
}
