package com.entity.view;

import com.entity.ShucaiCollectionEntity;
import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
import java.util.Date;

/**
 * 蔬菜收藏
 * 后端返回视图实体辅助类
 * （通常后端关联的表或者自定义的字段需要返回使用）
 */
@TableName("shucai_collection")
public class ShucaiCollectionView extends ShucaiCollectionEntity implements Serializable {
    private static final long serialVersionUID = 1L;

		/**
		* 类型的值
		*/
		private String shucaiCollectionValue;



		//级联表 shucai
			/**
			* 蔬菜名称
			*/
			private String shucaiName;
			/**
			* 蔬菜编号
			*/
			private String shucaiUuidNumber;
			/**
			* 蔬菜照片
			*/
			private String shucaiPhoto;
			/**
			* 蔬菜类型
			*/
			private Integer shucaiTypes;
				/**
				* 蔬菜类型的值
				*/
				private String shucaiValue;
			/**
			* 蔬菜库存
			*/
			private Integer shucaiKucunNumber;
			/**
			* 购买获得积分
			*/
			private Integer shucaiPrice;
			/**
			* 蔬菜原价
			*/
			private Double shucaiOldMoney;
			/**
			* 现价
			*/
			private Double shucaiNewMoney;
			/**
			* 蔬菜热度
			*/
			private Integer shucaiClicknum;
			/**
			* 蔬菜详细介绍
			*/
			private String shucaiContent;
			/**
			* 是否上架
			*/
			private Integer shangxiaTypes;
				/**
				* 是否上架的值
				*/
				private String shangxiaValue;
			/**
			* 逻辑删除
			*/
			private Integer shucaiDelete;

		//级联表 yonghu
			/**
			* 用户姓名
			*/
			private String yonghuName;
			/**
			* 用户手机号
			*/
			private String yonghuPhone;
			/**
			* 用户身份证号
			*/
			private String yonghuIdNumber;
			/**
			* 用户头像
			*/
			private String yonghuPhoto;
			/**
			* 电子邮箱
			*/
			private String yonghuEmail;
			/**
			* 余额
			*/
			private Double newMoney;
			/**
			* 总积分
			*/
			private Double yonghuSumJifen;
			/**
			* 现积分
			*/
			private Double yonghuNewJifen;
			/**
			* 会员等级
			*/
			private Integer huiyuandengjiTypes;
				/**
				* 会员等级的值
				*/
				private String huiyuandengjiValue;

	public ShucaiCollectionView() {

	}

