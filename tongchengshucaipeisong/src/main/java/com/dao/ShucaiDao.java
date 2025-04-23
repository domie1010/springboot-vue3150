package com.dao;

import com.entity.ShucaiEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.view.ShucaiView;

/**
 * 蔬菜 Dao 接口
 *
 * @author 
 */
public interface ShucaiDao extends BaseMapper<ShucaiEntity> {

   List<ShucaiView> selectListView(Pagination page,@Param("params")Map<String,Object> params);

}
