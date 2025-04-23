package com.entity.model;

import com.entity.JingliEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serializable;


/**
 * 经理
 * 接收传参的实体类
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了）
 * 取自ModelAndView 的model名称
 */
public class JingliModel implements Serializable {
    private static final long serialVersionUID = 1L;




    /**
     * 主键
     */
    private Integer id;


    /**
     * 账户
     */
    private String username;


    /**
     * 密码
     */
    private String password;


    /**
     * 经理编号
     */
    private String jingliUuidNumber;


    /**
     * 经理姓名
     */
    private String jingliName;


    /**
     * 经理手机号
     */
    private String jingliPhone;


    /**
     * 经理身份证号
     */
    private String jingliIdNumber;


    /**
     * 经理头像
     */
    private String jingliPhoto;


    /**
     * 性别
     */
    private Integer sexTypes;


    /**
     * 电子邮箱
     */
    private String jingliEmail;


    /**
     * 创建时间
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
	 * 获取：账户
	 */
    public String getUsername() {
        return username;
    }


    /**
	 * 设置：账户
	 */
    public void setUsername(String username) {
        this.username = username;
    }
    /**
	 * 获取：密码
	 */
    public String getPassword() {
        return password;
    }


    /**
	 * 设置：密码
	 */
    public void setPassword(String password) {
        this.password = password;
    }
    /**
	 * 获取：经理编号
	 */
    public String getJingliUuidNumber() {
        return jingliUuidNumber;
    }


    /**
	 * 设置：经理编号
	 */
    public void setJingliUuidNumber(String jingliUuidNumber) {
        this.jingliUuidNumber = jingliUuidNumber;
    }
    /**
	 * 获取：经理姓名
	 */
    public String getJingliName() {
        return jingliName;
    }


    /**
	 * 设置：经理姓名
	 */
    public void setJingliName(String jingliName) {
        this.jingliName = jingliName;
    }
    /**
	 * 获取：经理手机号
	 */
    public String getJingliPhone() {
        return jingliPhone;
    }


    /**
	 * 设置：经理手机号
	 */
    public void setJingliPhone(String jingliPhone) {
        this.jingliPhone = jingliPhone;
    }
    /**
	 * 获取：经理身份证号
	 */
    public String getJingliIdNumber() {
        return jingliIdNumber;
    }


    /**
	 * 设置：经理身份证号
	 */
    public void setJingliIdNumber(String jingliIdNumber) {
        this.jingliIdNumber = jingliIdNumber;
    }
    /**
	 * 获取：经理头像
	 */
    public String getJingliPhoto() {
        return jingliPhoto;
    }


    /**
	 * 设置：经理头像
	 */
    public void setJingliPhoto(String jingliPhoto) {
        this.jingliPhoto = jingliPhoto;
    }
    /**
	 * 获取：性别
	 */
    public Integer getSexTypes() {
        return sexTypes;
    }


    /**
	 * 设置：性别
	 */
    public void setSexTypes(Integer sexTypes) {
        this.sexTypes = sexTypes;
    }
    /**
	 * 获取：电子邮箱
	 */
    public String getJingliEmail() {
        return jingliEmail;
    }


    /**
	 * 设置：电子邮箱
	 */
    public void setJingliEmail(String jingliEmail) {
        this.jingliEmail = jingliEmail;
    }
    /**
	 * 获取：创建时间
	 */
    public Date getCreateTime() {
        return createTime;
    }


    /**
	 * 设置：创建时间
	 */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    }
