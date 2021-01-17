//
//  Student.swift
//  ARKitProject
//
//  Created by Ting Becker on 1/16/21.
//

import Foundation
import UIKit

struct Student: Codable {
    var title: String
    var image: String
    var detail: detail
}

struct detail: Codable {
    var schoolName: String
    var number: String
    var emailAddress: String
}
