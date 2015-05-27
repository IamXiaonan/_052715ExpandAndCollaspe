//
//  ViewController.m
//  _052715ExpandAndCollaspe
//
//  Created by Xiaonan Wang on 5/27/15.
//  Copyright (c) 2015 Xiaonan Wang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    CGRect upperImageViewRect = CGRectMake(0, 0, self.view.frame.size.width, 300);
    _upperImageView = [[UIImageView alloc]initWithFrame:upperImageViewRect];
    _upperImageView.backgroundColor = [UIColor blueColor];
    
    CGRect lowerImageViewRect = CGRectMake(_upperImageView.frame.origin.x, _upperImageView.frame.origin.y+_upperImageView.frame.size.height, _upperImageView.frame.size.width, 300);
    _lowerImageView = [[UIImageView alloc]initWithFrame:lowerImageViewRect];
    _lowerImageView.backgroundColor = [UIColor redColor];
    
    [self addQuizView];
    
    [self.view addSubview:_upperImageView];
    [self.view addSubview:_lowerImageView];
    
}

-(void)addQuizView{
    CGRect quizViewStartRect = CGRectMake(self.view.bounds.size.width, _upperImageView.frame.size.height, self.view.bounds.size.width, 100);
    _quizView = [[UIView alloc]initWithFrame:quizViewStartRect];
    _quizView.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:200.0/255.0 blue:255.0/255.0 alpha:0.8];
    [self.view addSubview:_quizView];
    
    
    
    CGRect questionLabelRect = _quizView.frame;
    questionLabelRect.size.height /= 2;
    _questionDescriptionLabel = [[UILabel alloc]initWithFrame:questionLabelRect];
    [_questionDescriptionLabel setTextAlignment:NSTextAlignmentCenter];
    [_questionDescriptionLabel setText:@"How is your day?"];
    [_questionDescriptionLabel setTextColor:[UIColor yellowColor]];
    [self.view addSubview:_questionDescriptionLabel];
    
    
    _starOne = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width, _quizView.frame.size.height*3/5 + _upperImageView.frame.size.height, _quizView.frame.size.height*3/10, _quizView.frame.size.height*3/10)];
    [_starOne setBackgroundImage:[UIImage imageNamed:@"1432680079_star.png"] forState:UIControlStateNormal];
    
    [_starOne addTarget:self action:@selector(starOneEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_starOne];
    
    _starTwo = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width, _quizView.frame.size.height*3/5 + _upperImageView.frame.size.height, _quizView.frame.size.height*3/10, _quizView.frame.size.height*3/10)];
    [_starTwo setBackgroundImage:[UIImage imageNamed:@"1432680079_star.png"] forState:UIControlStateNormal];
    [_starTwo addTarget:self action:@selector(starTwoEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_starTwo];
    
    _starThree = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width, _quizView.frame.size.height*3/5 + _upperImageView.frame.size.height, _quizView.frame.size.height*3/10, _quizView.frame.size.height*3/10)];
    [_starThree setBackgroundImage:[UIImage imageNamed:@"1432680079_star.png"] forState:UIControlStateNormal];
    [_starThree addTarget:self action:@selector(starThreeEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_starThree];
    
    _starFour = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width, _quizView.frame.size.height*3/5 + _upperImageView.frame.size.height, _quizView.frame.size.height*3/10, _quizView.frame.size.height*3/10)];
    [_starFour setBackgroundImage:[UIImage imageNamed:@"1432680079_star.png"] forState:UIControlStateNormal];
    [_starFour addTarget:self action:@selector(starFourEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_starFour];
    
    _starFive = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width, _quizView.frame.size.height*3/5 + _upperImageView.frame.size.height, _quizView.frame.size.height*3/10, _quizView.frame.size.height*3/10)];
    [_starFive setBackgroundImage:[UIImage imageNamed:@"1432680079_star.png"] forState:UIControlStateNormal];
    [_starFive addTarget:self action:@selector(starFiveEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_starFive];
}

