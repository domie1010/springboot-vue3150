package com.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;

/**
 * 蔬菜退换货
 *
 * @author 
 * @email
 */
@TableName("shucai_tuihuanhuo")
public class ShucaiTuihuanhuoEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;


	public ShucaiTuihuanhuoEntity() {

	}

	public ShucaiTuihuanhuoEntity(T t) {
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
     * 退换货编号
     */
    @TableField(value = "shucai_tuihuanhuo_uuid_number")

    private String shucaiTuihuanhuoUuidNumber;


    /**
     * 蔬菜订单
     */
    @TableField(value = "shucai_order_id")

    private Integer shucaiOrderId;


    /**
     * 用户
     */
    @TableField(value = "yonghu_id")

    private Integer yonghuId;


    /**
     * 退换货
     */
    @TableField(value = "tuihuanhuo_types")

    private Integer tuihuanhuoTypes;


    /**
     * 申请时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    @TableField(value = "insert_time",fill = FieldFill.INSERT)

    private Date insertTime;


    /**
     * 申请理由
     */
    @TableField(value = "gonggao_content")

    private String gonggaoContent;


    /**
     * 审核状态
     */
    @TableField(value = "shucai_tuihuanhuo_yesno_types")

    private Integer shucaiTuihuanhuoYesnoTypes;


    /**
     * 审核意见
     */
    @TableField(value = "shucai_tuihuanhuo_yesno_content")

    private String shucaiTuihuanhuoYesnoContent;


    /**
     * 审核时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    @TableField(value = "shenhe_time")

    private Date shenheTime;


    /**
     * 退回快递公司
     */
    @TableField(value = "shucai_tuihuanhuo_courier_name")

    private String shucaiTuihuanhuoCourierName;


    /**
     * 退回快递单号
     */
    @TableField(value = "shucai_tuihuanhuo_courier_number")

    private String shucaiTuihuanhuoCourierNumber;


    /**
     * 快递状态
     */
    @TableField(value = "kuaidi_types")

    private Integer kuaidiTypes;


    /**
     * 换货快递公司
     */
    @TableField(value = "shucai_huanhuo_courier_name")

    private String shucaiHuanhuoCourierName;


    /**
     * 换货快递单号
     */
    @TableField(value = "shucai_huanhuo_courier_number")

    private String shucaiHuanhuoCourierNumber;


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
	 * 设置：退换货编号
	 */
    public String getShucaiTuihuanhuoUuidNumber() {
        return shucaiTuihuanhuoUuidNumber;
    }
    /**
	 * 获取：退换货编号
	 */

    public void setShucaiTuihuanhuoUuidNumber(String shucaiTuihuanhuoUuidNumber) {
        this.shucaiTuihuanhuoUuidNumber = shucaiTuihuanhuoUuidNumber;
    }
    /**
	 * 设置：蔬菜订单
	 */
    public Integer getShucaiOrderId() {
        return shucaiOrderId;
    }
    /**
	 * 获取：蔬菜订单
	 */

    public void setShucaiOrderId(Integer shucaiOrderId) {
        this.shucaiOrderId = shucaiOrderId;
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
	 * 设置：退换货
	 */
    public Integer getTuihuanhuoTypes() {
        return tuihuanhuoTypes;
    }
    /**
	 * 获取：退换货
	 */

    public void setTuihuanhuoTypes(Integer tuihuanhuoTypes) {
        this.tuihuanhuoTypes = tuihuanhuoTypes;
    }
    /**
	 * 设置：申请时间
	 */
    public Date getInsertTime() {
        return insertTime;
    }
    /**
	 * 获取：申请时间
	 */

    public void setInsertTime(Date insertTime) {
        this.insertTime = insertTime;
    }
    /**
	 * 设置：申请理由
	 */
    public String getGonggaoContent() {
        return gonggaoContent;
    }
    /**
	 * 获取：申请理由
	 */

    public void setGonggaoContent(String gonggaoContent) {
        this.gonggaoContent = gonggaoContent;
    }
    /**
	 * 设置：审核状态
	 */
    public Integer getShucaiTuihuanhuoYesnoTypes() {
        return shucaiTuihuanhuoYesnoTypes;
    }
    /**
	 * 获取：审核状态
	 */

    public void setShucaiTuihuanhuoYesnoTypes(Integer shucaiTuihuanhuoYesnoTypes) {
        this.shucaiTuihuanhuoYesnoTypes = shucaiTuihuanhuoYesnoTypes;
    }
    /**
	 * 设置：审核意见
	 */
    public String getShucaiTuihuanhuoYesnoContent() {
        return shucaiTuihuanhuoYesnoContent;
    }
    /**
	 * 获取：审核意见
	 */

    public void setShucaiTuihuanhuoYesnoContent(String shucaiTuihuanhuoYesnoContent) {
        this.shucaiTuihuanhuoYesnoContent = shucaiTuihuanhuoYesnoContent;
    }
    /**
	 * 设置：审核时间
	 */
    public Date getShenheTime() {
        return shenheTime;
    }
    /**
	 * 获取：审核时间
	 */

    public void setShenheTime(Date shenheTime) {
        this.shenheTime = shenheTime;
    }
    /**
	 * 设置：退回快递公司
	 */
    public String getShucaiTuihuanhuoCourierName() {
        return shucaiTuihuanhuoCourierName;
    }
    /**
	 * 获取：退回快递公司
	 */

    public void setShucaiTuihuanhuoCourierName(String shucaiTuihuanhuoCourierName) {
        this.shucaiTuihuanhuoCourierName = shucaiTuihuanhuoCourierName;
    }
    /**
	 * 设置：退回快递单号
	 */
    public String getShucaiTuihuanhuoCourierNumber() {
        return shucaiTuihuanhuoCourierNumber;
    }
    /**
	 * 获取：退回快递单号
	 */

    public void setShucaiTuihuanhuoCourierNumber(String shucaiTuihuanhuoCourierNumber) {
        this.shucaiTuihuanhuoCourierNumber = shucaiTuihuanhuoCourierNumber;
    }
    /**
	 * 设置：快递状态
	 */
    public Integer getKuaidiTypes() {
        return kuaidiTypes;
    }
    /**
	 * 获取：快递状态
	 */

    public void setKuaidiTypes(Integer kuaidiTypes) {
        this.kuaidiTypes = kuaidiTypes;
    }
    /**
	 * 设置：换货快递公司
	 */
    public String getShucaiHuanhuoCourierName() {
        return shucaiHuanhuoCourierName;
    }
    /**
	 * 获取：换货快递公司
	 */

    public void setShucaiHuanhuoCourierName(String shucaiHuanhuoCourierName) {
        this.shucaiHuanhuoCourierName = shucaiHuanhuoCourierName;
    }
    /**
	 * 设置：换货快递单号
	 */
    public String getShucaiHuanhuoCourierNumber() {
        return shucaiHuanhuoCourierNumber;
    }
    /**
	 * 获取：换货快递单号
	 */

    public void setShucaiHuanhuoCourierNumber(String shucaiHuanhuoCourierNumber) {
        this.shucaiHuanhuoCourierNumber = shucaiHuanhuoCourierNumber;
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
        return "ShucaiTuihuanhuo{" +
            "id=" + id +
            ", shucaiTuihuanhuoUuidNumber=" + shucaiTuihuanhuoUuidNumber +
            ", shucaiOrderId=" + shucaiOrderId +
            ", yonghuId=" + yonghuId +
            ", tuihuanhuoTypes=" + tuihuanhuoTypes +
            ", insertTime=" + insertTime +
            ", gonggaoContent=" + gonggaoContent +
            ", shucaiTuihuanhuoYesnoTypes=" + shucaiTuihuanhuoYesnoTypes +
            ", shucaiTuihuanhuoYesnoContent=" + shucaiTuihuanhuoYesnoContent +
            ", shenheTime=" + shenheTime +
            ", shucaiTuihuanhuoCourierName=" + shucaiTuihuanhuoCourierName +
            ", shucaiTuihuanhuoCourierNumber=" + shucaiTuihuanhuoCourierNumber +
            ", kuaidiTypes=" + kuaidiTypes +
            ", shucaiHuanhuoCourierName=" + shucaiHuanhuoCourierName +
            ", shucaiHuanhuoCourierNumber=" + shucaiHuanhuoCourierNumber +
            ", createTime=" + createTime +
        "}";
    }
}
