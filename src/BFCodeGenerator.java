

import com.boidea.framework.codegen.DatabaseAdaptor;
import com.boidea.framework.codegen.MoleContext;
import com.boidea.framework.codegen.impl.GenerallyDatabaseAdaptor;
import com.boidea.framework.codegen.impl.Init;

public class BFCodeGenerator {

	public static void main(String[] args) throws Throwable {
		// 加载配置,检验配置
		MoleContext context = new MoleContext();
		// 初始化项目结构
		new Init().init(context.getConfig());
		String output = context.getConfig().getProject().get("output", "codegen/output/");
		// 获取数据库表结构,构建DTable
		DatabaseAdaptor adaptor = new GenerallyDatabaseAdaptor();
		context = adaptor.fromDb(context);
		if(context!=null)
		{
		//System.out.println(Json.toJson(context));
			adaptor.toTarget(context);
			System.out.println("代码生成在目录："+output+"，请按照说明文档进行拷贝合并。");
		}else
		{
			System.out.println("请检查数据库连接或者数据库是否有表");
		}
	}

}
