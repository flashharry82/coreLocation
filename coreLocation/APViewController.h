//
//  APViewController.h
//  coreLocation
//
//  Created by Alan Stirling on 07/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APViewController : UIViewController <CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager * locationManager;
@property (strong, nonatomic) CLLocation * currentLocation;
@property (strong, nonatomic) IBOutlet UILabel *gpsOutput;

-(void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation;
-(void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error;

@end
