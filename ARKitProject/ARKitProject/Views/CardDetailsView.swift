//
//  CardDetailsView.swift
//  ARKitProject
//
//  Created by Milo Wyner on 1/16/21.
//

import SwiftUI

struct CardDetailsView: View {
    var imageName = "swift"
    var name = "Name"
    var phoneNumber = "(123) 456-7890"
    var email = "Email Address"
    var occupation = "Student"
    var school = "School"
    var company = "Company"
    var website = "www.apple.com"
    
    var body: some View {
        VStack(alignment: .center) {
            Text(name)
                .font(.system(size: 70))
                .bold()
                .foregroundColor(.black)
            
            
            ZStack {
                HStack {
                    Image(imageName)
                        .resizable()
                        .frame(width: 150, height: 150, alignment: .center)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .padding()
                    
                    Image(imageName)
                        .resizable()
                        .frame(width: 350, height: 350, alignment: .center)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .padding()
                    
                    VStack(alignment: .leading) {
                        if occupation == "Student" {
                            Text(occupation)
                            
                            HStack {
                                Image(systemName: "studentdesk")
                                Text(school)
                            }
                        } else {
                            HStack {
                                Text(occupation)
                            }
                            HStack {
                                Image(systemName: "building.2")
                                Text(company)
                            }
                        }
                        
                        HStack {
                            Image(systemName: "iphone")
                            Text(phoneNumber)
                        }
                        HStack {
                            Image(systemName: "envelope")
                            Text(email)
                        }
                    }.font(.system(size: 22))
                }
            }.foregroundColor(.black)
            
            HStack {
                Image(systemName: "link.circle.fill")
                    .font(.largeTitle)
                Link("Visit Apple",
                     destination: URL(string: website)!)
                    .font(.title)
            }.foregroundColor(.red)
        }
    }
    
    struct CardDetailsView_Previews: PreviewProvider {
        static var previews: some View {
            CardDetailsView().previewLayout(.fixed(width: 1500, height: 900))
        }
    }
}
