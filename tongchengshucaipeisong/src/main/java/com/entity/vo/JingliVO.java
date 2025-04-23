package com.entity.vo;

import com.entity.JingliEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;

/**
 * 经理
 * 手机端接口返回实体辅助类
 * （主要作用去除一些不必要的字段）
 */
@TableName("jingli")
public class JingliVO implements Serializable {
    private static final long serialVersionUID = 1L;


    /**
     * 主键
     */

    @TableField(value = "id")
    private Integer id;


    /**
     * 账户
     */

    @TableField(value = "username")
    private String username;


    /**
     * 密码
     */

    @TableField(value = "password")
    private String password;


    /**
     * 经理编号
     */

    @TableField(value = "jingli_uuid_number")
    private String jingliUuidNumber;


    /**
     * 经理姓名
     */

    @TableField(value = "jingli_name")
    private String jingliName;


    /**
     * 经理手机号
     */

    @TableField(value = "jingli_phone")
    private String jingliPhone;


    /**
     * 经理身份证号
     */

    @TableField(value = "jingli_id_number")
    private String jingliIdNumber;


    /**
     * 经理头像
     */

    @TableField(value = "jingli_photo")
    private String jingliPhoto;


    /**
     * 性别
     */

    @TableField(value = "sex_types")
    private Integer sexTypes;


    /**
     * 电子邮箱
     */

    @TableField(value = "jingli_email")
    private String jingliEmail;


    /**
     * 创建时间
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
	 * 设置：账户
	 */
    public String getUsername() {
        return username;
    }


    /**
	 * 获取：账户
	 */

    public void setUsername(String username) {
        this.username = username;
    }
    /**
	 * 设置：密码
	 */
    public String getPassword() {
        return password;
    }


    /**
	 * 获取：密码
	 */

    public void setPassword(String password) {
        this.password = password;
    }
    /**
	 * 设置：经理编号
	 */
    public String getJingliUuidNumber() {
        return jingliUuidNumber;
    }


    /**
	 * 获取：经理编号
	 */

    public void setJingliUuidNumber(String jingliUuidNumber) {
        this.jingliUuidNumber = jingliUuidNumber;
    }
    /**
	 * 设置：经理姓名
	 */
    public String getJingliName() {
        return jingliName;
    }


    /**
	 * 获取：经理姓名
	 */

    public void setJingliName(String jingliName) {
        this.jingliName = jingliName;
    }
    /**
	 * 设置：经理手机号
	 */
    public String getJingliPhone() {
        return jingliPhone;
    }


    /**
	 * 获取：经理手机号
	 */

    public void setJingliPhone(String jingliPhone) {
        this.jingliPhone = jingliPhone;
    }
    /**
	 * 设置：经理身份证号
	 */
    public String getJingliIdNumber() {
        return jingliIdNumber;
    }


    /**
	 * 获取：经理身份证号
	 */

    public void setJingliIdNumber(String jingliIdNumber) {
        this.jingliIdNumber = jingliIdNumber;
    }
    /**
	 * 设置：经理头像
	 */
    public String getJingliPhoto() {
        return jingliPhoto;
    }


    /**
	 * 获取：经理头像
	 */

    public void setJingliPhoto(String jingliPhoto) {
        this.jingliPhoto = jingliPhoto;
    }
    /**
	 * 设置：性别
	 */
    public Integer getSexTypes() {
        return sexTypes;
    }


    /**
	 * 获取：性别
	 */

    public void setSexTypes(Integer sexTypes) {
        this.sexTypes = sexTypes;
    }
    /**
	 * 设置：电子邮箱
	 */
    public String getJingliEmail() {
        return jingliEmail;
    }


    /**
	 * 获取：电子邮箱
	 */

    public void setJingliEmail(String jingliEmail) {
        this.jingliEmail = jingliEmail;
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

}
