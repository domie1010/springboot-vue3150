package com.dao;

import com.entity.ShucaiTuihuanhuoEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.view.ShucaiTuihuanhuoView;

/**
 * 蔬菜退换货 Dao 接口
 *
 * @author 
 */
public interface ShucaiTuihuanhuoDao extends BaseMapper<ShucaiTuihuanhuoEntity> {

   List<ShucaiTuihuanhuoView> selectListView(Pagination page,@Param("params")Map<String,Object> params);

}
