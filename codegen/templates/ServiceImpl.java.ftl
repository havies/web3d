/**
 * Management Information System Platform
 * CopyRight 2014
 */

package ${packageName}.service.impl;

import com.boidea.framework.core.metatype.Dto;
import com.boidea.framework.core.metatype.impl.BaseDto;
import com.boidea.framework.core.model.service.impl.BizServiceImpl;
import com.boidea.framework.core.id.util.IDHelper;

import ${packageName}.service.${zTable.className}Service;

/**
 * ${zTable.comment}数据访问实现
 * 
 * ${zTable.comment}管理业务接口
 * @author 
 * @since ${todayDate("yyyy-MM-dd")}
 */
public class ${zTable.className}ServiceImpl extends BizServiceImpl implements ${zTable.className}Service{

	/**
	 * 保存${zTable.comment}
	 */
	public Dto save${zTable.className}Item(Dto pDto){
		pDto.put("${zTable.pkFieldName}", IDHelper.uuid());
		bfDao.insert("${zTable.className}.save${zTable.className}Item", pDto);
		return null;
	}

	/**
	 * 删除${zTable.comment}
	 * 
	 * @param pDto
	 */
	public Dto delete${zTable.className}Item(Dto pDto){
		Dto dto = new BaseDto();
		String[] arrChecked = pDto.getAsString("strChecked").split(",");
		for(int i = 0; i < arrChecked.length; i++){
			dto.put("${zTable.pkFieldName}", arrChecked[i]);
			bfDao.delete("${zTable.className}.delete${zTable.className}Item", dto);
		}
		return null;
	}

	/**
	 * 修改${zTable.comment}
	 * 
	 * @param pDto
	 */
	public Dto update${zTable.className}Item(Dto pDto){
		bfDao.update("${zTable.className}.update${zTable.className}Item", pDto);
		return null;
	}

}
