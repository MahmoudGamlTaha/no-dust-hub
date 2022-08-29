package com.jwt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jwt.dao.ReceivingCashDAO;
import com.jwt.model.Employee;
import com.jwt.model.ReceiveCashFinancailAccount;

@Service
@Transactional
public class ReceivingCashServiceImp implements ReceivingCashService {


	@Autowired
	private ReceivingCashDAO cashDAO ;
	@Override
	public List<Employee> getAllEmployee() {
		return cashDAO.getAllEmployee();
	}
	@Override
	public List<ReceiveCashFinancailAccount> getAllAccounts() {
		return cashDAO.getAllAccounts();
	}
	@Override
	public String submitReceiveCash(String financailAcc, String user, double amount, String employee ,String comment,int fac_id) {
		return cashDAO.submitReceiveCash(financailAcc, user, amount, employee , comment,fac_id);
	}
	

}
