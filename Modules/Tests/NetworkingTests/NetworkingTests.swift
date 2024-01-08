//
//  NetworkingTests.swift
//  
//
//  Created by Waqas Naseem on 25/09/2023.
//

import XCTest
@testable import Networking

final class NetworkingTests: XCTestCase {
    
    /// some test model to get mock Decodable
    struct MockDecodable: Decodable {
        let count: Int
        let next: String
    }
    
    var networkService: NetworkService!
    
    override func setUp() {
        super.setUp()
        networkService = NetworkService()
    }
    
    override func tearDown() {
        networkService = nil
        super.tearDown()
    }
    
    func testMakeURLRequest() {
        // Given
        let baseUrl = "https://rickandmortyapi.com"
        let apiPath = "/api/character"
        let expectedPath = baseUrl + apiPath
        let endpoint = Endpoint(baseURL: baseUrl, path: apiPath)
        
        // when
        do {
            let request = try networkService.makeURLRequest(with: endpoint)
            // Then
            // Assert
            XCTAssertEqual(request.httpMethod, "GET")
            XCTAssertEqual(request.url?.absoluteString, expectedPath)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    func testRequest_create_expectedResponse() async {
        // Given
        let networkService = NetworkService()
        let baseUrl = "https://wger.de"
        let apiPath = "/api/v2/exerciseinfo/"
        
        let endpoint = Endpoint(baseURL: baseUrl, path: apiPath)
        
        // when
        do {
            let response: MockDecodable = try await networkService.request(with: endpoint)
            // Assert
            XCTAssertNotNil(response)
            // Add assertions for the response data as needed
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
}
