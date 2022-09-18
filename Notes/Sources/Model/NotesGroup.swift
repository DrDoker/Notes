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
    static let groups: [NotesGroup] = [
        NotesGroup(title: "iCloud", group: NotesFolder.firstFolder),
        NotesGroup(title: "Мои заметки", group: NotesFolder.secondGoupFolders),
        NotesGroup(title: "Учеба", group: NotesFolder.thirdGoupFolders)
    ]
}

