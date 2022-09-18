//
//  Model.swift
//  mvp_testApp
//
//  Created by User on 15.09.2022.
//

import Foundation

struct NotesGroup {
    var title: String
    var group: [NotesFolder]
}

extension NotesGroup {
    static let goups: [NotesGroup] = [
        NotesGroup(title: "iCloud", group: NotesFolder.firstGoupFolders),
        NotesGroup(title: "Private notes", group: NotesFolder.secondGoupFolders),
        NotesGroup(title: "Other notes", group: NotesFolder.thirdGoupFolders)
    ]
}

