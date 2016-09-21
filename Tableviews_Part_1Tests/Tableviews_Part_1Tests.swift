//
//  Tableviews_Part_1Tests.swift
//  Tableviews_Part_1Tests
//
//  Created by Louis Tur on 9/20/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import XCTest
@testable import Tableviews_Part_1

class Tableviews_Part_1Tests: XCTestCase {
    
    internal var lannisters: [String]!
    internal var joffreysParents: [String]!
    internal var starks: [String]!
    
    internal let trueHeirToTheIronThrone: String = "???"
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        lannisters = ["Tyrion", "Jaime", "Cersie", "Tywin"]
        joffreysParents = ["Jaime", "Cersie"]
        starks = ["Ned", "Sansa", "Arya", "Bran", "Robb"]
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    //  --- asserting an expression is true ---
    func testThatThereAreFourMembersInTheLannisterArray() {
        XCTAssertTrue( self.lannisters.count == 4, "There should be four Lannisters. Actual \(self.lannisters.count)")
    }
    
    
    // --- asserting an expression is false ---
    func testThatAryaIsNotALannister() {
        XCTAssertFalse( self.lannisters.contains("Arya"), "Arya should not be in the Lannisters \(self.lannisters)")
    }
    
    
    // --- multiple assertions and data manipulation ---
    func testThatSansaIsRemovedFromTheStarks() {
        XCTAssertTrue(starks.contains("Sansa"), "Sansa should be a member of the Stark family.")
        
        let sansaIndex = self.starks.index(of: "Sansa")
        XCTAssertNotNil(sansaIndex)
        
        starks.remove(at: sansaIndex!)
        XCTAssertFalse(starks.contains("Sansa"), "Sansa should no longer be a member of the Stark family")
    }
    
    
    // --- asserting two values are equal ---
    func testThatJoffreysParentsAreBothLannisters() {
        let jaimeIsALannister: Bool = self.lannisters.contains("Jaime")
        let cersieIsALannister: Bool = self.lannisters.contains("Cersie")
        
        XCTAssertEqual(jaimeIsALannister, cersieIsALannister, "Joffrey's parents should be Jaime and Cersie")
    }
    
    
    // --- a test that needs fixing... ---
    func testThatJoffreyIsNOTTheTrueHeirToTheIronThrone() {
        
        // this test was clearly written by Joffrey...
        XCTAssertTrue("Joffrey" == trueHeirToTheIronThrone, "Joffrey is NOT the true heir. The true heir is \(trueHeirToTheIronThrone)")
    }
}
