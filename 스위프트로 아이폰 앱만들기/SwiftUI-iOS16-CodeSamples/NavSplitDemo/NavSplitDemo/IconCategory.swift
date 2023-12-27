//
//  IconCategory.swift
//  NavSplitDemo
//
//  Created by Neil Smyth on 8/11/22.
//

import Foundation

struct IconCategory: Identifiable, Hashable {
    let id = UUID()
    var categoryName: String
    var images: [String]
}
