import ExpoModulesCore
import UIKit
import TipKit
import Foundation

// implement basic tip view

struct SearchTip: Tip {
    var id: String
    var title: Text {
        Text("Add a new game")
    }
    
    var message: Text? {
        Text("Search for new games to play via IGDB.")
    }
    
    var asset: Image? {
        Image(systemName: "magnifyingglass")
    }
}


public class ExpoTipkitModule: Module {
    private weak var tipSourceView: UIView?

    public func registerTipSourceView(_ view: UIView) {
        self.tipSourceView = view
    }
    
    public func definition() -> ModuleDefinition {
        
        Name("ExpoTipkit")
        
        OnCreate {
            self.configureTipKit()
        }
        
        Function("displayTip") { (tipId: String, tag: Int) in
            if #available(iOS 17.0, *) {
                self.displayTip(tipId: tipId, tag: tag)
            } else {
                // Fallback on earlier versions
            }
        }
        
        View(ExpoTipkitView.self) {
            // Defines a setter for the `name` prop.
            Prop("name") { (view: ExpoTipkitView, prop: String) in
                print(prop)
            }
        }
    }
    
    private func configureTipKit() {
        Task {
            if #available(iOS 17.0, *) {
                try?  Tips.configure()
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
    @available(iOS 17.0, *)
    private func shouldDisplayTip(tip: SearchTip) async throws -> Bool {
        for try await shouldDisplay in tip.shouldDisplayUpdates {
            if shouldDisplay {
                return true
            }
        }
        return false
    }
    var searchButton: UIButton = UIButton(type: .system)

    @available(iOS 17.0, *)
    private func displayTip(tipId: String, tag: Int) {

        
        DispatchQueue.main.async {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let rootViewController = windowScene.windows.first?.rootViewController,
                  let view = rootViewController.view.subviews.first else {
                
                print("Could not find view with tag")
             
                return
            }
            
            

//            self.searchButton.setTitle("Search", for: .normal)
//            self.searchButton.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
//            
//            view.addSubview(self.searchButton)
//            
//            
            let tip = SearchTip(id: tipId)
            Task { @MainActor in
                do {
                        
                    let shouldDisplay = try await self.shouldDisplayTip(tip: tip)
                        
                        
                        if shouldDisplay {
                            let controller = TipUIPopoverViewController(tip, sourceItem: self.tipSourceView!)
                                
                                rootViewController.present(controller, animated: true)
                           
                        } else if rootViewController.presentedViewController is TipUIPopoverViewController {
                            rootViewController.dismiss(animated: true)
                        }
                    } catch {
                        print("Error during async operation: \(error)")
                    }
                }
            
        }
    
        
    }
           
            

}
