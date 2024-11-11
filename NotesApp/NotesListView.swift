//
//  NotesListView.swift
//  NotesApp
//
//  Created by adarsh shukla on 11/11/24.
//

import SwiftUI

struct NotesListView: View {
    @StateObject private var viewModel = NotesViewModel()
    @State private var isPresentingNewNote = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.notes) { note in
                    NavigationLink(destination: NoteDetailView(viewModel: viewModel, note: note)) {
                        Text(note.title)
                    }
                }
                .onDelete(perform: viewModel.deleteNote)
            }
            .navigationTitle("Notes")
            .navigationBarItems(trailing: Button(action: {
                isPresentingNewNote = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $isPresentingNewNote) {
                NewNoteView(viewModel: viewModel, isPresented: $isPresentingNewNote)
            }
        }
    }
}
