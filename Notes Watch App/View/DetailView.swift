//
//  DetailView.swift
//  Notes Watch App
//
//  Created by Jimmy Ghelani on 2023-10-03.
//

import SwiftUI

struct DetailView: View {
    // MARK: - PROPERTIES
    let note: Note
    let count: Int
    let index: Int
    
    @State private var isCreditsPresented: Bool = false
    @State private var isSettingsPresented: Bool = false
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 3, content: {
            // HEADER
            HeaderView(title: "")
            
            // CONTENT
            Spacer()
            
            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                
            }
            
            Spacer()
            
            // FOOTER
            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture(perform: {
                        isSettingsPresented.toggle()
                    })
                    .sheet(isPresented: $isSettingsPresented, content: {
                        SettingsView()
                    })
                
                Spacer()
                
                Text("\(index + 1) / \(count)")
                
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture(perform: {
                        isCreditsPresented.toggle()
                    })
                    .sheet(isPresented: $isCreditsPresented, content: {
                        CreditsView()
                    })
            } //: HSTACK
            .foregroundStyle(.secondary)
            
        }) //: VSTACK
        .padding(3)
    }
}

#Preview {
    let sampleData: Note = Note(id: UUID(), text: "Hello World")
    return DetailView(note: sampleData, count: 5, index: 1)
}
