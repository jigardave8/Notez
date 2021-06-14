//
//  ContentView.swift
//  Watch-Notes WatchKit Extension
//
//  Created by jigar dave on 14/06/21.
//

import SwiftUI

struct ContentView: View {
    
    // MARK:-  PROPERTY
    @State private var notes: [Note] = [Note]()
    @State private var text : String = ""
         
    
    // MARK:- FUNCTION
    
  
    
    
    // MARK:- BODY
    
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6)
            {
            TextField("Add new Note", text: $text)
                Button{
                    //action
                }
                label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42, weight: .thin))
                }
                .fixedSize()
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(.accentColor)
//                .buttonStyle(BorderedButtonStyle(tint: .accentColor))
                
                
        
            }//hstack
            Spacer()
            
        }//vstack
        .navigationTitle("Notes")
        
        
    }
}


// MARK:- PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
