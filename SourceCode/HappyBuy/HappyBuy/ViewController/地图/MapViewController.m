//
//  MapViewController.m
//  HappyBuy
//
//  Created by jiyingxin on 16/4/3.
//  Copyright © 2016年 tedu. All rights reserved.
//

#import "MapViewController.h"
#import "MapViewModel.h"
#import "WebViewController.h"
@import MapKit;

@interface MapViewController ()<MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic) MapViewModel *mapVM;

@property (nonatomic) BOOL alreadyShowUserLocation;
@property (nonatomic) NSMutableSet *dataSet;
@end

@implementation MapViewController

#pragma mark - 代理 MapView
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    [self showBussinessedInMapView];
}

- (nullable MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation{
    static NSString *identify = @"annotationView";
    MKAnnotationView *annotationView = (MKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identify];
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    if (annotationView == nil) {
        annotationView = [[MKAnnotationView alloc] init];
        //        annotationView.animatesDrop = YES;
        annotationView.canShowCallout = YES;
        annotationView.image = [UIImage imageNamed:@"ic_category_default"];
    }
    annotationView.annotation = annotation;
    
    return annotationView;
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    if (!self.alreadyShowUserLocation) {
        self.alreadyShowUserLocation = YES;
        [mapView setRegion:MKCoordinateRegionMake(userLocation.location.coordinate, MKCoordinateSpanMake(0.1, 0.1)) animated:YES];
    }
}


- (void)showBussinessedInMapView{
    [self.mapVM cancelTask]; //取消之前进行的网络操作
    [self.mapVM getBusinessWithCategory:self.category region:self.mapView.region completionHandler:^(NSError *error) {
        if (error) {
            //[self.view showWarning:error.localizedDescription];
        }else{
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                //                NSMutableArray *annotions = [NSMutableArray new];
                NSMutableArray *annotions = @[].mutableCopy;
                for (BusinessBusinessesModel *model in self.mapVM.dataList) {
                    MKPointAnnotation *pointA = [MKPointAnnotation new];
                    [pointA setCoordinate:CLLocationCoordinate2DMake(model.latitude, model.longitude)];
                    pointA.title = model.name;
                    //                    if (![self.dataSet containsObject:pointA]) {
                    //                        [annotions addObject:pointA];
                    //                    }
                    [self.dataSet containsObject:pointA] ?: [annotions addObject:pointA];
                    [self.dataSet addObject:pointA];
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    //[self.mapView removeAnnotations:self.mapView.annotations];
                    [self.mapView addAnnotations:self.dataSet.allObjects];
                });
            });
        }
    }];
}

#pragma mark - 生命周期
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        self.alreadyShowUserLocation = NO;
        self.category = @"美食";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
#pragma mark - 懒加载
- (MapViewModel *)mapVM {
    if(_mapVM == nil) {
        _mapVM = [[MapViewModel alloc] init];
    }
    return _mapVM;
}

- (NSMutableSet *)dataSet {
    if(_dataSet == nil) {
        _dataSet = [[NSMutableSet alloc] init];
    }
    return _dataSet;
}

@end
