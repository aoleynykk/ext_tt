//
//  Movie.swift
//  ext_tt
//
//  Created by Олександр Олійник on 01.09.2022.
//

import Foundation

struct Movie: Hashable, Comparable {
    static func < (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.id < rhs.id
    }

    var id: Int
    var title: String
    var year: Int
}
