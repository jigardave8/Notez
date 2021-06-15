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
    
    func getDecomentaryDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    
    return path[0]
        
    }
    func save(){
//        dump(notes)
        do{
            let data = try JSONEncoder() .encode(notes)
            
            let url = getDecomentaryDirectory().appendingPathComponent("notes")
            
            try data.write(to: url)
        }
        catch{
            print("Saving data has failed!")
        }
        
    }
    
    func load() {
        do {
            
        }
        
        catch{
            
        }
    }
  
    
    
    // MARK:- BODY
    
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6)
            {
            TextField("Add new Note", text: $text)
                Button {
                    //action
                    
                    guard text.isEmpty == false else{return}
                    
                    let note = Note (id: UUID(), text:text)
                    
                    notes.append(note)
                    
                    text = ""
                    
                    save()
                    
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
            
            Text ("\(notes.count)")
            
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
