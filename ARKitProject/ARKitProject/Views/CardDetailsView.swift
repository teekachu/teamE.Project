//
//  CardDetailsView.swift
//  ARKitProject
//
//  Created by Milo Wyner on 1/16/21.
//

import SwiftUI

struct CardDetailsView: View {
    var name = "Name"
    var phone_number = "(123) 456-7890"
    var email = "Email Address"
    var occupation = "Job"
    var school = "School"
    var company = "Company"
    var website = "www.apple.com"
    
    var body: some View {
        //        Side to Side Display
        VStack {
            HStack {
                Image("swift")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding()
                VStack(alignment: .leading) {
                    Text(name)
                    Text(phone_number)
                    Text(email)
                    if occupation == "Student" {
                        Text(occupation)
                        Text(school)
                    } else {
                        Text(occupation)
                        Text(company)
                    }
                }
            }
            HStack {
                Image(systemName: "link.circle.fill")
                    .font(.largeTitle)
                Link("Visit Apple",
                     destination: URL(string: website)!)
                    .font(.title)
            }.foregroundColor(.red)
        }
        
        //        Top to Bottom Display
        //        VStack {
        //            Text(name)
        //                .font(.system(size: 60))
        //                .bold()
        //            VStack {
        //                Text(phone_number)
        //                Text(email)
        //            }.font(.subheadline)
        //
        //            HStack {
        //                Image("swift")
        //                    .resizable()
        //                    .frame(width: 150, height: 150)
        //                    .padding()
        //
        //                VStack(alignment: .leading) {
        //                    if occupation == "Student" {
        //                        Text(occupation)
        //                        Text(school)
        //                    } else {
        //                        Text(occupation)
        //                        Text(company)
        //                    }
        //                }
        //            }
        //            HStack {
        //                Image(systemName: "link.circle.fill")
        //                    .font(.largeTitle)
        //                Link("Visit Apple",
        //                     destination: URL(string: website)!)
        //                    .font(.title)
        //            }.foregroundColor(.red)
        //        }
    }
    
    struct CardDetailsView_Previews: PreviewProvider {
        static var previews: some View {
            CardDetailsView()
        }
    }
}
