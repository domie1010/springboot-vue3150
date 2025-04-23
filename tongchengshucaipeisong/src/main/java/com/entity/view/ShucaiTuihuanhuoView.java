package com.entity.view;

import com.baomidou.mybatisplus.annotations.TableName;
import com.entity.ShucaiTuihuanhuoEntity;
import org.apache.commons.beanutils.BeanUtils;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;

/**
 * 蔬菜退换货
 * 后端返回视图实体辅助类
 * （通常后端关联的表或者自定义的字段需要返回使用）
 */
@TableName("shucai_tuihuanhuo")
public class ShucaiTuihuanhuoView extends ShucaiTuihuanhuoEntity implements Serializable {
    private static final long serialVersionUID = 1L;

		/**
		* 退换货的值
		*/
		private String tuihuanhuoValue;
		/**
		* 审核状态的值
		*/
		private String shucaiTuihuanhuoYesnoValue;
		/**
		* 快递状态的值
		*/
		private String kuaidiValue;



		//级联表 shucai_order
			/**
			* 订单号
			*/
			private String shucaiOrderUuidNumber;
			/**
			* 蔬菜订单 的 用户
			*/
			private Integer shucaiOrderYonghuId;
			/**
			* 购买数量
			*/
			private Integer buyNumber;
			/**
			* 实付价格
			*/
			private Double shucaiOrderTruePrice;
			/**
			* 快递公司
			*/
			private String shucaiOrderCourierName;
			/**
			* 订单快递单号
			*/
			private String shucaiOrderCourierNumber;
			/**
			* 订单类型
			*/
			private Integer shucaiOrderTypes;
				/**
				* 订单类型的值
				*/
				private String shucaiOrderValue;
			/**
			* 支付类型
			*/
			private Integer shucaiOrderPaymentTypes;
				/**
				* 支付类型的值
				*/
				private String shucaiOrderPaymentValue;

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

	public ShucaiTuihuanhuoView() {

	}

	public ShucaiTuihuanhuoView(ShucaiTuihuanhuoEntity shucaiTuihuanhuoEntity) {
		try {
			BeanUtils.copyProperties(this, shucaiTuihuanhuoEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}



			/**
			* 获取： 退换货的值
			*/
			public String getTuihuanhuoValue() {
				return tuihuanhuoValue;
			}
			/**
			* 设置： 退换货的值
			*/
			public void setTuihuanhuoValue(String tuihuanhuoValue) {
				this.tuihuanhuoValue = tuihuanhuoValue;
			}
			/**
			* 获取： 审核状态的值
			*/
			public String getShucaiTuihuanhuoYesnoValue() {
				return shucaiTuihuanhuoYesnoValue;
			}
			/**
			* 设置： 审核状态的值
			*/
			public void setShucaiTuihuanhuoYesnoValue(String shucaiTuihuanhuoYesnoValue) {
				this.shucaiTuihuanhuoYesnoValue = shucaiTuihuanhuoYesnoValue;
			}
			/**
			* 获取： 快递状态的值
			*/
			public String getKuaidiValue() {
				return kuaidiValue;
			}
			/**
			* 设置： 快递状态的值
			*/
			public void setKuaidiValue(String kuaidiValue) {
				this.kuaidiValue = kuaidiValue;
			}

























				//级联表的get和set shucai_order

					/**
					* 获取： 订单号
					*/
					public String getShucaiOrderUuidNumber() {
						return shucaiOrderUuidNumber;
					}
					/**
					* 设置： 订单号
					*/
					public void setShucaiOrderUuidNumber(String shucaiOrderUuidNumber) {
						this.shucaiOrderUuidNumber = shucaiOrderUuidNumber;
					}



					/**
					* 获取：蔬菜订单 的 用户
					*/
					public Integer getShucaiOrderYonghuId() {
						return shucaiOrderYonghuId;
					}
					/**
					* 设置：蔬菜订单 的 用户
					*/
					public void setShucaiOrderYonghuId(Integer shucaiOrderYonghuId) {
						this.shucaiOrderYonghuId = shucaiOrderYonghuId;
					}


					/**
					* 获取： 购买数量
					*/
					public Integer getBuyNumber() {
						return buyNumber;
					}
					/**
					* 设置： 购买数量
					*/
					public void setBuyNumber(Integer buyNumber) {
						this.buyNumber = buyNumber;
					}

					/**
					* 获取： 实付价格
					*/
					public Double getShucaiOrderTruePrice() {
						return shucaiOrderTruePrice;
					}
					/**
					* 设置： 实付价格
					*/
					public void setShucaiOrderTruePrice(Double shucaiOrderTruePrice) {
						this.shucaiOrderTruePrice = shucaiOrderTruePrice;
					}

					/**
					* 获取： 快递公司
					*/
					public String getShucaiOrderCourierName() {
						return shucaiOrderCourierName;
					}
					/**
					* 设置： 快递公司
					*/
					public void setShucaiOrderCourierName(String shucaiOrderCourierName) {
						this.shucaiOrderCourierName = shucaiOrderCourierName;
					}

					/**
					* 获取： 订单快递单号
					*/
					public String getShucaiOrderCourierNumber() {
						return shucaiOrderCourierNumber;
					}
					/**
					* 设置： 订单快递单号
					*/
					public void setShucaiOrderCourierNumber(String shucaiOrderCourierNumber) {
						this.shucaiOrderCourierNumber = shucaiOrderCourierNumber;
					}

					/**
					* 获取： 订单类型
					*/
					public Integer getShucaiOrderTypes() {
						return shucaiOrderTypes;
					}
					/**
					* 设置： 订单类型
					*/
					public void setShucaiOrderTypes(Integer shucaiOrderTypes) {
						this.shucaiOrderTypes = shucaiOrderTypes;
					}


						/**
						* 获取： 订单类型的值
						*/
						public String getShucaiOrderValue() {
							return shucaiOrderValue;
						}
						/**
						* 设置： 订单类型的值
						*/
						public void setShucaiOrderValue(String shucaiOrderValue) {
							this.shucaiOrderValue = shucaiOrderValue;
						}

					/**
					* 获取： 支付类型
					*/
					public Integer getShucaiOrderPaymentTypes() {
						return shucaiOrderPaymentTypes;
					}
					/**
					* 设置： 支付类型
					*/
					public void setShucaiOrderPaymentTypes(Integer shucaiOrderPaymentTypes) {
						this.shucaiOrderPaymentTypes = shucaiOrderPaymentTypes;
					}


						/**
						* 获取： 支付类型的值
						*/
						public String getShucaiOrderPaymentValue() {
							return shucaiOrderPaymentValue;
						}
						/**
						* 设置： 支付类型的值
						*/
						public void setShucaiOrderPaymentValue(String shucaiOrderPaymentValue) {
							this.shucaiOrderPaymentValue = shucaiOrderPaymentValue;
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
