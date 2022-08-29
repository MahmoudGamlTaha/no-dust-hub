package com.jwt.service;

import java.util.List;

import com.jwt.model.Employee;
import com.jwt.model.ReceiveCashFinancailAccount;

public interface ReceivingCashService {

	public List<Employee> getAllEmployee();
	public List<ReceiveCashFinancailAccount> getAllAccounts();
	public String submitReceiveCash(String financailAcc , String user, double amount ,String employee ,String comment,int fac_id);
}
