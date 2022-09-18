//
//  NotesFolder.swift
//  Notes
//
//  Created by Serhii  on 18/09/2022.
//

import Foundation

struct NotesFolder {
    var title: String
    var folder: [Note]

    var countNotes: Int {
        return folder.count
    }
}

extension NotesFolder {
    static let firstGoupFolders: [NotesFolder] = [
        NotesFolder(title: "Folder 1",
                    folder: [Note(title: "Folder 1 Note 1", subtitle: "Subtitle Note 1", text: "Note text"),
                             Note(title: "Folder 1 Note 2", subtitle: "Subtitle Note 2", text: "Note text"),
                             Note(title: "Folder 1 Note 3", subtitle: "Subtitle Note 3", text: "Note text"),
                             Note(title: "Folder 1 Note 4", subtitle: "Subtitle Note 4", text: "Note text"),
                             Note(title: "Folder 1 Note 5", subtitle: "Subtitle Note 5", text: "Note text")
                            ]),

        NotesFolder(title: "Folder 2",
                    folder: [Note(title: "Folder 2 Note 1", subtitle: "Subtitle Note 1", text: "Note text"),
                             Note(title: "Folder 2 Note 2", subtitle: "Subtitle Note 2", text: "Note text"),
                             Note(title: "Folder 2 Note 3", subtitle: "Subtitle Note 3", text: "Note text"),
                             Note(title: "Folder 2 Note 4", subtitle: "Subtitle Note 4", text: "Note text"),
                             Note(title: "Folder 2 Note 5", subtitle: "Subtitle Note 5", text: "Note text"),
                             Note(title: "Folder 2 Note 6", subtitle: "Subtitle Note 6", text: "Note text")
                            ]),

        NotesFolder(title: "Folder 3",
                    folder: [Note(title: "Folder 3 Note 1", subtitle: "Subtitle Note 1", text: "Note text"),
                             Note(title: "Folder 3 Note 2", subtitle: "Subtitle Note 2", text: "Note text"),
                             Note(title: "Folder 3 Note 3", subtitle: "Subtitle Note 3", text: "Note text"),
                             Note(title: "Folder 3 Note 4", subtitle: "Subtitle Note 4", text: "Note text"),
                            ])
    ]

    static let secondGoupFolders: [NotesFolder] = [
        NotesFolder(title: "Folder 1",
                    folder: [Note(title: "Folder 1 Note 1", subtitle: "Subtitle Note 1", text: "Note text"),
                             Note(title: "Folder 1 Note 2", subtitle: "Subtitle Note 2", text: "Note text"),
                             Note(title: "Folder 1 Note 3", subtitle: "Subtitle Note 3", text: "Note text"),
                             Note(title: "Folder 1 Note 4", subtitle: "Subtitle Note 4", text: "Note text"),
                             Note(title: "Folder 1 Note 5", subtitle: "Subtitle Note 5", text: "Note text"),
                             Note(title: "Folder 1 Note 6", subtitle: "Subtitle Note 6", text: "Note text"),
                             Note(title: "Folder 1 Note 7", subtitle: "Subtitle Note 7", text: "Note text"),
                             Note(title: "Folder 1 Note 8", subtitle: "Subtitle Note 8", text: "Note text"),
                             Note(title: "Folder 1 Note 9", subtitle: "Subtitle Note 9", text: "Note text")
                            ]),

        NotesFolder(title: "Folder 2",
                    folder: [Note(title: "Folder 2 Note 1", subtitle: "Subtitle Note 1", text: "Note text"),
                             Note(title: "Folder 2 Note 2", subtitle: "Subtitle Note 2", text: "Note text"),
                             Note(title: "Folder 2 Note 3", subtitle: "Subtitle Note 3", text: "Note text"),
                             Note(title: "Folder 2 Note 4", subtitle: "Subtitle Note 4", text: "Note text")
                            ]),

        NotesFolder(title: "Folder 3",
                    folder: [Note(title: "Folder 3 Note 1", subtitle: "Subtitle Note 1", text: "Note text"),
                             Note(title: "Folder 3 Note 2", subtitle: "Subtitle Note 2", text: "Note text")
                            ]),
    ]

    static let thirdGoupFolders: [NotesFolder] = [
        NotesFolder(title: "Folder 1",
                    folder: [Note(title: "Folder 1 Note 1", subtitle: "Subtitle Note 1", text: "Note text"),
                             Note(title: "Folder 1 Note 2", subtitle: "Subtitle Note 2", text: "Note text"),
                             Note(title: "Folder 1 Note 3", subtitle: "Subtitle Note 3", text: "Note text")
                            ]),

        NotesFolder(title: "Folder 2",
                    folder: [Note(title: "Folder 2 Note 1", subtitle: "Subtitle Note 1", text: "Note text"),
                             Note(title: "Folder 2 Note 2", subtitle: "Subtitle Note 2", text: "Note text"),
                             Note(title: "Folder 2 Note 3", subtitle: "Subtitle Note 3", text: "Note text"),
                             Note(title: "Folder 2 Note 4", subtitle: "Subtitle Note 4", text: "Note text")
                            ]),

        NotesFolder(title: "Folder 3",
                    folder: [Note(title: "Folder 3 Note 1", subtitle: "Subtitle Note 1", text: "Note text"),
                             Note(title: "Folder 3 Note 2", subtitle: "Subtitle Note 2", text: "Note text")
                            ]),
    ]
}
