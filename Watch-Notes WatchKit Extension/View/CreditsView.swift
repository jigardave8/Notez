//
//  CreditsView.swift
//  Watch-Notes WatchKit Extension
//
//  Created by jigar dave on 18/06/21.
//

import SwiftUI

struct CreditsView: View {
    // MARK:-  PROPERTY
    @State private var randomNumber: Int = Int.random(in: 1..<4)
    
    private var randomImage: String{
        return "developer-no\(randomNumber)"
        
    }

    // MARK:- BODY
 var body: some View {
        VStack(spacing: 3){
            // profile image
            Image("developer-no1")
                //Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            //header
            HeaderView(title: "Credits")
            //content
            Text("Jigar Dave")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
            
        }//vstack
    }
}

// MARK:- PREVIEW
struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
