//
//  CardDetailsView.swift
//  ARKitProject
//
//  Created by Milo Wyner on 1/16/21.
//

import SwiftUI

struct CardDetailsView: View {
    let person: Person
//    var imageName = "swift"
//    var name = "Name"
//    var phoneNumber = "(123) 456-7890"
//    var email = "Email Address"
//    var occupation = "Job Title"
//    var school = "School"
//    var company = "Company"
//    var website = "https://www.apple.com"
    
    var body: some View {
        VStack(spacing: 0) {
            LinearGradient(gradient: Gradient(colors: [.purple, .purple, .orange, .init(red: 141/255, green: 168/255, blue: 62/255)]), startPoint: .bottomLeading, endPoint: .topTrailing)
                .mask(
                    Text(person.name)
                        .font(.custom("HoeflerText-BlackItalic", size: 70))
                        .bold()
                        .foregroundColor(.black)
                )
                .frame(height: 100, alignment: .bottom)


            Text(person.name)
                .font(.custom("BodoniOrnamentsITCTT", size: 20))
            
            ZStack {
                HStack {
                    Image(person.imageName)
                        .resizable()
                        .clipShape(Circle())
                        .padding()
                        .frame(width: 200, height: 200)
                        .frame(width: 350, alignment: .trailing)
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: 480, height: 480)
                    
                    VStack(alignment: .leading) {
                        if person.detail.occupation == "Student" {
                            Text(person.detail.occupation)
                            
                            if let school = person.detail.school {
                                HStack {
                                    Image(systemName: "studentdesk")
                                    Text(school)
                                }
                            }
                        } else {
                            HStack {
                                Text(person.detail.occupation)
                            }
                            if let company = person.detail.company {
                                HStack {
                                    Image(systemName: "building.2")
                                    Text(company)
                                }
                            }
                        }
                        
                        HStack {
                            Image(systemName: "iphone")
                            Text(person.detail.phoneNumber)
                        }
                        HStack {
                            Image(systemName: "envelope")
                            Text(person.detail.email)
                        }
                    }
                    .font(.system(size: 22))
                    .frame(width: 350, alignment: .leading)
                }
            }.foregroundColor(.black)
            
            if let website = URL(string: person.website) {
                HStack {
                    Image(systemName: "link.circle.fill")
                        .font(.largeTitle)
                    Link("Visit Website",
                         destination: website)
                        .font(.title)
                }
                .foregroundColor(.white)
                .padding()
                .frame(height: 100, alignment: .top)
            }
            
            
            Text("© cardAgain 2021")
                .font(.title)
                .foregroundColor(.white)

        }
//        .background(LinearGradient(gradient: Gradient(colors: [.purple, .purple, .orange, .init(red: 141/255, green: 168/255, blue: 62/255), .yellow, .white]), startPoint: .bottomLeading, endPoint: .topTrailing))
//        .cornerRadius(30)

    }
    
//    struct CardDetailsView_Previews: PreviewProvider {
//        static var previews: some View {
//            CardDetailsView().previewLayout(.fixed(width: 1000, height: 1000))
//        }
//    }
}
