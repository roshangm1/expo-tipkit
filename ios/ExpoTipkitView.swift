import ExpoModulesCore
import TipKit

// This view will be used as a native component. Make sure to inherit from `ExpoView`
// to apply the proper styling (e.g. border radius and shadows).



class ExpoTipkitView: ExpoView {
 

    struct SearchTip: Tip {
        var id: String
        var title: Text
        var message: Text? {
            Text("Search for new games to play via IGDB.")
        }
        
        var asset: Image? {
            Image(systemName: "magnifyingglass")
        }
        
        init(id: String, title: String) {
            self.title = Text(title)
            self.id = id
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
    
    func setTipTitle(_ title: String){
        self.title = title
    }
    
    func setTipId(_ id: String) {
        self.id = id
    }
    
    @available(iOS 17.0, *)
    func showTipView(){
        var tipPopoverController: TipUIPopoverViewController?

        guard let reactSubviews = self.reactSubviews() else { return  }
        
        let subview = reactSubviews.first

        DispatchQueue.main.async {
            
          
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let rootViewController = windowScene.windows.first?.rootViewController else {
                return
            }
            
            let tip = SearchTip(id: self.id!, title: self.title! )
            
          
            Task { @MainActor in
                
                do {
                        
                        let shouldDisplay = try await self.shouldDisplayTip(tip: tip)
                  
                        
                        if shouldDisplay {
                            let controller = TipUIPopoverViewController(tip, sourceItem:  subview!)
                                
                                
                                rootViewController.present(controller, animated: true)
                            tipPopoverController = controller
                           
                           
                        } else if rootViewController.presentedViewController is TipUIPopoverViewController {
                            rootViewController.dismiss(animated: true)
                            tipPopoverController = nil
                        }
                   
                    } catch {
                        print("Error during async operation: \(error)")
                    }
                }
            
        }
    }
    
    
    override func insertReactSubview(_ subview: UIView!, at atIndex: Int) {
        super.insertReactSubview(subview, at: atIndex)
        if #available(iOS 17.0, *) {
            showTipView()
        } else {
            // Fallback on earlier versions
        }
    }
    
    
    var title: String? { didSet {
        if #available(iOS 17.0, *) {
            showTipView()
        } else {
            // Fallback on earlier versions
        }
    }}
    
    var id: String? { didSet {
        if #available(iOS 17.0, *) {
            showTipView()
        } else {
            // Fallback on earlier versions
        }
    }}
    
           

}
