//    Copyright 2019 (c) Andrea Scuderi - https://github.com/swift-sprinter
//
//    Licensed under the Apache License, Version 2.0 (the "License");
//    you may not use this file except in compliance with the License.
//    You may obtain a copy of the License at
//
//        http://www.apache.org/licenses/LICENSE-2.0
//
//    Unless required by applicable law or agreed to in writing, software
//    distributed under the License is distributed on an "AS IS" BASIS,
//    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//    See the License for the specific language governing permissions and
//    limitations under the License.

@testable import ProductService
import XCTest

final class APIGatewayTests: XCTestCase {
    
    func testDecode() {
        
        let data = jsonAPIGatewayProxyEvent.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        do {
            let event = try decoder.decode(APIGatewayProxyEvent.self, from: data)
            
            XCTAssertNotNil(event.headers)
            XCTAssertNotNil(event.body)
            XCTAssertNotNil(event.pathParameters)
            XCTAssertNotNil(event.multiValueHeaders)
            XCTAssertNotNil(event.multiValueQueryStringParameters)
            XCTAssertNotNil(event.queryStringParameters)
            XCTAssertNotNil(event.requestContext)
            XCTAssertNotNil(event.stageVariables)
            
        } catch {
            print(error)
            XCTFail()
        }
        
    }

    static var allTests = [
        ("testDecode", testDecode),
    ]
}