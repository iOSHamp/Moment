//
//  File.swift
//  
//
//  Created by Herry on 2023/03/27.
//

import SwiftUI

// MARK: Photo Data

struct Photo: Identifiable {
    var id = UUID().uuidString
    var photoTitle: String
    var asssetName: String
}

var photos: [Photo] = [
    Photo(photoTitle: "", asssetName: "mainCard1"),
    Photo(photoTitle: "", asssetName: "mainCard2"),
    Photo(photoTitle: "", asssetName: "mainCard3"),
    Photo(photoTitle: "", asssetName: "mainCard4"),
    Photo(photoTitle: "", asssetName: "mainCard5"),
    Photo(photoTitle: "", asssetName: "mainCard6"),
    Photo(photoTitle: "", asssetName: "mainCard7"),
    Photo(photoTitle: "", asssetName: "mainCard8")
]


// MARK: Dummy Text
var sampleText = ""
