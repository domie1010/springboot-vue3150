package com.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;

/**
 * 蔬菜订单
 *
 * @author 
 * @email
 */
@TableName("shucai_order")
public class ShucaiOrderEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;


	public ShucaiOrderEntity() {

	}

	public ShucaiOrderEntity(T t) {
		try {
			BeanUtils.copyProperties(this, t);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    @TableField(value = "id")

    private Integer id;


    /**
     * 订单号
     */
    @TableField(value = "shucai_order_uuid_number")

    private String shucaiOrderUuidNumber;


    /**
     * 收货地址
     */
    @TableField(value = "address_id")

    private Integer addressId;


    /**
     * 蔬菜
     */
    @TableField(value = "shucai_id")

    private Integer shucaiId;


    /**
     * 用户
     */
    @TableField(value = "yonghu_id")

    private Integer yonghuId;


    /**
     * 购买数量
     */
    @TableField(value = "buy_number")

    private Integer buyNumber;


    /**
     * 实付价格
     */
    @TableField(value = "shucai_order_true_price")

    private Double shucaiOrderTruePrice;


    /**
     * 快递公司
     */
    @TableField(value = "shucai_order_courier_name")

    private String shucaiOrderCourierName;


    /**
     * 订单快递单号
     */
    @TableField(value = "shucai_order_courier_number")

    private String shucaiOrderCourierNumber;


    /**
     * 订单类型
     */
    @TableField(value = "shucai_order_types")

    private Integer shucaiOrderTypes;


    /**
     * 支付类型
     */
    @TableField(value = "shucai_order_payment_types")

    private Integer shucaiOrderPaymentTypes;


    /**
     * 订单创建时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    @TableField(value = "insert_time",fill = FieldFill.INSERT)

    private Date insertTime;


    /**
     * 创建时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    @TableField(value = "create_time",fill = FieldFill.INSERT)

    private Date createTime;


    /**
	 * 设置：主键
	 */
    public Integer getId() {
        return id;
    }
    /**
	 * 获取：主键
	 */

    public void setId(Integer id) {
        this.id = id;
    }
    /**
	 * 设置：订单号
	 */
    public String getShucaiOrderUuidNumber() {
        return shucaiOrderUuidNumber;
    }
    /**
	 * 获取：订单号
	 */

    public void setShucaiOrderUuidNumber(String shucaiOrderUuidNumber) {
        this.shucaiOrderUuidNumber = shucaiOrderUuidNumber;
    }
    /**
	 * 设置：收货地址
	 */
    public Integer getAddressId() {
        return addressId;
    }
    /**
	 * 获取：收货地址
	 */

    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }
    /**
	 * 设置：蔬菜
	 */
    public Integer getShucaiId() {
        return shucaiId;
    }
    /**
	 * 获取：蔬菜
	 */

    public void setShucaiId(Integer shucaiId) {
        this.shucaiId = shucaiId;
    }
    /**
	 * 设置：用户
	 */
    public Integer getYonghuId() {
        return yonghuId;
    }
    /**
	 * 获取：用户
	 */

    public void setYonghuId(Integer yonghuId) {
        this.yonghuId = yonghuId;
    }
    /**
	 * 设置：购买数量
	 */
    public Integer getBuyNumber() {
        return buyNumber;
    }
    /**
	 * 获取：购买数量
	 */

    public void setBuyNumber(Integer buyNumber) {
        this.buyNumber = buyNumber;
    }
    /**
	 * 设置：实付价格
	 */
    public Double getShucaiOrderTruePrice() {
        return shucaiOrderTruePrice;
    }
    /**
	 * 获取：实付价格
	 */

    public void setShucaiOrderTruePrice(Double shucaiOrderTruePrice) {
        this.shucaiOrderTruePrice = shucaiOrderTruePrice;
    }
    /**
	 * 设置：快递公司
	 */
    public String getShucaiOrderCourierName() {
        return shucaiOrderCourierName;
    }
    /**
	 * 获取：快递公司
	 */

    public void setShucaiOrderCourierName(String shucaiOrderCourierName) {
        this.shucaiOrderCourierName = shucaiOrderCourierName;
    }
    /**
	 * 设置：订单快递单号
	 */
    public String getShucaiOrderCourierNumber() {
        return shucaiOrderCourierNumber;
    }
    /**
	 * 获取：订单快递单号
	 */

    public void setShucaiOrderCourierNumber(String shucaiOrderCourierNumber) {
        this.shucaiOrderCourierNumber = shucaiOrderCourierNumber;
    }
    /**
	 * 设置：订单类型
	 */
    public Integer getShucaiOrderTypes() {
        return shucaiOrderTypes;
    }
    /**
	 * 获取：订单类型
	 */

    public void setShucaiOrderTypes(Integer shucaiOrderTypes) {
        this.shucaiOrderTypes = shucaiOrderTypes;
    }
    /**
	 * 设置：支付类型
	 */
    public Integer getShucaiOrderPaymentTypes() {
        return shucaiOrderPaymentTypes;
    }
    /**
	 * 获取：支付类型
	 */

    public void setShucaiOrderPaymentTypes(Integer shucaiOrderPaymentTypes) {
        this.shucaiOrderPaymentTypes = shucaiOrderPaymentTypes;
    }
    /**
	 * 设置：订单创建时间
	 */
    public Date getInsertTime() {
        return insertTime;
    }
    /**
	 * 获取：订单创建时间
	 */

    public void setInsertTime(Date insertTime) {
        this.insertTime = insertTime;
    }
    /**
	 * 设置：创建时间
	 */
    public Date getCreateTime() {
        return createTime;
    }
    /**
	 * 获取：创建时间
	 */

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "ShucaiOrder{" +
            "id=" + id +
            ", shucaiOrderUuidNumber=" + shucaiOrderUuidNumber +
            ", addressId=" + addressId +
            ", shucaiId=" + shucaiId +
            ", yonghuId=" + yonghuId +
            ", buyNumber=" + buyNumber +
            ", shucaiOrderTruePrice=" + shucaiOrderTruePrice +
            ", shucaiOrderCourierName=" + shucaiOrderCourierName +
            ", shucaiOrderCourierNumber=" + shucaiOrderCourierNumber +
            ", shucaiOrderTypes=" + shucaiOrderTypes +
            ", shucaiOrderPaymentTypes=" + shucaiOrderPaymentTypes +
            ", insertTime=" + insertTime +
            ", createTime=" + createTime +
        "}";
    }
}
