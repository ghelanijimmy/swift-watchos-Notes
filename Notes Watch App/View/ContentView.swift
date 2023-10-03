//
//  ContentView.swift
//  Notes Watch App
//
//  Created by Jimmy Ghelani on 2023-10-03.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @State private var notes: [Note] = [Note]()
    @State private var text: String = ""
    
    // MARK: - FUNCTION
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func save() {
        do {
            // 1. Convert notes array to data using JSONEncoder
            let data = try JSONEncoder().encode(notes)
            
            // 2. Create new URL to save the file using the getDocumentDirectory method
            let url = getDocumentDirectory().appending(path: "notes")
            
            // 3. Write data to given URL
            try data.write(to: url)
        } catch {
            print(error)
        }
    }
    
    func load() {
        DispatchQueue.main.async {
            do {
                // 1. Get notes URL path
                let url = getDocumentDirectory().appending(path: "notes")
                
                // 2. Create a new property for data
                let data = try Data(contentsOf: url)
                
                // 3. Decode data
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                print(error)
            }
        }
    }
    
    func delete(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            save()
        }
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .center, spacing: 6) {
                    TextField("Add New Note", text: $text)
                    Button(action: {
                        // 1. ONLY RUN WHEN TEXT FIELD IS NOT EMPTY
                        guard text.isEmpty == false else {
                            return
                        }
                        
                        // 2. CREATE NEW NOTE ITEM AND INITIALIZE IT WITH TEXT VALUE
                        let note = Note(id: UUID(), text: text)
                        
                        // 3. ADD NEW ITEM TO NOTES ARRAY
                        notes.append(note)
                        
                        // 4. MAKE TEXT FIELD EMPTY
                        text = ""
                        
                        // 5. SAVE NOTE
                        self.save()
                        
                    }, label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 42, weight: .semibold))
                    })
                    .fixedSize()
                    .buttonStyle(PlainButtonStyle())
                    .foregroundStyle(.accent)
                } //: HSTACK
                Spacer()
                if notes.count > 0 {
                    List {
                        ForEach(notes) {note in
                            HStack {
                                Capsule()
                                    .frame(width: 4)
                                    .foregroundStyle(.accent)
                                
                                Text(note.text)
                                    .lineLimit(1)
                                    .padding(.leading, 5)
                            } //: HSTACK
                        } //: LOOP
                        .onDelete(perform: { indexSet in
                            delete(offsets: indexSet)
                        })
                    }
                } else {
                    Spacer()
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.gray)
                        .opacity(0.25)
                        .padding(25)
                    Spacer()
                } //: LIST
            } //: VSTACK
            .navigationTitle("Notes")
            .onAppear(perform: {
                load()
            })
        } //: NAVIGATION STACK
    }
}

#Preview {
    ContentView()
}
