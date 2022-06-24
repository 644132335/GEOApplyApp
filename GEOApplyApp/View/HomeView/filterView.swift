//
//  filterView.swift
//  GEOApplyApp
//
//  Created by Matthew Jiang on 2022/6/24.
//

import SwiftUI

struct filterView: View {
    @EnvironmentObject var manager : AppManager
    @Binding var isShowingSheet : Bool
    @State var GPAerroMessage=""
    @State var SATerroMessage=""
    @State var TOFELerroMessage=""
    @State var GREerroMessage=""
    @State var erroMessage=""
    var degreeArray=["Bachelor","Master","All"]
    
    var body: some View {
        NavigationView{
            Form{
                //degree
                Section(){
                    Picker("Degree Applying",selection:$manager.filterDegree){
                        ForEach(degreeArray,id:\.self){i in
                            Text(i)
                            
                        }
                    }
                }
                
                //score
                Section(footer: Text(GPAerroMessage).foregroundColor(Color.red)){
                    VStack{
                        Text("GPA").bold().font(.title2).opacity(0.5)
                        HStack{
                            Text("MIN: "+String(format: "%.2f", manager.filterGPAmin)).opacity(0.5)
                            Slider(value: $manager.filterGPAmin, in: 0...4.0,step:0.01)}
                        HStack{
                            Text("MAX: "+String(format: "%.2f", manager.filterGPAmax)).opacity(0.5)
                            Slider(value: $manager.filterGPAmax, in: 0...4.0,step:0.01)
                        }
                        
                    }
                }
                
                //sat
                Section(footer: Text(SATerroMessage).foregroundColor(Color.red)){
                    VStack{
                        Text("SAT").bold().font(.title2).opacity(0.5)
                        HStack{
                            Text("MIN: "+String(format: "%.0f", manager.filterSATmin)).opacity(0.5)
                            Slider(value: $manager.filterSATmin, in: 0...1600,step:1)}
                        HStack{
                            Text("MAX: "+String(format: "%.0f", manager.filterSATmax)).opacity(0.5)
                            Slider(value: $manager.filterSATmax, in: 0...1600,step:1)
                        }
                        
                    }
                }
                
                //tofel
                Section(footer: Text(TOFELerroMessage).foregroundColor(Color.red)){
                    VStack{
                        Text("TOFEL").bold().font(.title2).opacity(0.5)
                        HStack{
                            Text("MIN: "+String(format: "%.0f", manager.filterTOFELmin)).opacity(0.5)
                            Slider(value: $manager.filterTOFELmin, in: 0...120,step:1)}
                        HStack{
                            Text("MAX: "+String(format: "%.0f", manager.filterTOFELmax)).opacity(0.5)
                            Slider(value: $manager.filterTOFELmax, in: 0...120,step:1)
                        }
                        
                    }
                }
                
                //gre
                Section(footer: Text(GREerroMessage).foregroundColor(Color.red)){
                    VStack{
                        Text("GRE").bold().font(.title2).opacity(0.5)
                        HStack{
                            Text("MIN: "+String(format: "%.0f", manager.filterGREmin)).opacity(0.5)
                            Slider(value: $manager.filterGREmin, in: 0...320,step:1)}
                        HStack{
                            Text("MAX: "+String(format: "%.0f", manager.filterGREmax)).opacity(0.5)
                            Slider(value: $manager.filterGREmax, in: 0...320,step:1)
                        }
                        
                    }
                }
                
                Section(){
                    Button(action: {
                        //perform filter
                        manager.filterSATmin=0.0
                        manager.filterSATmax=1600.0
                        manager.filterTOFELmin=0.0
                        manager.filterTOFELmax=120.0
                        manager.filterGREmin=0.0
                        manager.filterGREmax=320.0
                        manager.filterGPAmin=0.0
                        manager.filterGPAmax=4.0
                                            }){
                        HStack{
                            Spacer()
                            Text("RESET")
                                
                            Spacer()
                        }
                                            }}
                
                Section(footer:Text(erroMessage).foregroundColor(Color.red)){
                    Button(action: {
                        //perform filter
                        if manager.filterGPAmin>manager.filterGPAmax{
                            erroMessage="Please modify your filter values"
                            GPAerroMessage="min value should not be greater than max value"
                        }
                        else if manager.filterSATmin>manager.filterSATmax{
                            GPAerroMessage=""
                            SATerroMessage="min value should not be greater than max value"
                        }
                        else if manager.filterTOFELmin>manager.filterTOFELmax{
                            SATerroMessage=""
                            TOFELerroMessage="min value should not be greater than max value"
                        }
                        else if manager.filterGREmin>manager.filterGREmax{
                            TOFELerroMessage=""
                            GREerroMessage="min value should not be greater than max value"
                        }
                        else{
                            manager.filterFunc()
                            isShowingSheet.toggle()
                        }
                    }){
                        HStack{
                            Spacer()
                            Text("SAVE")
                                .foregroundColor(Color.green)
                            Spacer()
                        }
                    }
                    .padding(5)
                    
                }
            }
        }.environmentObject(manager).environment(\.colorScheme, .light)
    }
}
