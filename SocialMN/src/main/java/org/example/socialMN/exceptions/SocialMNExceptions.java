package org.example.socialMN.exceptions;

import sun.security.timestamp.TSRequest;

public class SocialMNExceptions extends Exception{

    String errMsg;

    Throwable throwable;


    public SocialMNExceptions(Throwable errMsg) {
        super(errMsg);
        this.throwable = errMsg;
    }
}
