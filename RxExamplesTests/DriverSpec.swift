//
//  DriverSpec.swift
//  RxExamplesTests
//
//  Created by noohnooh on 18/12/2018.
//  Copyright © 2018 유금상. All rights reserved.
//

import XCTest
import Quick
import Nimble
import RxSwift
import RxCocoa
import RxBlocking
import RxTest

class DriverSpec: QuickSpec {

    override func spec() {
        continueAfterFailure = false
        var disposeBag: DisposeBag!
        beforeEach {
            disposeBag = DisposeBag()
        }
        context("just") {

            it("is main thread in next") {
                waitUntil(action: { completion in
                    Driver.just("JUST").drive(onNext: { (element) in
                        expect(Thread.isMainThread).to(beTrue())
                        completion()
                    }).disposed(by: disposeBag)
                })
            }
            it("is main thread in complete") {
                waitUntil(action: { completion in
                    Driver.just("JUST").drive(onCompleted: { () -> () in
                        expect(Thread.isMainThread).to(beTrue())
                        completion()
                    }).disposed(by: disposeBag)
                })
            }
        }
    }

}
