package com.jwt.dao;

import java.util.List;

import javax.persistence.ParameterMode;

import org.hibernate.SessionFactory;
import org.hibernate.procedure.ProcedureCall;
import org.hibernate.procedure.ProcedureOutputs;
import org.hibernate.result.ResultSetOutput;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jwt.model.AccountBalance;
import com.jwt.model.Cover;
import com.jwt.model.Facility;
import com.jwt.model.FinancialAccount;
import com.jwt.model.Payment;
import com.jwt.model.PaymentAccount;
import com.jwt.model.PaymentEmployee;
import com.jwt.model.PaymentReport;
import com.jwt.model.Payment_type;
import com.jwt.model.PayrollPayment;
import com.jwt.model.drivers;

import javassist.convert.Transformer;
@Repository
public class PayrollVendorDAOImpl implements PayrollVendorDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public FinancialAccount GetPayrollAccount(int fac_id) {
		List<FinancialAccount> accounts =(List<FinancialAccount>)sessionFactory.getCurrentSession().createQuery("from FinancialAccount where facility_id="+fac_id + "and product_sku='PAYROLL' ").list();

		if(accounts.size()>0)
		{
		return accounts.get(0);
		}
		else
		{
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PayrollPayment> getPayrollPayment() {
		  return (List<PayrollPayment>)sessionFactory.getCurrentSession().createQuery("from PayrollPayment v where v.payment_status != 1 or v.payment_status is null order by v.cloud_transid").list();

	}

	@SuppressWarnings("unchecked")
	@Override
	public String submitPayroll(int facility, String user_name, double total, String payments,int collected_by_self,String collected_by) {
		ProcedureCall procedureCall = sessionFactory.getCurrentSession().createStoredProcedureCall("submit_payroll_payment");
		procedureCall.registerParameter("p_facility_id", Integer.class, ParameterMode.IN);
		procedureCall.registerParameter("p_logged_user", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_total_paid_amount", Double.class, ParameterMode.IN);
		procedureCall.registerParameter("p_transactions", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_collect_by_self", Integer.class, ParameterMode.IN);
		procedureCall.registerParameter("p_collected_by", String.class, ParameterMode.IN);

		
		procedureCall.getParameterRegistration("p_facility_id").bindValue(facility);
		procedureCall.getParameterRegistration("p_logged_user").bindValue(user_name);
		procedureCall.getParameterRegistration("p_total_paid_amount").bindValue(total);
		procedureCall.getParameterRegistration("p_transactions").bindValue(payments);
		procedureCall.getParameterRegistration("p_collect_by_self").bindValue(collected_by_self);
		procedureCall.getParameterRegistration("p_collected_by").bindValue(collected_by);

		
		ProcedureOutputs procedureOutputs = procedureCall.getOutputs();
		ResultSetOutput resultSetOutput = (ResultSetOutput) procedureOutputs.getCurrent();
		@SuppressWarnings("rawtypes")
		List results = resultSetOutput.getResultList();
		String result = (String)results.get(0);
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PaymentAccount> get_account_list(int fac_id) {
		// TODO Auto-generated method stub
		return (List<PaymentAccount>)sessionFactory.getCurrentSession().createSQLQuery("select pr.product_name account_name, CAST(pf.total_stock_quantity AS double precision) account_cash , pf.product_id account_id\r\n" + 
				"from facility_product_info pf , products pr \r\n" + 
				"where pr.product_sku=pf.product_id and pf.facility_id="+fac_id+" and \r\n" + 
				"pf.product_id in (select account_id from payment_account where active=1 and facility_id="+fac_id+") order by account_name").setResultTransformer(Transformers.aliasToBean(PaymentAccount.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Facility> get_payment_location() {
		// TODO Auto-generated method stub
		return (List<Facility>)sessionFactory.getCurrentSession().createQuery("from Facility where facility_type_id=1 order by facility_name").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Payment_type> get_payment_type() {
		// TODO Auto-generated method stub
		return (List<Payment_type>)sessionFactory.getCurrentSession().createSQLQuery("select CAST(id AS integer),payment_type from payment_type where active=1").setResultTransformer(Transformers.aliasToBean(Payment_type.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public String Submit_Create_Payment(String agent, String payments,String file_name) {
		// TODO Auto-generated method stub
		ProcedureCall procedureCall = sessionFactory.getCurrentSession().createStoredProcedureCall("create_new_payment");
		procedureCall.registerParameter("p_agent", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_lst_payment", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_file_name", String.class, ParameterMode.IN);

		procedureCall.getParameterRegistration("p_agent").bindValue(agent);
		procedureCall.getParameterRegistration("p_lst_payment").bindValue(payments);
		procedureCall.getParameterRegistration("p_file_name").bindValue(file_name);

		ProcedureOutputs procedureOutputs = procedureCall.getOutputs();
		ResultSetOutput resultSetOutput = (ResultSetOutput) procedureOutputs.getCurrent();
		@SuppressWarnings("rawtypes")
		List results = resultSetOutput.getResultList();
		String result = (String)results.get(0);
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Payment_type> get_types_for_approve() {
		// TODO Auto-generated method stub
		return (List<Payment_type>)sessionFactory.getCurrentSession().createSQLQuery("select CAST(id AS integer) , payment_type from payment_type where approve_active=1").setResultTransformer(Transformers.aliasToBean(Payment_type.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Payment> Get_PAyment_List_To_Approve(int payment_type, int payment_loc, String due_date,
			String cash_account) {
		// TODO Auto-generated method stub
		System.out.println("due_date"+due_date);

			String query="select CAST(pr.cloud_transid AS integer) id , pr.cash_account account, pr.emp_id,pr.emp_name,pr.notes note,pr.payment_refrence payment_name,\r\n" + 
					"									pr.payment_value amount ,to_char(pr.due_date,'yyyy-MM-dd') as due_date,pr.due_date as d1  ,u.display_name,\r\n" + 
					"									fac.facility_name , acc.product_name account_name\r\n" + 
					"									from payroll_payment pr  \r\n" + 
					"									left join sc_users u on u.user_name=pr.created_by\r\n" + 
					"									left join facilities fac on cast(fac.id as text)=pr.payment_location\r\n" + 
					"									left join products acc on acc.product_sku=pr.cash_account and acc.product_category=4\r\n" + 
					"									where (approved_status not in (3,4,5)  or approved_status is null) and \r\n" + 
					"									(payment_status not in (3,4,5) or payment_status is null)";
					if (payment_type!=0)
					{
						query+="and pr.payment_type='"+payment_type+"'";
					}
					if(payment_loc!=0)
					{
						query+="and pr.payment_location ='"+payment_loc+"'";
					}
					if(!due_date.equals("empty"))
					{
						query+="and pr.due_date='"+due_date+"'";
					}
					if(!cash_account.equals("empty"))
					{
						query+="and pr.cash_account='"+cash_account+"'";
					}
					
					query+="order by pr.due_date";
					return (List<Payment>)sessionFactory.getCurrentSession().createSQLQuery(query).setResultTransformer(Transformers.aliasToBean(Payment.class)).list();
	
		
		}

	
	@SuppressWarnings("unchecked")
	@Override
	public String submit_approve_payment(String agent, String lst,int status) {
		// TODO Auto-generated method stub
		ProcedureCall procedureCall = sessionFactory.getCurrentSession().createStoredProcedureCall("approve_payment");
		procedureCall.registerParameter("p_agent", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_lst_payment", String.class, ParameterMode.IN);
		procedureCall.registerParameter("p_status", int.class, ParameterMode.IN);

		procedureCall.getParameterRegistration("p_agent").bindValue(agent);
		procedureCall.getParameterRegistration("p_lst_payment").bindValue(lst);
		procedureCall.getParameterRegistration("p_status").bindValue(status);

		
	
		ProcedureOutputs procedureOutputs = procedureCall.getOutputs();
		ResultSetOutput resultSetOutput = (ResultSetOutput) procedureOutputs.getCurrent();
		@SuppressWarnings("rawtypes")
		List results = resultSetOutput.getResultList();
		String result = (String)results.get(0);
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Payment_type> Get_Payments_types_forpay() {
		// TODO Auto-generated method stub
		return (List<Payment_type>)sessionFactory.getCurrentSession().createSQLQuery("select CAST(id AS integer) , payment_type from payment_type").setResultTransformer(Transformers.aliasToBean(Payment_type.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Payment> Get_PAyment_List_To_Pay(int payment_type, int payment_loc,String emp_id) {
		// TODO Auto-generated method stub
		if(payment_type==3)
		{
		return (List<Payment>)sessionFactory.getCurrentSession().createSQLQuery("select CAST(pr.cloud_transid AS integer) id , pc.product_name account, pr.emp_id,pr.emp_name,pr.notes note,pr.payment_refrence payment_name,\r\n" + 
				"				pr.payment_value amount ,to_char(pr.due_date,'dd/MM/yyyy') as due_date,pr.due_date as d1  ,u.display_name\r\n" + 
				"				from payroll_payment pr \r\n" + 
				"				left join sc_users u on u.user_name=pr.created_by\r\n" + 
				"				left join products pc on pc.product_sku=pr.cash_account\r\n" + 
				"				where approved_status =3  and pr.payment_location ='"+payment_loc+"'  and (payment_status not in (3,4,5) or payment_status is null)\r\n" + 
				"				and CAST(pr.payment_type AS integer) in (select p.mapped_payment_type_id from payment_types p where id = "+payment_type+") and pr.due_date<=current_date order by due_date").setResultTransformer(Transformers.aliasToBean(Payment.class)).list();
		}
		else
		{
			return (List<Payment>)sessionFactory.getCurrentSession().createSQLQuery("select CAST(pr.cloud_transid AS integer) id , pc.product_name account, pr.emp_id,pr.emp_name,pr.notes note,pr.payment_refrence payment_name,\r\n" + 
					"				pr.payment_value amount ,to_char(pr.due_date,'yyyy-MM-dd') as due_date,pr.due_date as d1  ,u.display_name\r\n" + 
					"				from payroll_payment pr \r\n" + 
					"				left join sc_users u on u.user_name=pr.created_by\r\n" + 
					"				left join products pc on pc.product_sku=pr.cash_account\r\n" + 
					"				where approved_status =3  and pr.payment_location ='"+payment_loc+"'  and (payment_status not in (3,4,5) or payment_status is null)\r\n" + 
					"				and CAST(pr.payment_type AS integer) in (select p.mapped_payment_type_id from payment_types p where id = "+payment_type+")\r\n" + 
					"				and pr.emp_id='"+emp_id+"' and pr.due_date<=current_date order by pr.due_date").setResultTransformer(Transformers.aliasToBean(Payment.class)).list();
		
		}
	}

	@Override
	public List<PaymentAccount> get_account_list_pay(int fac_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Payment> Load_payments_for_approve_() {
		// TODO Auto-generated method stub
		return (List<Payment>)sessionFactory.getCurrentSession().createSQLQuery("select CAST(pr.cloud_transid AS integer) id ,CAST(pr.payment_type AS integer), pr.cash_account account, pr.emp_id,pr.emp_name,pr.notes note,pr.payment_refrence payment_name, \r\n" + 
				"								pr.payment_value amount ,to_char(pr.due_date,'yyyy-MM-dd') as due_date,pr.due_date as d1  ,u.display_name , fac.facility_name , acc.product_name account_name \r\n" + 
				"								from payroll_payment pr \r\n" + 
				"								left join sc_users u on u.user_name=pr.created_by\r\n" + 
				"							left join  facilities fac on cast(fac.id as text)=pr.payment_location\r\n" + 
				"							left join products acc on acc.product_sku=pr.cash_account and acc.product_category=4 \r\n" + 
				"\r\n" + 
				"								where (approved_status not in (3,4,5)  or approved_status is null) and (payment_status not in (3,4,5) or payment_status is null) order by pr.due_date").setResultTransformer(Transformers.aliasToBean(Payment.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Payment_type> get_types_for_payment() {
		// TODO Auto-generated method stub
		return (List<Payment_type>)sessionFactory.getCurrentSession().createSQLQuery("select distinct(name) payment_type , CAST(id AS integer) from payment_types where active=1 order by name ").setResultTransformer(Transformers.aliasToBean(Payment_type.class)).list();
	}

	@Override
	public List<Payment> Get_PAyment_List_To_Pay(int payment_type, int payment_loc, String due_date,
			String cash_account, String emp_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PaymentReport> Get_Payment_Summary(int fac_id, String from_date, String to_date) {
		// TODO Auto-generated method stub
		return (List<PaymentReport>)sessionFactory.getCurrentSession().createSQLQuery("select x.cash_account , sum(x.total_amount) total_amount , sum(x.unpaid_amount) unpaid_amount , sum(x.approved_amount) approved_amount , sum(x.paid_amount) paid_amount													\r\n" + 
				"								from (select cash_account , sum(amount) total_amount , payment_location,(case when payment_status is null then sum(amount) when payment_status =1 then sum(amount) else 0 end) as unpaid_amount,(case when payment_status =3 then sum(amount) else 0 end)as paid_amount,(case when  approved_status =3 then sum(amount) else 0 end)as approved_amount \r\n" + 
				"								from  payment_summary ps \r\n" + 
				"								where ps.payment_location='"+fac_id+"' and ps.due_date>='"+from_date+"' and ps.due_date<='"+to_date+"'  \r\n" + 
				"								group by payment_location,payment_status,approved_status,cash_account) x\r\n" + 
				"								group by  x.cash_account ").setResultTransformer(Transformers.aliasToBean(PaymentReport.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PaymentReport> Get_PaymentReportDetails(int fac_id, String from_date, String to_date) {
		// TODO Auto-generated method stub
		return (List<PaymentReport>)sessionFactory.getCurrentSession().createSQLQuery("select to_char(x.due_date,'dd/MM/yyyy') due_date,x.cash_account , sum(x.total_amount) total_amount , sum(x.unpaid_amount) unpaid_amount , sum(x.approved_amount) approved_amount , sum(x.paid_amount) paid_amount														\r\n" + 
				"				from (select due_date,cash_account , sum(amount) total_amount , payment_location,(case when payment_status is null then sum(amount) when payment_status =1 then sum(amount) else 0 end) as unpaid_amount,(case when payment_status =3 then sum(amount) else 0 end)as paid_amount,(case when  approved_status =3 then sum(amount) else 0 end)as approved_amount\r\n" + 
				"				from  payment_summary ps\r\n" + 
				"				where ps.payment_location='"+fac_id+"' and ps.due_date>='"+from_date+"' and ps.due_date<='"+to_date+"'  \r\n" + 
				"				group by due_date,payment_location,payment_status,approved_status,cash_account) x\r\n" + 
				"				group by x.due_date , x.cash_account order by due_date").setResultTransformer(Transformers.aliasToBean(PaymentReport.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PaymentReport> Get_PaymentTotalsOnDate(int fac_id, String from_date) {
		// TODO Auto-generated method stub
		return (List<PaymentReport>)sessionFactory.getCurrentSession().createSQLQuery("select to_char(x.due_date,'dd/MM/yyyy') due_date,x.cash_account , sum(x.total_amount) total_amount , sum(x.unpaid_amount) unpaid_amount , sum(x.approved_amount) approved_amount , sum(x.paid_amount) paid_amount														 \r\n" + 
				"				from (select due_date,pr.product_name cash_account , sum(amount) total_amount , payment_location,(case when payment_status is null then sum(amount) when payment_status =1 then sum(amount) else 0 end) as unpaid_amount,(case when payment_status =3 then sum(amount) else 0 end)as paid_amount,(case when approved_status =3 then sum(amount) else 0 end)as approved_amount \r\n" + 
				"				from  payment_summary ps\r\n" + 
				"				left join products pr on product_sku=ps.cash_account\r\n" + 
				"				where ps.payment_location='"+fac_id+"' and ps.due_date='"+from_date+"' \r\n" + 
				"				group by due_date,payment_location,payment_status,approved_status,pr.product_name) x\r\n" + 
				"				group by x.due_date , x.cash_account order by x.cash_account").setResultTransformer(Transformers.aliasToBean(PaymentReport.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PaymentReport> GetPaymentDetailsOnDate(int fac_id, String date) {
		// TODO Auto-generated method stub
		return (List<PaymentReport>)sessionFactory.getCurrentSession().createSQLQuery("select pp.payment_refrence payment_name ,pr.product_name cash_account, pt.payment_type , concat(pp.emp_name,',',pp.emp_id) emp_name , pp.payment_value total_amount,\r\n" + 
				"(case when st1.name is null then 'Pending' else st1.name end)approved,(case when st2.name is null then 'pending' else st2.name end ) paid , to_char(pp.payment_date_time,'dd/MM/yyyy') payment_date \r\n" + 
				"from payroll_payment pp \r\n" + 
				"left join payment_type pt on CAST(pt.id AS TEXT)=pp.payment_type\r\n" + 
				"left join payment_status st1 on st1.id=pp.approved_status\r\n" + 
				"left join payment_status st2 on st2.id=pp.payment_status\r\n" + 
				"left join products pr on pr.product_sku=pp.cash_account\r\n" + 
				"where pp.payment_location='"+fac_id+"' and pp.due_date='"+date+"' order by pp.cloud_transid desc").setResultTransformer(Transformers.aliasToBean(PaymentReport.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<drivers> Get_Drivers_For_Payments() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from drivers v where v.user_group in (1,3,2) ORDER BY v.full_name_en")
				.list();	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PaymentEmployee> GetEmployees() {
		// TODO Auto-generated method stub
		return (List<PaymentEmployee>)sessionFactory.getCurrentSession().createSQLQuery("select distinct(emp_id) user_name , emp_name full_name_en from payroll_payment \r\n" + 
				"where emp_id notnull\r\n" + 
				"group by emp_name, emp_id\r\n" + 
				"order by emp_name ").setResultTransformer(Transformers.aliasToBean(PaymentEmployee.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Payment> Get_Payment_List_First_Load(int payment_loc,int payment_type) {
		// TODO Auto-generated method stub
		return (List<Payment>)sessionFactory.getCurrentSession().createSQLQuery("  select\r\n" + 
				"        CAST(pr.cloud_transid AS integer) id ,\r\n" + 
				"        pc.product_name account,\r\n" + 
				"        pr.emp_id,\r\n" + 
				"        pr.emp_name,\r\n" + 
				"        pr.notes note,\r\n" + 
				"        pr.payment_refrence payment_name,\r\n" + 
				"        pr.payment_value amount ,\r\n" + 
				"        to_char(pr.due_date,\r\n" + 
				"        'dd/MM/yyyy') as due_date,\r\n" + 
				"        pr.due_date as d1  ,\r\n" + 
				"        u.display_name  , CAST(p.id AS integer) payment_type   \r\n" + 
				"    from\r\n" + 
				"        payroll_payment pr       \r\n" + 
				"    left join\r\n" + 
				"        sc_users u \r\n" + 
				"            on u.user_name=pr.created_by      \r\n" + 
				"    left join\r\n" + 
				"        products pc \r\n" + 
				"            on pc.product_sku=pr.cash_account  left join payment_types p on p.mapped_payment_type_id=CAST(pr.payment_type AS integer)   \r\n" + 
				"    where\r\n" + 
				"        approved_status =3  \r\n" + 
				"        and pr.payment_location ='"+payment_loc+"'  \r\n" + 
				"        and (\r\n" + 
				"            payment_status!=3 \r\n" + 
				"            or payment_status is null\r\n" + 
				"        )      \r\n" + 
				"        and CAST(pr.payment_type AS integer) in (\r\n" + 
				"            select\r\n" + 
				"                p.mapped_payment_type_id \r\n" + 
				"            from\r\n" + 
				"                payment_types p \r\n" + 
				"            where\r\n" + 
				"                id  ="+payment_type+" \r\n" + 
				"        )      \r\n" + 
				"         \r\n" + 
				"        and pr.due_date<=current_date \r\n" + 
				"    order by\r\n" + 
				"        pr.cloud_transid").setResultTransformer(Transformers.aliasToBean(Payment.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<AccountBalance> get_account_balance(int facility_id,String from_date,String to_date) {
		// TODO Auto-generated method stub
		return (List<AccountBalance>)sessionFactory.getCurrentSession().createSQLQuery("select pr.product_name account_name,pr.product_sku as account_id , cast((case when fc.total_stock_quantity is null then 0 else fc.total_stock_quantity end) as double precision ) as balance\r\n" + 
				"from products pr\r\n" + 
				"left join facility_product_info fc on fc.product_id=pr.product_sku and fc.facility_id="+facility_id+"\r\n" + 
				"where pr.product_category=4 and pr.product_sku in (select distinct(cash_account) from payment_summary where due_date>='"+from_date+"' and due_date<='"+to_date+"' and payment_location='"+facility_id+"')").setResultTransformer(Transformers.aliasToBean(AccountBalance.class)).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PaymentReport> GetAllTotals(int fac_id, String from_date, String to_date) {
		// TODO Auto-generated method stub
		return (List<PaymentReport>)sessionFactory.getCurrentSession().createSQLQuery("select  sum(x.total_amount) total_amount , sum(x.unpaid_amount) unpaid_amount , sum(x.approved_amount) approved_amount , sum(x.paid_amount) paid_amount													\r\n" + 
				"												from (select  sum(amount) total_amount , payment_location,(case when payment_status is null then sum(amount) when payment_status =1 then sum(amount) else 0 end) as unpaid_amount,(case when payment_status =3 then sum(amount) else 0 end)as paid_amount,(case when  approved_status =3 then sum(amount) else 0 end)as approved_amount  \r\n" + 
				"												from  payment_summary ps \r\n" + 
				"												where ps.payment_location='"+fac_id+"' and ps.due_date>='"+from_date+"' and ps.due_date<='"+to_date+"'  \r\n" + 
				"												group by payment_location,payment_status,approved_status) x").setResultTransformer(Transformers.aliasToBean(PaymentReport.class)).list();
	}
	

	
}
