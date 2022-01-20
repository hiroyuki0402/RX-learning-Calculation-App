//
//  ViewController.swift
//  RX-learning-Calculation-App
//
//  Created by SHIRAISHI HIROYUKI on 2022/01/20.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var valaTextfield: UILabel!
    @IBOutlet weak var valTextField: UILabel!
    private let caluculator = Caluculator()


    @IBOutlet weak var `operator`: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        caluculator.caluculator(operators: , val: <#T##[Int]#>)
    }

    @IBAction func button(_ sender: Any) {

    }

}


class Caluculator {

    private let subject = PublishSubject<Int>()
    private var val = 0

    var event: Observable<Int> {
        return subject
    }


    func caluculator(operators: Operator, val: [Int]) {
        switch operators {
        case .add:
            self.val = val.reduce(0){ $0 + $1}
        case .sub:
            self.val = val.reduce(0){ $0 - $1}
        case .mul:
            self.val = val.reduce(0){ $0 * $1}
        case .div:
            self.val = val.reduce(0){ $0 / $1}
        }
        subject.onNext(self.val)
    }
}

enum Operator {
    case add, sub, mul, div
}


