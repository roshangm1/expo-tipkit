//import UIKit
//import TipKit
//import ExpoModulesCore
//
//struct SearchTip: Tip {
//    var id: String
//    var title: Text {
//        Text("Add a new game")
//    }
//    
//    var message: Text? {
//        Text("Search for new games to play via IGDB.")
//    }
//    
//    var asset: Image? {
//        Image(systemName: "magnifyingglass")
//    }
//}
//
//public class TipViewController: UIViewController {
//    var searchButton: UIButton = UIButton(type: .system)
//    var searchTip = SearchTip(id: "search")
//
//    public override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Configure the button and add it to the view
//        searchButton.setTitle("Search", for: .normal)
//        searchButton.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
//        view.addSubview(searchButton)
//    }
//
//    public override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        Task { @MainActor in
//            if #available(iOS 17.0, *) {
//                for await shouldDisplay in searchTip.shouldDisplayUpdates {
//                                if shouldDisplay {
//                                    let controller = TipUIPopoverViewController(searchTip, sourceItem: searchButton)
//                                    present(controller, animated: true)
//                                } else if presentedViewController is TipUIPopoverViewController {
//                                    dismiss(animated: true)
//                                }
//                            }
//            }
//        }
//    }
//    
//}
