package com.mgw.interceptors.apim;

import com.mgw.interceptors.apim.util.LoggerUtil;
import org.ballerinalang.jvm.scheduling.Scheduler;
import org.ballerinalang.jvm.scheduling.Strand;
import org.ballerinalang.jvm.values.MapValue;
import org.wso2.micro.gateway.interceptor.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class SimpleLogInterceptor implements Interceptor {
    private static final Logger logger = LoggerFactory.getLogger("ballerina");

    public boolean interceptRequest(Caller caller, Request request) {
        LoggerUtil.logRequest(request);
        return true;
    }

    public boolean interceptResponse(Caller caller, Response response) {

        LoggerUtil.logRespose(response);
        return true;
    }
}
