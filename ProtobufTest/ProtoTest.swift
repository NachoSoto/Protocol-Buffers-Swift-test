//
//  ProtoTest.swift
//  ProtobufTest
//
//  Created by Nacho Soto on 3/7/15.
//  Copyright (c) 2015 Nacho Soto. All rights reserved.
//

import Foundation
import ProtocolBuffers
import ReactiveCocoa

func createPerson() -> Person {
	return Person.builder()
		.setId(1)
		.setName("name")
		.setEmail("my@email.com")
		.build()
}

func request() -> SignalProducer<NSData, NSError> {
	let session = NSURLSession.sharedSession()
	let request = NSURLRequest(URL: NSURL(string: "http://localhost:3000/")!)

	return session.rac_dataWithRequest(request)
	|> map { (data, response) in
		return data
	}
}

func personRequest() -> SignalProducer<Person, NSError> {
	return request()
	|> map {
		return Person.parseFromData($0)
	}
}

