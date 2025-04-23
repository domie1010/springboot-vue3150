package com.entity.vo;

import com.entity.ShucaiEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;

/**
 * 蔬菜
 * 手机端接口返回实体辅助类
 * （主要作用去除一些不必要的字段）
 */
@TableName("shucai")
public class ShucaiVO implements Serializable {
    private static final long serialVersionUID = 1L;


    /**
     * 主键
     */

    @TableField(value = "id")
    private Integer id;


    /**
     * 蔬菜名称
     */

    @TableField(value = "shucai_name")
    private String shucaiName;


    /**
     * 蔬菜编号
     */

    @TableField(value = "shucai_uuid_number")
    private String shucaiUuidNumber;


    /**
     * 蔬菜照片
     */

    @TableField(value = "shucai_photo")
    private String shucaiPhoto;


    /**
     * 蔬菜类型
     */

    @TableField(value = "shucai_types")
    private Integer shucaiTypes;


    /**
     * 蔬菜库存
     */

    @TableField(value = "shucai_kucun_number")
    private Integer shucaiKucunNumber;


    /**
     * 购买获得积分
     */

    @TableField(value = "shucai_price")
    private Integer shucaiPrice;


    /**
     * 蔬菜原价
     */

    @TableField(value = "shucai_old_money")
    private Double shucaiOldMoney;


    /**
     * 现价
     */

    @TableField(value = "shucai_new_money")
    private Double shucaiNewMoney;


    /**
     * 蔬菜热度
     */

    @TableField(value = "shucai_clicknum")
    private Integer shucaiClicknum;


    /**
     * 蔬菜详细介绍
     */

    @TableField(value = "shucai_content")
    private String shucaiContent;


    /**
     * 是否上架
     */

    @TableField(value = "shangxia_types")
    private Integer shangxiaTypes;


    /**
     * 逻辑删除
     */

    @TableField(value = "shucai_delete")
    private Integer shucaiDelete;


    /**
     * 创建时间  show1 show2 photoShow
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat

    @TableField(value = "create_time")
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
	 * 设置：蔬菜名称
	 */
    public String getShucaiName() {
        return shucaiName;
    }


    /**
	 * 获取：蔬菜名称
	 */

    public void setShucaiName(String shucaiName) {
        this.shucaiName = shucaiName;
    }
    /**
	 * 设置：蔬菜编号
	 */
    public String getShucaiUuidNumber() {
        return shucaiUuidNumber;
    }


    /**
	 * 获取：蔬菜编号
	 */

    public void setShucaiUuidNumber(String shucaiUuidNumber) {
        this.shucaiUuidNumber = shucaiUuidNumber;
    }
    /**
	 * 设置：蔬菜照片
	 */
    public String getShucaiPhoto() {
        return shucaiPhoto;
    }


    /**
	 * 获取：蔬菜照片
	 */

    public void setShucaiPhoto(String shucaiPhoto) {
        this.shucaiPhoto = shucaiPhoto;
    }
    /**
	 * 设置：蔬菜类型
	 */
    public Integer getShucaiTypes() {
        return shucaiTypes;
    }


    /**
	 * 获取：蔬菜类型
	 */

    public void setShucaiTypes(Integer shucaiTypes) {
        this.shucaiTypes = shucaiTypes;
    }
    /**
	 * 设置：蔬菜库存
	 */
    public Integer getShucaiKucunNumber() {
        return shucaiKucunNumber;
    }


    /**
	 * 获取：蔬菜库存
	 */

    public void setShucaiKucunNumber(Integer shucaiKucunNumber) {
        this.shucaiKucunNumber = shucaiKucunNumber;
    }
    /**
	 * 设置：购买获得积分
	 */
    public Integer getShucaiPrice() {
        return shucaiPrice;
    }


    /**
	 * 获取：购买获得积分
	 */

    public void setShucaiPrice(Integer shucaiPrice) {
        this.shucaiPrice = shucaiPrice;
    }
    /**
	 * 设置：蔬菜原价
	 */
    public Double getShucaiOldMoney() {
        return shucaiOldMoney;
    }


    /**
	 * 获取：蔬菜原价
	 */

    public void setShucaiOldMoney(Double shucaiOldMoney) {
        this.shucaiOldMoney = shucaiOldMoney;
    }
    /**
	 * 设置：现价
	 */
    public Double getShucaiNewMoney() {
        return shucaiNewMoney;
    }


    /**
	 * 获取：现价
	 */

    public void setShucaiNewMoney(Double shucaiNewMoney) {
        this.shucaiNewMoney = shucaiNewMoney;
    }
    /**
	 * 设置：蔬菜热度
	 */
    public Integer getShucaiClicknum() {
        return shucaiClicknum;
    }


    /**
	 * 获取：蔬菜热度
	 */

    public void setShucaiClicknum(Integer shucaiClicknum) {
        this.shucaiClicknum = shucaiClicknum;
    }
    /**
	 * 设置：蔬菜详细介绍
	 */
    public String getShucaiContent() {
        return shucaiContent;
    }


    /**
	 * 获取：蔬菜详细介绍
	 */

    public void setShucaiContent(String shucaiContent) {
        this.shucaiContent = shucaiContent;
    }
    /**
	 * 设置：是否上架
	 */
    public Integer getShangxiaTypes() {
        return shangxiaTypes;
    }


    /**
	 * 获取：是否上架
	 */

    public void setShangxiaTypes(Integer shangxiaTypes) {
        this.shangxiaTypes = shangxiaTypes;
    }
    /**
	 * 设置：逻辑删除
	 */
    public Integer getShucaiDelete() {
        return shucaiDelete;
    }


    /**
	 * 获取：逻辑删除
	 */

    public void setShucaiDelete(Integer shucaiDelete) {
        this.shucaiDelete = shucaiDelete;
    }
    /**
	 * 设置：创建时间  show1 show2 photoShow
	 */
    public Date getCreateTime() {
        return createTime;
    }


    /**
	 * 获取：创建时间  show1 show2 photoShow
	 */

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}