- (void)viewDidAppear:(BOOL)animated{
    [self animationOne:nil finished:nil context:nil];
}


#pragma mark - animations
- (void)animationOne:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context{
    CGRect upperFrame = _upperImageView.frame;
    //upperFrame.origin.y = upperFrame.origin.y-100;
    
    CGRect lowerFrame = _lowerImageView.frame;
    lowerFrame.origin.y = lowerFrame.origin.y+100;
    
    [UIView animateWithDuration:0.5 delay:1.0 options:(UIViewAnimationCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction) animations:^{
        _upperImageView.frame = upperFrame;
        _lowerImageView.frame = lowerFrame;
    } completion:^(BOOL finished){
        [self animationTwo:nil finished:nil context:nil];
    }];
    
    
    
    [UIView commitAnimations];
}

-(void)animationTwo:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context{
    CGRect quizViewEndRect = _quizView.frame;
    CGRect questionViewEndRect = _questionDescriptionLabel.frame;
    CGRect starOneEndRect = _starOne.frame;
    CGRect starTwoEndRect = _starOne.frame;
    CGRect starThreeEndRect = _starOne.frame;
    CGRect starFourEndRect = _starOne.frame;
    CGRect starFiveEndRect = _starOne.frame;
    
    starOneEndRect.origin.x = _quizView.frame.size.width/4 - _quizView.frame.size.height*3/20;
    starTwoEndRect.origin.x = _quizView.frame.size.width*3/8 - _quizView.frame.size.height*3/20;
    starThreeEndRect.origin.x = _quizView.frame.size.width/2 - _quizView.frame.size.height*3/20;
    starFourEndRect.origin.x = _quizView.frame.size.width*5/8 - _quizView.frame.size.height*3/20;
    starFiveEndRect.origin.x = _quizView.frame.size.width*3/4 - _quizView.frame.size.height*3/20;

    quizViewEndRect.origin.x = 0;
    questionViewEndRect.origin.x = 0;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelay:0.0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    
    _quizView.frame = quizViewEndRect;
    _questionDescriptionLabel.frame = questionViewEndRect;
    _starOne.frame = starOneEndRect;
    _starTwo.frame = starTwoEndRect;
    _starThree.frame = starThreeEndRect;
    _starFour.frame = starFourEndRect;
    _starFive.frame = starFiveEndRect;
    
    [UIView commitAnimations];
    
}

-(void)quizEaseOut:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context{
    CGRect lowerEndRect = _lowerImageView.frame;
    lowerEndRect.origin.y -= 100;
    
    [UIView animateWithDuration:0.5 delay:1.0 options:(UIViewAnimationCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction) animations:^{
        _questionDescriptionLabel.alpha = 0.0;
        _starOne.alpha = 0.0;
        _starTwo.alpha = 0.0;
        _starThree.alpha = 0.0;
        _starFour.alpha = 0.0;
        _starFive.alpha = 0.0;
        _quizView.alpha = 0.0;
        _lowerImageView.frame = lowerEndRect;
    } completion:^(BOOL finished) {
        
    }];
    
}


#pragma mark - control events

-(void)starOneEvent:(UIButton *)sender{
    NSLog(@"ONE");
    [_starOne setBackgroundImage:[UIImage imageNamed:@"1432680096_star.png"] forState:UIControlStateNormal];
    [_starTwo setBackgroundImage:[UIImage imageNamed:@"1432680079_star.png"] forState:UIControlStateNormal];
    [_starThree setBackgroundImage:[UIImage imageNamed:@"1432680079_star.png"] forState:UIControlStateNormal];
    [_starFour setBackgroundImage:[UIImage imageNamed:@"1432680079_star.png" ] forState:UIControlStateNormal];
    [_starFive setBackgroundImage:[UIImage imageNamed:@"1432680079_star.png" ] forState:UIControlStateNormal];
    
    [self quizEaseOut:nil finished:nil context:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
