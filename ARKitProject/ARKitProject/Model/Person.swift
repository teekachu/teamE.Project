//
//  Student.swift
//  ARKitProject
//
//  Created by Ting Becker on 1/16/21.
//

import Foundation
import UIKit

struct Person: Codable {
    var name: String
    var image: String
    var detail: detail
}

struct detail: Codable {
    var occupation: String
    var phoneNumber: String
    var emailAddress: String
}
