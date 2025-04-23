package com.entity.view;

import com.entity.ShucaiEntity;
import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
import java.util.Date;

/**
 * 蔬菜
 * 后端返回视图实体辅助类
 * （通常后端关联的表或者自定义的字段需要返回使用）
 */
@TableName("shucai")
public class ShucaiView extends ShucaiEntity implements Serializable {
    private static final long serialVersionUID = 1L;

		/**
		* 蔬菜类型的值
		*/
		private String shucaiValue;
		/**
		* 是否上架的值
		*/
		private String shangxiaValue;



	public ShucaiView() {

	}

	public ShucaiView(ShucaiEntity shucaiEntity) {
		try {
			BeanUtils.copyProperties(this, shucaiEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}



			/**
			* 获取： 蔬菜类型的值
			*/
			public String getShucaiValue() {
				return shucaiValue;
			}
			/**
			* 设置： 蔬菜类型的值
			*/
			public void setShucaiValue(String shucaiValue) {
				this.shucaiValue = shucaiValue;
			}
			/**
			* 获取： 是否上架的值
			*/
			public String getShangxiaValue() {
				return shangxiaValue;
			}
			/**
			* 设置： 是否上架的值
			*/
			public void setShangxiaValue(String shangxiaValue) {
				this.shangxiaValue = shangxiaValue;
			}















}
