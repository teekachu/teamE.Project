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
    var website = "https://www.apple.com"
    
    var body: some View {
        VStack(spacing: 0) {
            Text(name)
                .font(.system(size: 70))
                .bold()
                .foregroundColor(.black)
                .frame(height: 100, alignment: .bottom)
            
            ZStack {
                HStack {
                    Image(imageName)
                        .resizable()
                        .clipShape(Circle())
                        .padding()
                        .frame(width: 200, height: 200, alignment: .center)
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: 480, height: 480)
                    
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
                    }
                    .font(.system(size: 22))
                    .frame(width: 200)
                }
            }.foregroundColor(.black)
            
            HStack {
                Image(systemName: "link.circle.fill")
                    .font(.largeTitle)
                Link("Visit Apple",
                     destination: URL(string: website)!)
                    .font(.title)
            }
            .foregroundColor(.red)
            .padding()
            .frame(height: 100, alignment: .top)

        }
    }
    
    struct CardDetailsView_Previews: PreviewProvider {
        static var previews: some View {
            CardDetailsView().previewLayout(.fixed(width: 1000, height: 1000))
        }
    }
}
