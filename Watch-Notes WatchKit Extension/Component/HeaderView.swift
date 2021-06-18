//
//  HeaderView.swift
//  Watch-Notes WatchKit Extension
//
//  Created by jigar dave on 18/06/21.
//

import SwiftUI

struct HeaderView: View {
    // MARK:-  PROPERTY

    var title: String = ""
    
    // MARK:- BODY
  var body: some View {
       
        VStack {
            //title
            if title != "" {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
                
                
            }
            //seperator
            HStack{
                    Capsule()
                        .frame(height:1)
                    
                    Image(systemName: "note.text")
                    Capsule()
                        .frame(height: 1)
                }//hstack
            .foregroundColor(.accentColor)
        }//vstack
    }
}

// MARK:- PREVIEW
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            HeaderView(title: "Credits")
            HeaderView()
        }
    }
}
