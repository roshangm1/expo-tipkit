import ExpoModulesCore

// This view will be used as a native component. Make sure to inherit from `ExpoView`
// to apply the proper styling (e.g. border radius and shadows).
class ExpoTipkitView: ExpoView {
    weak var tipContainerView: UIView?
    
    weak var subView: UIView?
    

     override public func didSetProps(_ changedProps: [String]!) {
         super.didSetProps(changedProps)
         reactSubviews().forEach { subview in
             if let taggedSubview = subview as? UIView{
                 subView = subview
             }
             addSubview(subview)
         }
     }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        reactSubviews().forEach { subview in
            subview.frame = bounds
            
        }
    }
    

}
