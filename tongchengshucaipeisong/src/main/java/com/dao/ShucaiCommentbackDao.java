package com.dao;

import com.entity.ShucaiCommentbackEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.view.ShucaiCommentbackView;

/**
 * 蔬菜评价 Dao 接口
 *
 * @author 
 */
public interface ShucaiCommentbackDao extends BaseMapper<ShucaiCommentbackEntity> {

   List<ShucaiCommentbackView> selectListView(Pagination page,@Param("params")Map<String,Object> params);

}
