package com.boidea.framework.codegen;

public interface DatabaseAdaptor {

	MoleContext fromDb(MoleContext context);

	void toTarget(MoleContext context);
}
