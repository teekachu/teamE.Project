//
//  CardDetailsView.swift
//  ARKitProject
//
//  Created by Milo Wyner on 1/16/21.
//

import SwiftUI

struct HStackView: View {
    var image: String
    var type: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
            Text(type)
        }
    }
}

struct CardDetailsView: View {
    let person: Person
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                VStack {
                    Text(person.name)
                        .font(.system(size: 80))
                        .bold()
                        .padding(40)
                }
                
                Spacer()
            }
            
            VStack {
                
                Rectangle()
                    .opacity(0.0)
                    .frame(height: 30)
            
            ZStack {
                HStack {
                    Image(person.imageName)
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 300, height: 300)
                        .padding(.leading, 100)
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        if person.detail.occupation == "Student" {
                            Text(person.detail.occupation)
                            
                            if let school = person.detail.school {
                                HStackView(image: "studentdesk", type: school)
                            }
                        } else {
                            HStack {
                                Text(person.detail.occupation)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            }
                            if let company = person.detail.company {
                                HStackView(image: "building.2", type: company)
                            }
                        }
                        HStackView(image: "iphone", type: person.detail.phoneNumber)
                        HStackView(image: "envelope", type: person.detail.email)
                    }
                    .font(.system(size: 22))
                    .foregroundColor(.white)
                    .frame(width: 450, alignment: .leading)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 25.0).opacity(0.4))
                    .padding(.trailing, 40)
                    //.padding(.trailing, 80)
                }
            }.foregroundColor(.black)
            
            if let website = URL(string: person.website) {
                HStack {
                    Spacer()
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.blue)
                        .frame(width: 480, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .overlay(
                            HStack {
                                Image(systemName: "link.circle.fill")
                                    .font(.largeTitle)
                                Link("Visit Website",
                                     destination: website)
                                    .font(.title)
                            }
                            .foregroundColor(.white)
                            .padding()
                    )
                        .padding(.trailing, 40)
                }
                
            }
                
                Rectangle()
                    .opacity(0.0)
                    .frame(height: 30)
                
            }
            
            
            Text("© cardAGAIN 2021")
                .font(.title)
                .foregroundColor(.white)
                .padding()

        }
        .background(LinearGradient(gradient: Gradient(colors: [.purple, .purple, .orange, .yellow, .white]), startPoint: .bottomLeading, endPoint: .topTrailing))
        .cornerRadius(30)

    }
    
    struct CardDetailsView_Previews: PreviewProvider {
        static var previews: some View {
            CardDetailsView(person: Person(name: "Adrian Eves", imageName: "star", website: "https://www.google.com", detail: Detail(occupation: "Software Engineer", company: "Apple", school: "Auburn", phoneNumber: "9999999", email: "test@test.com"))).previewLayout(.fixed(width: 1000, height: 1000))
        }
    }
}
