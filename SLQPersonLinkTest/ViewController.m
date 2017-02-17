//
//  ViewController.m
//  SLQPersonLinkTest
//
//  Created by MrSong on 16/12/19.
//  Copyright © 2016年 song. All rights reserved.
//

#import "ViewController.h"
#import "SLQButton.h"
#import "CLImageEditor.h"


#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()
<UIActionSheetDelegate,
CLImageEditorDelegate
>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    SLQButton<UIButtonSettingProtocal> *but = [[SLQButton<UIButtonSettingProtocal> alloc] initWithFrame:CGRectMake(ScreenWidth/4, 100, ScreenWidth/2, ScreenWidth/4)];
    but.Title(@"点我啊",UIControlStateNormal).TitleColor([UIColor redColor],UIControlStateNormal).EventBlock(self,@selector(butClick),UIControlEventTouchUpInside).BackgroundColor([UIColor greenColor]);
    [self.view addSubview:but];
    
//    SLQButton *but2 = [SLQButton makeButton:^(SLQButton<UIButtonInitProtocal> *button) {
//        button.Init(CGRectMake(50,200, 100, 50)).NormalTitle(@"哈哈哈").NormalTitleColor([UIColor redColor]);
//    }];
//    [self.view addSubview:but2];
}


- (void)butClick {
    NSLog(@"hahaha");
    // 弹出选择头像界面
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"更换头像" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"从手机照片库选择",@"拍照", nil];
    [sheet showInView:self.view];
}

#pragma mark - 弹出编辑图片视图

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case  0: // 打开相册
        {
            UIImagePickerController *pickerVC = [[UIImagePickerController alloc] init];
            
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
                pickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//                pickerVC.allowsEditing = YES;
                pickerVC.delegate = self;
                [self presentViewController:pickerVC animated:YES completion:nil];
            }
        }
            break;
        case  1: // 打开摄像机
        {
            UIImagePickerController *pickerVC = [[UIImagePickerController alloc] init];
            
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                pickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
                pickerVC.allowsEditing = YES;
                pickerVC.delegate = self;
                [self presentViewController:pickerVC animated:YES completion:nil];
            }
        }
            break;
        case  2:
        {
            NSLog(@"2");
        }
            break;
        default:
            break;
    }
}
#pragma mark - UIImagePickerControllerDelegate
/// 拍照相关
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    UIImage *photo = info[UIImagePickerControllerOriginalImage];

    if(photo) {
        
        CLImageEditor *editor = [[CLImageEditor alloc] initWithImage:photo delegate:self];
        
         [picker pushViewController:editor animated:YES];
    }
//    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}


- (void)imageEditor:(CLImageEditor *)editor didFinishEdittingWithImage:(UIImage *)image {
//    _imageView.image = image;
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    [editor dismissViewControllerAnimated:YES completion:nil];
}
// 监听保存完成，必须实现这个方法
- (void)image: (UIImage *) image didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo
{
    NSLog(@"图片保存成功");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
