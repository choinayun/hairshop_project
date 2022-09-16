package com.care.hair.payment.service;

import java.io.IOException;

public interface PaymentService {
	String getToken() throws IOException;
	
	int paymentInfo(String imp_uid, String access_token);
	
	
}
