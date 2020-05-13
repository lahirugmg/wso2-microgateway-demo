package com.mgw.interceptors.apim.util;

import org.ballerinalang.jvm.values.api.BXML;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.wso2.micro.gateway.interceptor.Entity;
import org.wso2.micro.gateway.interceptor.InterceptorException;
import org.wso2.micro.gateway.interceptor.Request;
import org.wso2.micro.gateway.interceptor.Response;

public class LoggerUtil {
    private static final Logger logger = LoggerFactory.getLogger("ballerina");

    public static void logError(String msg) {
        logger.error(msg);
    }

    public static void logError(String msg, Exception e) {
        logger.error(msg, e);
    }

    public static void logInfo(String msg) {
        logger.info(msg);
    }

    public static void logDebug(String msg) {
        if (logger.isDebugEnabled()) {
            logger.debug(msg);
        }
    }

    public static void logRespose(Response response) {
        logger.info("Content Type : " + response.getContentType());
        for (String headerName : response.getHeaderNames()) {
            logger.info(headerName + " : " + response.getHeader(headerName));
        }
        logger.info("ResolvedRequestedURL : " + response.getResolvedRequestedURI());
        String contentType = response.getHeader("content-type");
        try {
            logPayload(contentType, response);

        } catch (InterceptorException e) {
            logger.error("Error Occurred while reading the Payload information ");
        }
    }

    public static void logRequest(Request request) {
        logger.info("Content Type : " + request.getContentType());
        for (String headerName : request.getHeaderNames()) {
            logger.info(headerName + " : " + request.getHeader(headerName));
        }
        logger.info("Request Path : " + request.getRequestPath());
        logger.info("HTTP Method : " + request.getRequestHttpMethod());

        try {
            String contentType = request.getHeader("content-type");
            logPayload(contentType, request);

        } catch (InterceptorException e) {
            logger.error("Error Occurred while reading the Payload information ");
        }
    }

    private static void logPayload(String contentType, Request request) throws InterceptorException {

        if ("application/json".equals(contentType)) {
            logger.info("Payload : " + request.getJsonPayload());
        } else if ("multipart/mixed".equals(contentType)) {
            logger.info("Payload : " + request.getBodyParts());
        } else if ("text/xml".equals(contentType)) {
            logger.info("Payload : " + request.getXmlPayload());
        } else if ("text/plain".equals(contentType)) {
            logger.info("Payload : " + request.getTextPayload());
        }
    }

    private static void logPayload(String contentType, Response response) throws InterceptorException {

        if ("application/json".equals(contentType)) {
            logger.info("Payload : " + response.getJsonPayload());
        } else if ("multipart/mixed".equals(contentType)) {
            logger.info("Payload : " + response.getBodyParts());
        } else if ("text/xml".equals(contentType)) {
            logger.info("Payload : " + response.getXmlPayload());
        } else if ("text/plain".equals(contentType)) {
            logger.info("Payload : " + response.getTextPayload());
        }
    }
}
