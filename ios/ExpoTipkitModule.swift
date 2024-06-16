import ExpoModulesCore
import UIKit
import TipKit
import Foundation

// implement basic tip view



public class ExpoTipkitModule: Module {
    
    public func definition() -> ModuleDefinition {
        
        Name("ExpoTipkit")
        
        OnCreate {
            self.configureTipKit()
        }
        
        View(ExpoTipkitView.self) {
            // Defines a setter for the `name` prop.
            Prop("title") { (view: ExpoTipkitView, title: String) in
                    view.setTipTitle(title)
            }
            Prop("id") {(view: ExpoTipkitView, id: String) in
                view.setTipId(id)
            }
            Prop("show") {(view: ExpoTipkitView, show: Bool) in
                view.setShow(show)
                
            }
        }
    }
    
    private func configureTipKit() {
        Task {
                  
            if #available(iOS 17.0, *) {
                try? Tips.resetDatastore()
                try? Tips.configure()
            } else {
                // Fallback on earlier versions
            }
         
        }
    }

}
