package com.boidea.framework.core.orm.xibatis.sqlmap.engine.transaction.jdbc;

import java.sql.SQLException;
import java.util.Properties;

import com.boidea.framework.core.orm.xibatis.sqlmap.engine.transaction.BaseTransactionConfig;
import com.boidea.framework.core.orm.xibatis.sqlmap.engine.transaction.Transaction;
import com.boidea.framework.core.orm.xibatis.sqlmap.engine.transaction.TransactionException;

public class JdbcTransactionConfig extends BaseTransactionConfig {

	public Transaction newTransaction(int transactionIsolation) throws SQLException, TransactionException {
		return new JdbcTransaction(dataSource, transactionIsolation);
	}

	public void setProperties(Properties props) throws SQLException, TransactionException {
	}

}
