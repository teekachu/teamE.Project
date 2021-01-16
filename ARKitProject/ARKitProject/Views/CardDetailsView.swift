//
//  CardDetailsView.swift
//  ARKitProject
//
//  Created by Milo Wyner on 1/16/21.
//

import SwiftUI

struct CardDetailsView: View {
    var body: some View {
        HStack {
            Image(systemName: "person")
                .frame(width: 50, height: 50)
                .imageScale(.large)
                .padding()
                .background(Color.blue)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text("Person's Name")
                Text("(123) 456-7890")
                Text("email@gmail.com")
            }
        }
    }
}

struct CardDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailsView()
    }
}
