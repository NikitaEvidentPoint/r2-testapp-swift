//
//  CellMenuView.swift
//  r2-navigator
//
//  Created by Alexandre Camilleri on 6/23/17.
//  Copyright © 2017 European Digital Reading Lab. All rights reserved.
//

import UIKit

protocol CellMenuViewDelegate: class {
    func infoTapped()
    func removeTapped()
    func cancelTapped()
}

class CellMenuView: UIView {
    let infoButton: UIButton!
    let removeButton: UIButton!
    let cancelButton: UIButton!
    weak var delegate: CellMenuViewDelegate?

    override init(frame: CGRect) {
        let width = frame.size.width
        let height = frame.size.height / 3
        let offset = height

        infoButton = UIButton(frame: CGRect(x: 0, y: 0, width: width, height: height))
        removeButton = UIButton(frame: CGRect(x: 0, y: offset, width: width, height: height))
        cancelButton = UIButton(frame: CGRect(x: 0, y: offset * 2, width: width, height: height))

        var modifiedFrame = frame
        modifiedFrame.origin = CGPoint.zero
        super.init(frame: modifiedFrame)
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        infoButton.isAccessibilityElement = true
        infoButton.setTitle("Infos", for: .normal)
        infoButton.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
        infoButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchDown)
        removeButton.isAccessibilityElement = true
        removeButton.setTitle("Remove", for: .normal)
        removeButton.setTitleColor(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), for: .normal)
        removeButton.addTarget(self, action: #selector(removeButtonTapped), for: .touchDown)
        cancelButton.isAccessibilityElement = true
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchDown)
        addSubview(infoButton)
        addSubview(removeButton)
        addSubview(cancelButton)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CellMenuView {
    func infoButtonTapped() {
        delegate?.infoTapped()
    }

    func removeButtonTapped() {
        delegate?.removeTapped()
    }

    func cancelButtonTapped() {
        delegate?.cancelTapped()
    }
}
