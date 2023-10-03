//
//  Note.swift
//  Notes Watch App
//
//  Created by Jimmy Ghelani on 2023-10-03.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
