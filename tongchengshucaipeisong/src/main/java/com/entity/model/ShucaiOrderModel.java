package com.entity.model;

import com.entity.ShucaiOrderEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serializable;


/**
 * 蔬菜订单
 * 接收传参的实体类
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了）
 * 取自ModelAndView 的model名称
 */
public class ShucaiOrderModel implements Serializable {
    private static final long serialVersionUID = 1L;




    /**
     * 主键
     */
    private Integer id;


    /**
     * 订单号
     */
    private String shucaiOrderUuidNumber;


    /**
     * 收货地址
     */
    private Integer addressId;


    /**
     * 蔬菜
     */
    private Integer shucaiId;


    /**
     * 用户
     */
    private Integer yonghuId;


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
     * 支付类型
     */
    private Integer shucaiOrderPaymentTypes;


    /**
     * 订单创建时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    private Date insertTime;


    /**
     * 创建时间 show3
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    private Date createTime;


    /**
	 * 获取：主键
	 */
    public Integer getId() {
        return id;
    }


    /**
	 * 设置：主键
	 */
    public void setId(Integer id) {
        this.id = id;
    }
    /**
	 * 获取：订单号
	 */
    public String getShucaiOrderUuidNumber() {
        return shucaiOrderUuidNumber;
    }


    /**
	 * 设置：订单号
	 */
    public void setShucaiOrderUuidNumber(String shucaiOrderUuidNumber) {
        this.shucaiOrderUuidNumber = shucaiOrderUuidNumber;
    }
    /**
	 * 获取：收货地址
	 */
    public Integer getAddressId() {
        return addressId;
    }


    /**
	 * 设置：收货地址
	 */
    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }
    /**
	 * 获取：蔬菜
	 */
    public Integer getShucaiId() {
        return shucaiId;
    }


    /**
	 * 设置：蔬菜
	 */
    public void setShucaiId(Integer shucaiId) {
        this.shucaiId = shucaiId;
    }
    /**
	 * 获取：用户
	 */
    public Integer getYonghuId() {
        return yonghuId;
    }


    /**
	 * 设置：用户
	 */
    public void setYonghuId(Integer yonghuId) {
        this.yonghuId = yonghuId;
    }
    /**
	 * 获取：购买数量
	 */
    public Integer getBuyNumber() {
        return buyNumber;
    }


    /**
	 * 设置：购买数量
	 */
    public void setBuyNumber(Integer buyNumber) {
        this.buyNumber = buyNumber;
    }
    /**
	 * 获取：实付价格
	 */
    public Double getShucaiOrderTruePrice() {
        return shucaiOrderTruePrice;
    }


    /**
	 * 设置：实付价格
	 */
    public void setShucaiOrderTruePrice(Double shucaiOrderTruePrice) {
        this.shucaiOrderTruePrice = shucaiOrderTruePrice;
    }
    /**
	 * 获取：快递公司
	 */
    public String getShucaiOrderCourierName() {
        return shucaiOrderCourierName;
    }


    /**
	 * 设置：快递公司
	 */
    public void setShucaiOrderCourierName(String shucaiOrderCourierName) {
        this.shucaiOrderCourierName = shucaiOrderCourierName;
    }
    /**
	 * 获取：订单快递单号
	 */
    public String getShucaiOrderCourierNumber() {
        return shucaiOrderCourierNumber;
    }


    /**
	 * 设置：订单快递单号
	 */
    public void setShucaiOrderCourierNumber(String shucaiOrderCourierNumber) {
        this.shucaiOrderCourierNumber = shucaiOrderCourierNumber;
    }
    /**
	 * 获取：订单类型
	 */
    public Integer getShucaiOrderTypes() {
        return shucaiOrderTypes;
    }


    /**
	 * 设置：订单类型
	 */
    public void setShucaiOrderTypes(Integer shucaiOrderTypes) {
        this.shucaiOrderTypes = shucaiOrderTypes;
    }
    /**
	 * 获取：支付类型
	 */
    public Integer getShucaiOrderPaymentTypes() {
        return shucaiOrderPaymentTypes;
    }


    /**
	 * 设置：支付类型
	 */
    public void setShucaiOrderPaymentTypes(Integer shucaiOrderPaymentTypes) {
        this.shucaiOrderPaymentTypes = shucaiOrderPaymentTypes;
    }
    /**
	 * 获取：订单创建时间
	 */
    public Date getInsertTime() {
        return insertTime;
    }


    /**
	 * 设置：订单创建时间
	 */
    public void setInsertTime(Date insertTime) {
        this.insertTime = insertTime;
    }
    /**
	 * 获取：创建时间 show3
	 */
    public Date getCreateTime() {
        return createTime;
    }


    /**
	 * 设置：创建时间 show3
	 */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    }
