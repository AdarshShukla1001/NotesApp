//
//  NotesDetailView.swift
//  NotesApp
//
//  Created by adarsh shukla on 11/11/24.
//

import SwiftUI

struct NoteDetailView: View {
    @ObservedObject var viewModel: NotesViewModel
    var note: Note
    @State private var title: String
    @State private var content: String
    
    init(viewModel: NotesViewModel, note: Note) {
        self.viewModel = viewModel
        self.note = note
        _title = State(initialValue: note.title)
        _content = State(initialValue: note.content)
    }
    
    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextEditor(text: $content)
                .frame(height: 200)
        }
        .navigationTitle("Edit Note")
        .navigationBarItems(trailing: Button("Save") {
            viewModel.updateNote(note: note, title: title, content: content)
        })
    }
}
