/**
 * Management Information System Platform
 * CopyRight 2014
 */

package ${packageName}.dao.vo;

import java.sql.Timestamp;

import com.boidea.framework.core.metatype.BaseVo;

/**
 * ${zTable.comment}
 * 
 * @author zhaozh email:zoominet(a)qq.com
 * @since ${todayDate("yyyy-MM-dd")}
 */
public class ${zTable.className}Vo extends BaseVo {

	<#list zTable.fields as zField>
	<#if zField.comment !="">
	/*${zField.comment}*/
	</#if>
	private ${zField.classTypeName} ${zField.fieldName};
	</#list>
	
	/**
	 * 构造函数
	 */
	public ${zTable.className}Vo() {
	}
	
	<#list zTable.fields as zField>
	/**
	 * 设置 ${zField.comment}
	 * @param ${zField.fieldName} ${zField.comment}
	 */
	public void set${zField.fieldNameCap}(${zField.classTypeName} ${zField.fieldName}) {
		this.${zField.fieldName} = ${zField.fieldName};
	}
	/**
	 * 取得 ${zField.comment}
	 * @return ${zField.fieldNameCap}
	 */
	public ${zField.classTypeName} get${zField.fieldNameCap}() {
		return this.${zField.fieldName};
	}
	</#list>
}
