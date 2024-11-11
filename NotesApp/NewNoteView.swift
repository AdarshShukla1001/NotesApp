//
//  NewNoteView.swift
//  NotesApp
//
//  Created by adarsh shukla on 11/11/24.
//

import SwiftUI

struct NewNoteView: View {
    @ObservedObject var viewModel: NotesViewModel
    @Binding var isPresented: Bool
    @State private var title = ""
    @State private var content = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextEditor(text: $content)
                    .frame(height: 200)
            }
            .navigationTitle("New Note")
            .navigationBarItems(trailing: Button("Save") {
                viewModel.addNote(title: title, content: content)
                isPresented = false
            })
        }
    }
}
