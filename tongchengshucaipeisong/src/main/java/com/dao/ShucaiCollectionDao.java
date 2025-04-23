package com.dao;

import com.entity.ShucaiCollectionEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.view.ShucaiCollectionView;

/**
 * 蔬菜收藏 Dao 接口
 *
 * @author 
 */
public interface ShucaiCollectionDao extends BaseMapper<ShucaiCollectionEntity> {

   List<ShucaiCollectionView> selectListView(Pagination page,@Param("params")Map<String,Object> params);

}
