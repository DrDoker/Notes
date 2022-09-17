//
//  Model.swift
//  mvp_testApp
//
//  Created by User on 15.09.2022.
//

import Foundation

struct Note {
    var title: String
    var subtitle: String
}

extension Note {
    static let notes: [[Note]] = [
        // First section
        [Note(title: "Note 1", subtitle: "865"),
        Note(title: "Note 2", subtitle: "13"),
        Note(title: "Note 3", subtitle: "2"),
        Note(title: "Note 4", subtitle: "23"),
        Note(title: "Note 5", subtitle: "10")],
        // Second Section
        [Note(title: "Note 6", subtitle: "34"),
        Note(title: "Note 7", subtitle: "56"),
        Note(title: "Note 8", subtitle: "4"),
        Note(title: "Note 9", subtitle: "11"),
        Note(title: "Note 10", subtitle: "22")],
        // Third Section
        [Note(title: "Note 11", subtitle: "230"),
        Note(title: "Note 12", subtitle: "43"),
        Note(title: "Note 13", subtitle: "2"),
        Note(title: "Note 14", subtitle: "60"),
        Note(title: "Note 15", subtitle: "87")]
    ]
}
