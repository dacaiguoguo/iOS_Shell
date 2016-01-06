#js native 相互调用规则

##js调用native方法

1. 方法名通过接口实现映射关系，对应iOS或者安卓的真实的方法名，内置一份，以后可通过接口更新
2. 是否需要返回值，以json中 needReturnValue 判断
3. 返回值类型由json中 returnType 指定 string | array | dictionary
native返回值统一以json返回。字符串或者字典或者数组
4. 响应状态 status "0" 为正常响应了方法， 非0为异常

a:返回字符串
```json
{
"status": "0", 
"returnValue": "something"
}
```
b:返回字典
```json
{
"returnValue": {
"bo": "place",
"poo": "beijing"
},
"status":"0"
}
```
c:返回数组
```json
{
"returnValue": [
"a",
"b",
"c"
],
"status":"0"
}
```

不需要返回值的例子：
跳转门票详情页面的json
```json
{
"parameter": {
"className": "placeDetail", 
"productId": "2342343"
}, 
"methodName": "goPage", 
"needReturnValue": "0"
}
```
不需要返回值的例子：
刷新webview的json
```json
{
"parameter": {
}, 
"methodName": "refreshWebView", 
"needReturnValue": "0"
}
```
需要返回值为字典的例子：
{
"parameter": {
}, 
"methodName": "refreshWebView", 
"needReturnValue": "1",
"returnType":"dictionary"
}


##native调用js方法

1. native 通过发json给js，来实现调用js方法returnType 为native需要js返回的数据类型
2. 方法名通过接口实现映射关系，对应iOS或者安卓的真实的方法名，内置一份，如需
更新需升级客户端版本
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