	public ShucaiCollectionView(ShucaiCollectionEntity shucaiCollectionEntity) {
		try {
			BeanUtils.copyProperties(this, shucaiCollectionEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}



			/**
			* 获取： 类型的值
			*/
			public String getShucaiCollectionValue() {
				return shucaiCollectionValue;
			}
			/**
			* 设置： 类型的值
			*/
			public void setShucaiCollectionValue(String shucaiCollectionValue) {
				this.shucaiCollectionValue = shucaiCollectionValue;
			}
















				//级联表的get和set shucai

					/**
					* 获取： 蔬菜名称
					*/
					public String getShucaiName() {
						return shucaiName;
					}
					/**
					* 设置： 蔬菜名称
					*/
					public void setShucaiName(String shucaiName) {
						this.shucaiName = shucaiName;
					}

					/**
					* 获取： 蔬菜编号
					*/
					public String getShucaiUuidNumber() {
						return shucaiUuidNumber;
					}
					/**
					* 设置： 蔬菜编号
					*/
					public void setShucaiUuidNumber(String shucaiUuidNumber) {
						this.shucaiUuidNumber = shucaiUuidNumber;
					}

					/**
					* 获取： 蔬菜照片
					*/
					public String getShucaiPhoto() {
						return shucaiPhoto;
					}
					/**
					* 设置： 蔬菜照片
					*/
					public void setShucaiPhoto(String shucaiPhoto) {
						this.shucaiPhoto = shucaiPhoto;
					}

					/**
					* 获取： 蔬菜类型
					*/
					public Integer getShucaiTypes() {
						return shucaiTypes;
					}
					/**
					* 设置： 蔬菜类型
					*/
					public void setShucaiTypes(Integer shucaiTypes) {
						this.shucaiTypes = shucaiTypes;
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
					* 获取： 蔬菜库存
					*/
					public Integer getShucaiKucunNumber() {
						return shucaiKucunNumber;
					}
					/**
					* 设置： 蔬菜库存
					*/
					public void setShucaiKucunNumber(Integer shucaiKucunNumber) {
						this.shucaiKucunNumber = shucaiKucunNumber;
					}

					/**
					* 获取： 购买获得积分
					*/
					public Integer getShucaiPrice() {
						return shucaiPrice;
					}
					/**
					* 设置： 购买获得积分
					*/
					public void setShucaiPrice(Integer shucaiPrice) {
						this.shucaiPrice = shucaiPrice;
					}

					/**
					* 获取： 蔬菜原价
					*/
					public Double getShucaiOldMoney() {
						return shucaiOldMoney;
					}
					/**
					* 设置： 蔬菜原价
					*/
					public void setShucaiOldMoney(Double shucaiOldMoney) {
						this.shucaiOldMoney = shucaiOldMoney;
					}

					/**
					* 获取： 现价
					*/
					public Double getShucaiNewMoney() {
						return shucaiNewMoney;
					}
					/**
					* 设置： 现价
					*/
					public void setShucaiNewMoney(Double shucaiNewMoney) {
						this.shucaiNewMoney = shucaiNewMoney;
					}

					/**
					* 获取： 蔬菜热度
					*/
					public Integer getShucaiClicknum() {
						return shucaiClicknum;
					}
					/**
					* 设置： 蔬菜热度
					*/
					public void setShucaiClicknum(Integer shucaiClicknum) {
						this.shucaiClicknum = shucaiClicknum;
					}

					/**
					* 获取： 蔬菜详细介绍
					*/
					public String getShucaiContent() {
						return shucaiContent;
					}
					/**
					* 设置： 蔬菜详细介绍
					*/
					public void setShucaiContent(String shucaiContent) {
						this.shucaiContent = shucaiContent;
					}

					/**
					* 获取： 是否上架
					*/
					public Integer getShangxiaTypes() {
						return shangxiaTypes;
					}
					/**
					* 设置： 是否上架
					*/
					public void setShangxiaTypes(Integer shangxiaTypes) {
						this.shangxiaTypes = shangxiaTypes;
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

					/**
					* 获取： 逻辑删除
					*/
					public Integer getShucaiDelete() {
						return shucaiDelete;
					}
					/**
					* 设置： 逻辑删除
					*/
					public void setShucaiDelete(Integer shucaiDelete) {
						this.shucaiDelete = shucaiDelete;
					}
















				//级联表的get和set yonghu

					/**
					* 获取： 用户姓名
					*/
					public String getYonghuName() {
						return yonghuName;
					}
					/**
					* 设置： 用户姓名
					*/
					public void setYonghuName(String yonghuName) {
						this.yonghuName = yonghuName;
					}

					/**
					* 获取： 用户手机号
					*/
					public String getYonghuPhone() {
						return yonghuPhone;
					}
					/**
					* 设置： 用户手机号
					*/
					public void setYonghuPhone(String yonghuPhone) {
						this.yonghuPhone = yonghuPhone;
					}

					/**
					* 获取： 用户身份证号
					*/
					public String getYonghuIdNumber() {
						return yonghuIdNumber;
					}
					/**
					* 设置： 用户身份证号
					*/
					public void setYonghuIdNumber(String yonghuIdNumber) {
						this.yonghuIdNumber = yonghuIdNumber;
					}

					/**
					* 获取： 用户头像
					*/
					public String getYonghuPhoto() {
						return yonghuPhoto;
					}
					/**
					* 设置： 用户头像
					*/
					public void setYonghuPhoto(String yonghuPhoto) {
						this.yonghuPhoto = yonghuPhoto;
					}

					/**
					* 获取： 电子邮箱
					*/
					public String getYonghuEmail() {
						return yonghuEmail;
					}
					/**
					* 设置： 电子邮箱
					*/
					public void setYonghuEmail(String yonghuEmail) {
						this.yonghuEmail = yonghuEmail;
					}

					/**
					* 获取： 余额
					*/
					public Double getNewMoney() {
						return newMoney;
					}
					/**
					* 设置： 余额
					*/
					public void setNewMoney(Double newMoney) {
						this.newMoney = newMoney;
					}

					/**
					* 获取： 总积分
					*/
					public Double getYonghuSumJifen() {
						return yonghuSumJifen;
					}
					/**
					* 设置： 总积分
					*/
					public void setYonghuSumJifen(Double yonghuSumJifen) {
						this.yonghuSumJifen = yonghuSumJifen;
					}

					/**
					* 获取： 现积分
					*/
					public Double getYonghuNewJifen() {
						return yonghuNewJifen;
					}
					/**
					* 设置： 现积分
					*/
					public void setYonghuNewJifen(Double yonghuNewJifen) {
						this.yonghuNewJifen = yonghuNewJifen;
					}

					/**
					* 获取： 会员等级
					*/
					public Integer getHuiyuandengjiTypes() {
						return huiyuandengjiTypes;
					}
					/**
					* 设置： 会员等级
					*/
					public void setHuiyuandengjiTypes(Integer huiyuandengjiTypes) {
						this.huiyuandengjiTypes = huiyuandengjiTypes;
					}


						/**
						* 获取： 会员等级的值
						*/
						public String getHuiyuandengjiValue() {
							return huiyuandengjiValue;
						}
						/**
						* 设置： 会员等级的值
						*/
						public void setHuiyuandengjiValue(String huiyuandengjiValue) {
							this.huiyuandengjiValue = huiyuandengjiValue;
						}









}
