//
//  DataModel.swift
//  NotesApp
//
//  Created by adarsh shukla on 11/11/24.
//

import Foundation

struct Note: Identifiable, Codable {
    var id = UUID()
    var title: String
    var content: String
}
