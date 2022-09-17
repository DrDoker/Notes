//
//  String + ext.swift
//  mvp_testApp
//
//  Created by User on 16.09.2022.
//

import Foundation

extension String {

    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }

    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    func capitalizeSecondLetter() -> String {
        return self.prefix(1).lowercased() + self[1].uppercased() + self.lowercased().dropFirst(2)
    }
}
