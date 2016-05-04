package com.boidea.framework.core.orm.xibatis.sqlmap.engine.mapping.sql.raw;

import com.boidea.framework.core.orm.xibatis.sqlmap.engine.mapping.parameter.ParameterMap;
import com.boidea.framework.core.orm.xibatis.sqlmap.engine.mapping.result.ResultMap;
import com.boidea.framework.core.orm.xibatis.sqlmap.engine.mapping.sql.Sql;
import com.boidea.framework.core.orm.xibatis.sqlmap.engine.scope.StatementScope;

/**
 * A non-executable SQL container simply for communicating raw SQL around the
 * framework.
 */
public class RawSql implements Sql {

	private String sql;

	public RawSql(String sql) {
		this.sql = sql;
	}

	public String getSql(StatementScope statementScope, Object parameterObject) {
		return sql;
	}

	public ParameterMap getParameterMap(StatementScope statementScope, Object parameterObject) {
		throw new RuntimeException("Method not implemented on RawSql.");
	}

	public ResultMap getResultMap(StatementScope statementScope, Object parameterObject) {
		throw new RuntimeException("Method not implemented on RawSql.");
	}

	public void cleanup(StatementScope statementScope) {
		throw new RuntimeException("Method not implemented on RawSql.");
	}
}
