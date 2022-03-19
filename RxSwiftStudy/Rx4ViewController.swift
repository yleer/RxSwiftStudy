//
//  Rx4ViewController.swift
//  RxSwiftStudy
//
//  Created by Yundong Lee on 2022/03/16.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit


class Rx4ViewController: UIViewController {
    
    // practice 1
    let pickerView = UIPickerView()
    let label = UILabel()
    let disposeBag = DisposeBag()
    let items = ["a", "b", "c"]

    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
        
        let items = Observable.just(["a", "b", "c"])

        items
            .bind(to: pickerView.rx.itemTitles)  { (row, element) in
            return element
        }.disposed(by: disposeBag)


        pickerView.rx.modelSelected(String.self)
            .subscribe { value in
                print("pickerview selected : \(value)")
            }.disposed(by: disposeBag)
        
        
//
//        pickerView.dataSource = self
//        pickerView.delegate = self

    }


    private func setUp() {
        view.addSubview(pickerView)
        pickerView.backgroundColor = .white
        pickerView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(200)

        }
    }
    
//    // practice 2
//    let tableView = UITableView()
//    let label = UILabel()
//    let disposeBag = DisposeBag()
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
    
}


//extension Rx4ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
//
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        items[row]
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        items.count
//    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        print(items[row])
//    }
//}

 
class ViewModel {
    
    let items = Observable.just([
        "First Item",
        "Second Item",
        "Third Item"
    ])
    
    
}
