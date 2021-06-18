//
//  SettingsView.swift
//  Watch-Notes WatchKit Extension
//
//  Created by jigar dave on 18/06/21.
//

import SwiftUI

struct SettingsView: View {
    // MARK:-  PROPERTY
    
    @AppStorage ("lineCount") var lineCount: Int = 1
    @State private var value: Float = 1.0
    
    // MARK:- FUNCTION
    
    func update(){
        lineCount = Int(value)
    }
    
    // MARK:- BODY
    var body: some View {
        
        VStack (spacing: 8){
            //header
            HeaderView(title: "Settings")
            //actual line count
            
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)
            //slider
            Slider (value: Binding(get: {
                                    self.value}, set: {(newValue) in self.value = newValue
                                        self.update()})
                    , in:1...4, step: 1)
                .accentColor(.accentColor)
            
            
        }//vstack
    }
}

// MARK:- PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
