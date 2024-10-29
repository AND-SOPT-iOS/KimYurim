//
//  Photo.swift
//  35-seminar
//
//  Created by 김유림 on 10/26/24.
//

import UIKit

struct Week3Photo {
    let image: UIImage?
    let isLiked: Bool
}

extension Week3Photo {
    static let samplePhotos: [Week3Photo] =
    [Week3Photo(image: UIImage(systemName: "soccerball"), isLiked: true),
     Week3Photo(image: UIImage(systemName: "camera"), isLiked: true),
     Week3Photo(image: UIImage(systemName: "music.note"), isLiked: true),
     Week3Photo(image: UIImage(systemName: "gamecontroller"), isLiked: true),
     Week3Photo(image: UIImage(systemName: "book"), isLiked: true),
     Week3Photo(image: UIImage(systemName: "bubble.left.and.bubble.right"), isLiked: true),
     Week3Photo(image: UIImage(systemName: "film"), isLiked: true),
     Week3Photo(image: UIImage(systemName: "cart"), isLiked: true),
     Week3Photo(image: UIImage(systemName: "creditcard"), isLiked: true),
     Week3Photo(image: UIImage(systemName: "heart.text.square"), isLiked: false)
    ]
}
