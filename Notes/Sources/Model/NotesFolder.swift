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

//    static let firstGoupFolders: [NotesFolder] = [
//        NotesFolder(title: "Все iCloud",
//                    folder: [Note(title: "", text: "Note text"),
//                             Note(title: "", text: "Note text"),
//                             Note(title: "", text: "Note text"),
//                             Note(title: "", text: "Note text"),
//                             Note(title: "", text: "Note text")
//                            ]),
//
//        NotesFolder(title: "Общие",
//                    folder: [Note(title: "", text: "Note text"),
//                             Note(title: "", text: "Note text"),
//                             Note(title: "", text: "Note text"),
//                             Note(title: "", text: "Note text"),
//                             Note(title: "", text: "Note text"),
//                             Note(title: "", text: "Note text")
//                            ]),
//
//        NotesFolder(title: "2021",
//                    folder: [Note(title: "", text: "Note text"),
//                             Note(title: "", text: "Note text"),
//                             Note(title: "", text: "Note text"),
//                             Note(title: "", text: "Note text"),
//                            ])
//    ]

    static var firstFolder: [NotesFolder] {
        var notes = [Note]()
        for i in NotesFolder.secondGoupFolders {
            notes.append(contentsOf: i.folder)
        }
        for y in NotesFolder.thirdGoupFolders {
            notes.append(contentsOf: y.folder)
        }
        return [NotesFolder(title: "Все iCloud",
                           folder: notes)]
    }

    static let secondGoupFolders: [NotesFolder] = [
        NotesFolder(title: "Личные",
                    folder: [Note(title: "Фильмы", text: "Посмотреть фильмы: \nМстители \nКрестный отец"),
                             Note(title: "Ссылка на плейлист", text: "https://www.youtube.com/watch?v=FNTDQ6FJUqg&list=PLmTuDg46zmKD6nI5Meg0_atl0qY-UgTtP"),
                             Note(title: "Продукты домой", text: "Молоко \nХлеб \nКолбаса \nОвощи"),
                             Note(title: "Список дел", text: "Погулять с собакой \nПротереть пыль \nПомыть посуду"),
                             Note(title: "Презентация Apple осень", text: "Покажут iPhone 14 и новые вотчи"),
                             Note(title: "Код от домофона", text: "#194BBB31#"),
                            ]),

        NotesFolder(title: "Работа",
                    folder: [Note(title: "Созвоны", text: "Созвон в пятницу в 14. Не забыть!"),
                             Note(title: "Отослать заказчику", text: "Нужно дописать ТЗ и отправить на согласование"),
                             Note(title: "В резюме добавить", text: "В резюме добавить блок про скиллы - добавить UIKit"),
                             Note(title: "Собесы", text: "Отправил резюме - сказали я пятницу дадут обратную связь, если что скинут тестовое задание")
                            ]),

        NotesFolder(title: "Путешествия",
                    folder: [Note(title: "Европа", text: "Стоимость билетов - 620€, отель 470€, еда 120€. Общее - 1210€"),
                             Note(title: "Отпуск", text: "Купить билеты до 23.11 \nОплатить отель, узнать про парковку")
                            ]),
    ]

    static let thirdGoupFolders: [NotesFolder] = [
        NotesFolder(title: "Swift",
                    folder: [Note(title: "Основы языка", text: "Все фундаментальные типы, которые есть в языке Swift — это так называемые типы-значения или по-другому value-type. Помимо типов-значения в языке есть еще ссылочные типы или reference type."),
                             Note(title: "UIKit", text: "UIKit появился очень давно и использовался в Objective-C языке, потому корни свои он берет оттуда. И всё наследование начинается от базового класса, «самого родительского» в Objective-C — NSObject."),
                             Note(title: "Основы навигации", text: "Основные техники навигации в приложении: через SceneDelegate и свойство .rootViewController у window, TabBarController, NavigationController, модальные окна")
                            ]),

        NotesFolder(title: "Домашки",
                    folder: [Note(title: "Доработки по ДЗ 11", text: "Файлы по папкам \nРасширения в один класс \nУбрать лишние пробелы"),
                             Note(title: "Доработки по ДЗ 12", text: "Если несколько раз понажимать плей или паузу, то таймер с анимацией рассинхзронизируются"),
                             Note(title: "Доработки по ДЗ 13", text: "Не очень хорошая практика в данной домашке использовать Assets для вообще всех иконок"),
                             Note(title: "Доработки по ДЗ 14", text: "Нужно немного подправить выравнивание (скриншот на сайте)")
                            ]),

        NotesFolder(title: "Для себя",
                    folder: [Note(title: "MVP", text: "MVP является первым паттерном, выявляющим проблему сборки, которая происходит из-за наличия трех действительно отдельных слоев."),
                             Note(title: "Git полезные команды", text: "git commit \ngit pull \ngit add")
                            ]),
    ]
}
