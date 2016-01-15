#JS Native 相互调用规则

##JS调用Native方法

1. 方法名通过接口实现映射关系，对应iOS或者安卓的真实的方法名，内置一份，以后可通过接口更新
2. 一定需要返回值
3. 返回值类型由json中 returnType 指定一定为  dictionary
4. callback字段为JS调起Native页面后，Native 在触发某一事件的时候调用的JS方法
5. 响应状态 status "1" 为正常响应了方法， 负数为异常
6. 为支持JS可以调起Native的页面，Native需要支持传人json(json中包含所需参数)进行页面跳转
7. 
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
    "status": "1", 
    "message": "return type is void"
}
```


##native调用js方法

1. native 通过发json给js，来实现调用js方法returnType 为native需要js返回的数据类型
2. 方法名通过接口实现映射关系，对应iOS或者安卓的真实的方法名，内置一份，如需
更新需升级客户端版本
3. 把现有的Native调用JS的方法约定好
4. 
3. js 通过 responseCallback 把数据返回给native。 json格式

```json
{
"parameter": {
}, 
"methodName": "shareData", 
"needReturnValue": "1",
"returnType":"dictionary"
}
```

a:返回字符串
```json
{
"returnValue": "something"
}
```
b:返回字典
```json
{
"returnValue": {
"bo": "place",
"poo": "beijing"
}
```
c:返回数组
```json
{
"returnValue": [
"a",
"b",
"c"
]
}
```

对应关系应该放在h5那边，由h5封装并映射到安卓或者iOS的真实方法
