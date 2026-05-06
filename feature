%%writefile Feature.h
#ifndef Feature_H
#define Feature_H

#include <iostream>
#include <fstream>
#include <string>
#include <iomanip>

#include "Constants.h"
#include "Review.h"
#include "Person.h"
#include "Traveler.h"
#include "Hotel.h"
#include "FileIO.h"
using namespace std;

void printMenu();

void hotelAnalyticsReport(const Hotel& hotel) 
{ 
  cout << "\n--- Analytics Report for " << hotel.getHotelName() << " ---" << endl;
  cout << "(Detailed analytics would go here)" << endl;
}


void propertyDeepDive(Hotel hotels[], int hotelCount) {
    cout << "\n========== PROPERTY DEEP-DIVE ==========" << endl;
    cout << "Enter hotel name: ";
    cin.ignore();
    string searchName;
    getline(cin, searchName);

    for (int i = 0; i < hotelCount; i++) {
        if (hotels[i].getHotelName() == searchName) {
            hotels[i].printHotelProfile(); 
            hotelAnalyticsReport(hotels[i]);
            return;
        }
    }

    cout << "Hotel '" << searchName << "' not found in database." << endl;
}


void travelerProfileManagement(Traveler travelers[], int travelerCount) {
    cout << "\n========== TRAVELER PROFILE ==========" << endl;
    cout << "Enter traveler ID: ";
    int searchID;
    cin >> searchID;

    for (int i = 0; i < travelerCount; i++) {
        if (travelers[i].getPersonID() == searchID) { 
            travelers[i].printProfile();
            travelers[i].displayWrittenReviews(); 
            return;
        }
    }

    cout << "Traveler with ID " << searchID << " not found." << endl;
}


void topPickMatcher(Hotel hotels[], int hotelCount) {
    cout << "\n========== TOP-PICK MATCHER ==========" << endl;
    cout << "Hotel Rankings (by average rating):" << endl;

    // Simple bubble sort using operator overloading
    Hotel temp;
    for (int i = 0; i < hotelCount - 1; i++) {
        for (int j = 0; j < hotelCount - i - 1; j++) {
            if (hotels[j] < hotels[j + 1]) { 
                temp = hotels[j];
                hotels[j] = hotels[j + 1];
                hotels[j + 1] = temp;
            }
        }
    }

    cout << "\nRanked Hotels:" << endl;
    for (int i = 0; i < hotelCount && i < 10; i++) {
        cout << "[" << (i + 1) << "] " << hotels[i] << endl; 
    }
}


void topReviewers(Traveler travelers[], int travelerCount) {
    cout << "\n========== TOP REVIEWERS (by Loyalty Points) ==========" << endl;

    // Simple bubble sort using operator overloading
    Traveler temp;
    for (int i = 0; i < travelerCount - 1; i++) {
        for (int j = 0; j < travelerCount - i - 1; j++) {
            if (travelers[j] < travelers[j + 1]) { 
                temp = travelers[j];
                travelers[j] = travelers[j + 1];
                travelers[j + 1] = temp;
            }
        }
    }

    cout << "\nTop Reviewers:" << endl;
    for (int i = 0; i < travelerCount && i < 10; i++) {
        cout << "[" << (i + 1) << "] " << travelers[i].getPersonName() 
             << " | Loyalty Points: " << travelers[i].getLoyaltyPoints()
             << " | Level: " << travelers[i].getMembershipLevel()
             << " | Reviews: " << travelers[i].getReviewCount() << endl;
    }
}

void printMenu() {
    cout << "\n========== HOTEL REVIEW SYSTEM ==========" << endl;
    cout << "1. Property Deep-Dive" << endl;
    cout << "2. Traveler Profile" << endl;
    cout << "3. Top-Pick Matcher" << endl;
    cout << "4. Top Reviewers" << endl;
    cout << "5. Exit" << endl;
    cout << "========================================" << endl;
}

#endif
