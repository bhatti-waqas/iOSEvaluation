//
//  Coordinator.swift
//  Modules
//
//  Created by Waqas Naseem on 14/10/2023.
//

/// Types adopting the `Coordinator` protocol will used to start/manage view controllers navigations.
public protocol Coordinator: AnyObject {
    /// it will start the flow or navigation.
    func start()
    
    /// it will hold the child coordinator of current coordinator.
    var child: Coordinator? { get set }
    
    /// it will hold the parent coordinator of current coordinator.
    var parent: Coordinator? { get set }
}

extension Coordinator {
    /// it will start the child coordinator.
    /// - Parameter coordinator: specify child coordinator.
    public func startChild(_ coordinator: Coordinator) {
        child = coordinator
        child?.parent = self
        coordinator.start()
    }
    
    /// inform the parent coordinator that its child finished.
    public func didFinishChild() {
        child = nil
        parent?.child = nil
    }
}
