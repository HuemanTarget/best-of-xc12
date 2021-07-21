//
//  LocationSearchService.swift
//  MapLocalSearch
//
//  Created by Joshua Basche on 7/21/21.
//

import Foundation
import SwiftUI
import MapKit
import Combine

class LocationSearchService: NSObject, ObservableObject, MKLocalSearchCompleterDelegate {
  @Published var searchQuery = ""
  var completer: MKLocalSearchCompleter
  @Published var completions: [MKLocalSearchCompletion] = []
  var cancellable: AnyCancellable?
  
  override init() {
    completer = MKLocalSearchCompleter()
    super.init()
    cancellable = $searchQuery.assign(to: \.queryFragment, on: self.completer)
    completer.delegate = self
  }
  
  func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
    self.completions = completer.results
  }
}

extension MKLocalSearchCompletion: Identifiable {}
