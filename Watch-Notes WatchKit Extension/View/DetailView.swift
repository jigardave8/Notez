//
//  DetailView.swift
//  Watch-Notes WatchKit Extension
//
//  Created by jigar dave on 18/06/21.
//

import SwiftUI
struct DetailView: View {
    // MARK:-  PROPERTY
    let note: Note
    let count: Int
    let index: Int
    
    @State private var isCreditisPresented: Bool = false
    @State private var isSettingsPresented: Bool = false
    
    
    // MARK:- BODY
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            //header
            HeaderView(title: "")
            
            
            //content
            Spacer()
            
            ScrollView(.vertical){
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            Spacer()
            
            
            //footer
            HStack(alignment: .center){
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingsPresented.toggle()
                    }
                    .sheet(isPresented: $isSettingsPresented, content: {
                        SettingsView()
                    })
                
                Spacer()
                Text("\(count) / \(index + 1)")
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditisPresented.toggle()
                    }
                    .sheet(isPresented: $isCreditisPresented, content: {
                        CreditsView()
                    } )
                
            }//hstack
            .foregroundColor(.secondary)
        }//vstack
        .padding(3)
    }
    
}

// MARK:- PREVIEW
struct DetailView_Previews: PreviewProvider {
    static var sampleData: Note = Note(id: UUID(), text: "Hello, World!")
    static var previews: some View {
        DetailView(note: sampleData, count: 5, index: 1)
    }
}
