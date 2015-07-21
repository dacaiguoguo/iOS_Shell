- (NSString *)getIPAddress {
    Boolean result;
    CFHostRef hostRef;
    CFArrayRef addresses;
    NSString *hostname = @"www.iossuper.com";
    NSString *ipAddress = @"";
    
    hostRef = CFHostCreateWithName(kCFAllocatorDefault, (__bridge CFStringRef)hostname);
    if (hostRef) {
        result = CFHostStartInfoResolution(hostRef, kCFHostAddresses, NULL); // pass an error instead of NULL here to find out why it failed
        if (result == TRUE) {
            addresses = CFHostGetAddressing(hostRef, &result);
        }
    }
    
    if (result == TRUE) {
        CFIndex index = 0;
        CFDataRef ref = (CFDataRef) CFArrayGetValueAtIndex(addresses, index);
        struct sockaddr_in* remoteAddr;
        char *ip_address;
        remoteAddr = (struct sockaddr_in*) CFDataGetBytePtr(ref);
        if (remoteAddr != NULL) {
            ip_address = inet_ntoa(remoteAddr->sin_addr);
        }
        ipAddress = [NSString stringWithCString:ip_address encoding:NSUTF8StringEncoding];
    }
    
    return ipAddress;
}