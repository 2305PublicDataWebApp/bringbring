package com.bringbring.reservation.service;

import java.net.ProtocolException;
import java.util.Map;

public interface PayService {
    String getToken();

    boolean cancelRequest(Map<String, String> request, String token) throws ProtocolException;

    boolean cancelPayInfo(String payId);
}
