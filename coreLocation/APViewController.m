//
//  APViewController.m
//  coreLocation
//
//  Created by Alan Stirling on 07/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "APViewController.h"

@interface APViewController ()

@end

@implementation APViewController

@synthesize locationManager = _locationManager;
@synthesize currentLocation = _currentLocation;
@synthesize gpsOutput = _gpsOutput;


// this method fetches the current location and sets local variable to it, it also checks for accuracy which if is less than 100m stops updating the location
-(void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    self.currentLocation = newLocation;
    
    if(newLocation.horizontalAccuracy <= 100.0f){
        [_locationManager stopUpdatingLocation];
    }
}


// this method runs if there is an error when getting location information
-(void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    [_locationManager stopUpdatingLocation];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error retrieving location"
                                                    message:[error description]
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)viewDidLoad
{
    self.locationManager = [CLLocationManager new]; // create new instance of CLLocationManager
    self.locationManager.delegate = self; // set delegate of CLLocationManager instance to current class
    [self.locationManager startUpdatingLocation]; // run startUpdatingLocation method
    
    self.gpsOutput.text = [NSString stringWithFormat:@"%@", self.locationManager.location]; // set label text to location information
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setGpsOutput:nil];
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    [self.locationManager stopUpdatingLocation];
}


@end
