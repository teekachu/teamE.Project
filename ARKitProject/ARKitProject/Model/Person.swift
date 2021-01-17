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
    var imageName: String
    var website: String
    var detail: Detail
}

struct Detail: Codable {
    var occupation: String
    var company: String?
    var school: String?
    var phoneNumber: String
    var email: String

}


