/**
 * Management Information System Platform
 * CopyRight 2014
 */

package ${packageName}.service;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.model.service.BizService;

/**
 * ${zTable.comment}管理业务接口
 * @author 
 * @since ${todayDate("yyyy-MM-dd")}
 */
public interface ${zTable.className}Service extends BizService{

	/**
	 * 保存${zTable.comment}
	 */
	public Dto save${zTable.className}Item(Dto pDto);

	/**
	 * 删除${zTable.comment}
	 * 
	 * @param pDto
	 */
	public Dto delete${zTable.className}Item(Dto pDto);

	/**
	 * 修改${zTable.comment}
	 * 
	 * @param pDto
	 */
	public Dto update${zTable.className}Item(Dto pDto);
}
