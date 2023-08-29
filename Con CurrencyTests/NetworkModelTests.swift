import XCTest

@testable import Con_Currency

class NetworkModelTests: XCTestCase {

    func testGetDataForConvert() {
        let expectation = self.expectation(description: "Conversion data retrieved")
        let tail = "/pair/USD/EGP/1"
        
        NetworkModel.getDataForConvert(tail: tail) { error, currencyData in
            XCTAssertNil(error, "Error should be nil")
            XCTAssertNotNil(currencyData, "Currency data should not be nil")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testGetDataForCompare() {
        let expectation = self.expectation(description: "Comparison data retrieved")
        let tail = "/compare/USD/EGP/QAR/1"
        NetworkModel.getDataForCompare(tail: tail) { error, valueOne, valueTwo in
        XCTAssertNil(error, "Error should be nil")
        XCTAssertNotNil(valueOne, "Value One should not be nil")
        XCTAssertNotNil(valueTwo, "Value Two should not be nil")
        expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testGetFavouriteCurrency() {
          let expectation = self.expectation(description: "Favourite currency data retrieved")
          let tail = "/rates"
          let base = "USD"
          let currenciesName = ["EUR", "JPY"]
          
          NetworkModel.getFavouriteCurrency(tail: tail, base: base, currenciesName: currenciesName) { error, json in
              XCTAssertNil(error, "Error should be nil")
              XCTAssertNotNil(json, "JSON data should not be nil")
              
              if let json = json {
                  XCTAssertFalse(json.isEmpty, "JSON data should not be empty")
                  // You can add more assertions based on the structure of your JSON response
              }
              
              expectation.fulfill()
          }
          
          waitForExpectations(timeout: 10, handler: nil)
      }
}
