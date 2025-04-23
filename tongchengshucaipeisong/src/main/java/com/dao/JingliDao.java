package com.dao;

import com.entity.JingliEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.view.JingliView;

/**
 * 经理 Dao 接口
 *
 * @author 
 */
public interface JingliDao extends BaseMapper<JingliEntity> {

   List<JingliView> selectListView(Pagination page,@Param("params")Map<String,Object> params);

}
