#JS Native 相互调用规则

##JS调用Native方法

1. 方法名和页面名称由H5封装并映射到安卓或者iOS的真实方法和类名
2. 一定需要返回值
3. 返回值类型由json中 returnType 指定一定为  dictionary
4. callback字段为JS调起Native页面后，Native 在触发某一事件的时候调用的JS方法
5. 响应状态 status "1" 为正常响应了方法， 负数为异常
6. 为支持JS可以调起Native的页面，Native需要支持传入json(json中包含所需参数)进行页面跳转

e.g. 跳转门票详情页面的json
```json
{
    "methodName": "goPage", 
    "parameter": {
        "className": "placeDetail", 
        "productId": "2342343"
    }, 
    "callback": "callbackName"
}
```

成功返回数据
```json
{
    "status": "1", 
    "returnValue": {
        "foo": "beijing", 
        "bo": "place"
    }
}
```
调用的方法有返回值但为空
```
{
    "status": "1", 
    "returnValue": {
    }
}
```
返回数据给js的时候生成json有错误
```
{
    "status": "-4", 
    "message": "parse error"
}
```
返回数据给js的时候生成json有异常
```
{
    "status": "-2", 
    "message": "parse exception error"
}
```
调用的方法native 声明为void 
```
{
    "status": "-1", 
    "message": "return type is void"
}
```


##Native调用JS方法

Native 通过发json给js，来实现调用js方法returnType 为native需要js返回的数据类型

1. 把现有的Native调用JS的方法约定好
2. js 通过 responseCallback 把数据返回给native
3. 不需要返回值
4. json 中的value都是字符串
json格式
```json
{
    "methodName": "hadChooseUser", 
    "parameter": {
        "name":"122",
        "tel":"13311110000"
    } 
}
```

iOS 提供的方法
返回 布尔 是否调用成功 如下
```json
{
    "status": "1", 
    "returnValue": {
        "success": true
    }
}
```
1. 隐藏导航条 lvJSHideNativeNavigationBar:
```
{
    "methodName": "hideNativeNavigationBar", 
    "parameter": {
        "animate": "1" //是否动画
    }
}
```
2. 显示导航条 lvJSShowNativeNavigationBar:
```
{
    "methodName": "showNativeNavigationBar", 
    "parameter": {
        "animate": "1" //是否动画
    }
}
```
3. 显示导航条 lvJSRefreshWebView:
```
{
    "methodName": "refreshWebView", 
    "parameter": {
        "animate": "1" //是否动画
    }
}
```
4. 后退一个页面 lvJSBackPage:
```
{
    "methodName": "backPage", 
    "parameter": {
        "animate": "1" //是否动画
    }
}
```
5. 页面跳转 lvJSGoClass:
```
{
    "methodName": "goPage", 
    "parameter": {
        "className": "placeDetail", //类名
        "productId": "2342343"//参数
        .......
    }
}
```
6. 显示分享 lvJSTouchShare:
```
{
    "methodName": "showShare", 
    "parameter": {
    }
}
```
7. 取本地存储信息 lvJSGetUserDefaultWithKey:
```
{
    "methodName": "getDataFromUserDefault", 
    "parameter": {
        "key": "searchHistory", //key
    }
}
```
返回如下
```json
{
    "status": "1", 
    "returnValue": {
        "searchHistory": [
            "北京",
            "上海"
        ]
    }
}
```

8. 显示导航条 lvJSVoiceShow:
```
{
    "methodName": "showVoice", 
    "parameter": {
    }
}
```

9. 打开通讯录 lvJSOpenContacts:
```
{
    "methodName": "openContacts", 
    "parameter": {
    }
}
```

10. 打开扫描二维码 lvJSOpenQRCodeScan:
```json
{
    "methodName": "openQRCodeScan", 
    "parameter": {
    }
}
```
11. 打开文件上传 lvJSFileUpLoad:
```json
{
    "methodName": "openFileUpLoad", 
    "parameter": {
    }
}
```
12. 打开文件下载 lvJSFileDownLoad:
```json
{
    "methodName": "openFileDownLoad", 
    "parameter": {
    }
}
```
13. 数据统计接口 lvJSDataStatistics:
```json
{
    "methodName": "dataStatistics", 
    "parameter": {
    }
}
```
14. 数据统计接口 lvJSGetLocation:
```json
{
    "methodName": "getLocation", 
    "parameter": {
    }
}
```

15. 显示Loading lvJSShowLoading:
```json
{
    "methodName": "showLoading", 
    "parameter": {
    }
}
```

16. 隐藏Loading lvJSHideLoading:
```json
{
    "methodName": "hideLoading", 
    "parameter": {
    }
}
```

17. 对字符串进行MD5，并将值返回 lvJSGetMd5:
```json
{
    "methodName": "getMd5", 
    "parameter": {
        "string":"aaa"//需要md5的字符串
    }
}
```
```
返回如下
```json
{
    "status": "1", 
    "returnValue": {
        "md5": "fdsfjdslf43k4jr43jl5"
    }
}
```
