# 摆脱TableView的代理方法

## 背景

嗯。。。因为懒，总是写 UITableView 的代理方法真的很烦，尤其是表格界面。

先抛出[代码](https://github.com/LuckyCat7848/LCTableView)。

## 一、使用超简单

想要的就是这个样子的：

```
pod `LCTableView`
```

使用时：

```
self.tableView.lc_dataArray = dataArray;
```

## 二、主要技术

### 2.1 提出问题

`UITableView`常用的几个代理方法真的是写烦了，怎样摆脱这几个代理方法呢？

有的继承`UITableView`，有的在`UITableView`外包装一层，但是偶尔`UIViewController`外部需要重写这几个代理方法，还要把代理方法抛出去，这样就实现很多个`UITableView`的代理方法，然后使用自己的代理抛出去，实在繁琐，也不易扩展。

例如下面这个样子：
    
![](https://github.com/LuckyCat7848/Blogs/blob/master/source/UITableView_origin.png)

都说`Categroy`好，要怎样利用它来更好的实现代理方法的分配呢？

### 2.2 原理

大家都知道报`unrecognized selector`的异常之前，有四次机会拯救崩溃：

> 1. `resolveInstanceMethod:` 或`resolveClassMethod:`允许用户在此时为该 Class 动态添加实现；
> 2. `forwardingTargetForSelector:`尝试找到一个能响应该消息的对象；
> 3. `methodSignatureForSelector:`尝试获得一个方法签名；
> 4. `forwardInvocation:`处理第3步获取到的方法签名包装成的`Invocation`。

以上四步仍然失败，调用doesNotRecognizeSelector: 抛出异常。

其原理就是`objc_msgForward`消息转发过程。

### 2.3 方案

> 摆脱代理方法的`TableView`封装：
1. 在不使用继承，不影响原本功能的影响之外，使用**`Category`**的方式处理数据赋值；
2. 使用**`NSProxy`**进行代理方法的分发，既摆脱繁琐的写代理方法，又在需要的地方不影响使用。

各类之间关系图如下：

![](https://github.com/LuckyCat7848/Blogs/blob/master/source/UITableView_Entire.png)

在这里，也是使用了消息转发原理：

- LCTableViewIMP：实现最常用的几个代理方法；
- UIViewController/UIView：表示想额外实现代理方法的类；
- UITableView+LCAdd：使用扩展灵活性高；
- LCTableViewProxy 的实现：
1. 接收`UITableView+LCAdd`的代理方法；
2. 弱引用`LCTableViewIMP`和`UIViewController/UIView`(或其他额外想实现代理方法的类)两个对象；
3. 实现`respondsToSelector:`判断`LCTableViewIMP`和`UIViewController`对象是否实现了该方法；
4. 实现`methodSignatureForSelector:`获得一个方法签名；
5. 实现`forwardInvocation:`处理把代理方法分配给`LCTableViewIMP`或`UIViewController`，以`UIViewController`优先。

这样，不使用继承、不封装一系列代理方法，仅在`UITableView`原来的使用上额外的`LCTableViewIMP`实现常用代理方法，使`UIViewController`在不实现那几个常用的代理方法下，也可以正常显示，即**摆脱TableView的代理方法**。

### 2.4 使用

使用很简单，Category 里主要提供了 lc_dataArray 用于数据赋值、lc_Delegate 额外使用代理。

```
@property (nonatomic, weak) id<UITableViewDelegate, UITableViewDataSource> lc_Delegate;

@property (nonatomic, strong, readonly) NSMutableArray *lc_dataArray;
```

### 2.5 数据需要遵循协议

有方便必然有规则，代理方法的默认实现必要得到适当的数据，所以这里需要数据遵循一定的协议`LCCellDataProtocol`：

```
@optional
@property (nonatomic, assign) CGFloat cellHeight;
/** 可用于数组多种cell样式,增加类型方便处理逻辑 */
@property (nonatomic, assign) NSInteger identityType;

/** 需提供cell类 */
+ (Class)cellClass;
```

`LCCellDataProtocol`协议规定 cell 的数据（`ViewModel/Model`）提供该信息。

## 三、实现功能

### 3.1 常用数据格式的展示

1. 一个section，多个row；
2. 多个section，一个row；
3. 多个section，多个row。

其中，1和2的区分使用 Category 的 lc_isSectionsStyle 属性区分。

![](https://github.com/LuckyCat7848/Blogs/blob/master/source/UITableView_Styles.png)

### 3.2 支持不同`cell`写法

1. 使用 model 赋值；
2. MVVM 使用 viewModel 赋值；
3. 使用 Xib 的 cell。

且支持多种 cell 的一个数组数据。

![](https://github.com/LuckyCat7848/Blogs/blob/master/source/UITableView_Cells.png)

### 3.3 不同`cell`样式

每个项目都有常用的 3 种 cell 样式：展示/点击、左提示右内容、左提示右输入。考虑不同项目样式区别太大，即便是腾讯的 QMUI 封装的用起来也不方便。所以没有放到 pod 中，作为参考放在 Example 里哈。

这是额外自己封装的一个常用的点击样式 cell 。

![](https://github.com/LuckyCat7848/Blogs/blob/master/source/UITableView_ActionCell.png)
