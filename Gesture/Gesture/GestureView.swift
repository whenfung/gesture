//
//  GestureView.swift
//  Gesture
//
//  Created by deng on 2021/6/7.
//

import UIKit

class GestureView: UIView {
    lazy var tap: TapGestureRecognizer = {
        TapGestureRecognizer(target: self, action: #selector(singleTapGesture))
    }()
    
    init() {
        super.init(frame: .zero)
        tap.name = "\(Self.self) tapGestureRecognizer"
        self.addGestureRecognizer(tap)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: -

extension GestureView {
    @objc func singleTapGesture() {
        self.backgroundColor = .random.withAlphaComponent(0.5)
    }

    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        print("\(Self.self) : gestureRecognizer should begin (\(gestureRecognizer.name!))")
        return true
    }
}

// MARK: -

extension GestureView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("\(Self.self) : in hit test")
        let view = super.hitTest(point, with: event)
        print("\(Self.self) : out hit test")
        return view
    }

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let isInside = super.point(inside: point, with: event)
        print("\(Self.self) : point inside (\(isInside))")
        return isInside
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("\(Self.self) : touch begin")
        super.touchesBegan(touches, with: event)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("\(Self.self) : touch moved")
        super.touchesMoved(touches, with: event)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("\(Self.self) : touch ended")
        super.touchesEnded(touches, with: event)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("\(Self.self) : touch canceled")
        super.touchesCancelled(touches, with: event)
    }
}
