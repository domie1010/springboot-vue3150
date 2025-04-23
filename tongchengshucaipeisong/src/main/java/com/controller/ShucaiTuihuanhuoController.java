
package com.controller;

import java.io.File;
import java.math.BigDecimal;
import java.net.URL;
import java.text.SimpleDateFormat;
import com.alibaba.fastjson.JSONObject;
import java.util.*;
import org.springframework.beans.BeanUtils;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.context.ContextLoader;
import javax.servlet.ServletContext;
import com.service.TokenService;
import com.utils.*;
import java.lang.reflect.InvocationTargetException;

import com.service.DictionaryService;
import org.apache.commons.lang3.StringUtils;
import com.annotation.IgnoreAuth;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.entity.*;
import com.entity.view.*;
import com.service.*;
import com.utils.PageUtils;
import com.utils.R;
import com.alibaba.fastjson.*;

/**
 * 蔬菜退换货
 * 后端接口
 * @author
 * @email
*/
@RestController
@Controller
@RequestMapping("/shucaiTuihuanhuo")
public class ShucaiTuihuanhuoController {
    private static final Logger logger = LoggerFactory.getLogger(ShucaiTuihuanhuoController.class);

    @Autowired
    private ShucaiTuihuanhuoService shucaiTuihuanhuoService;


    @Autowired
    private TokenService tokenService;
    @Autowired
    private DictionaryService dictionaryService;

    //级联表service
    @Autowired
    private ShucaiOrderService shucaiOrderService;
    @Autowired
    private YonghuService yonghuService;

    @Autowired
    private YuangongService yuangongService;
    @Autowired
    private JingliService jingliService;


    /**
    * 后端列表
    */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params, HttpServletRequest request){
        logger.debug("page方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));
        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(false)
            return R.error(511,"永不会进入");
        else if("用户".equals(role))
            params.put("yonghuId",request.getSession().getAttribute("userId"));
        else if("员工".equals(role))
            params.put("yuangongId",request.getSession().getAttribute("userId"));
        else if("经理".equals(role))
            params.put("jingliId",request.getSession().getAttribute("userId"));
        if(params.get("orderBy")==null || params.get("orderBy")==""){
            params.put("orderBy","id");
        }
        PageUtils page = shucaiTuihuanhuoService.queryPage(params);

        //字典表数据转换
        List<ShucaiTuihuanhuoView> list =(List<ShucaiTuihuanhuoView>)page.getList();
        for(ShucaiTuihuanhuoView c:list){
            //修改对应字典表字段
            dictionaryService.dictionaryConvert(c, request);
        }
        return R.ok().put("data", page);
    }

    /**
    * 后端详情
    */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id, HttpServletRequest request){
        logger.debug("info方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        ShucaiTuihuanhuoEntity shucaiTuihuanhuo = shucaiTuihuanhuoService.selectById(id);
        if(shucaiTuihuanhuo !=null){
            //entity转view
            ShucaiTuihuanhuoView view = new ShucaiTuihuanhuoView();
            BeanUtils.copyProperties( shucaiTuihuanhuo , view );//把实体数据重构到view中

                //级联表
                ShucaiOrderEntity shucaiOrder = shucaiOrderService.selectById(shucaiTuihuanhuo.getShucaiOrderId());
                if(shucaiOrder != null){
                    BeanUtils.copyProperties( shucaiOrder , view ,new String[]{ "id", "createTime", "insertTime", "updateTime", "yonghuId"});//把级联的数据添加到view中,并排除id和创建时间字段
                    view.setShucaiOrderId(shucaiOrder.getId());
                    view.setShucaiOrderYonghuId(shucaiOrder.getYonghuId());
                }
                //级联表
                YonghuEntity yonghu = yonghuService.selectById(shucaiTuihuanhuo.getYonghuId());
                if(yonghu != null){
                    BeanUtils.copyProperties( yonghu , view ,new String[]{ "id", "createTime", "insertTime", "updateTime"});//把级联的数据添加到view中,并排除id和创建时间字段
                    view.setYonghuId(yonghu.getId());
                }
            //修改对应字典表字段
            dictionaryService.dictionaryConvert(view, request);
            return R.ok().put("data", view);
        }else {
            return R.error(511,"查不到数据");
        }

    }

    /**
    * 后端保存
    */
    @RequestMapping("/save")
    public R save(@RequestBody ShucaiTuihuanhuoEntity shucaiTuihuanhuo, HttpServletRequest request){
        logger.debug("save方法:,,Controller:{},,shucaiTuihuanhuo:{}",this.getClass().getName(),shucaiTuihuanhuo.toString());

        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(false)
            return R.error(511,"永远不会进入");
        else if("用户".equals(role))
            shucaiTuihuanhuo.setYonghuId(Integer.valueOf(String.valueOf(request.getSession().getAttribute("userId"))));

        Wrapper<ShucaiTuihuanhuoEntity> queryWrapper = new EntityWrapper<ShucaiTuihuanhuoEntity>()
//            .eq("shucai_tuihuanhuo_uuid_number", shucaiTuihuanhuo.getShucaiTuihuanhuoUuidNumber())
            .eq("shucai_order_id", shucaiTuihuanhuo.getShucaiOrderId())
            /*.eq("yonghu_id", shucaiTuihuanhuo.getYonghuId())
            .eq("tuihuanhuo_types", shucaiTuihuanhuo.getTuihuanhuoTypes())
            .eq("shucai_tuihuanhuo_yesno_types", shucaiTuihuanhuo.getShucaiTuihuanhuoYesnoTypes())
            .eq("shucai_tuihuanhuo_courier_name", shucaiTuihuanhuo.getShucaiTuihuanhuoCourierName())
            .eq("shucai_tuihuanhuo_courier_number", shucaiTuihuanhuo.getShucaiTuihuanhuoCourierNumber())
            .eq("kuaidi_types", shucaiTuihuanhuo.getKuaidiTypes())
            .eq("shucai_huanhuo_courier_name", shucaiTuihuanhuo.getShucaiHuanhuoCourierName())
            .eq("shucai_huanhuo_courier_number", shucaiTuihuanhuo.getShucaiHuanhuoCourierNumber())*/
            ;

        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        ShucaiTuihuanhuoEntity shucaiTuihuanhuoEntity = shucaiTuihuanhuoService.selectOne(queryWrapper);
        if(shucaiTuihuanhuoEntity==null){
            shucaiTuihuanhuo.setInsertTime(new Date());
            shucaiTuihuanhuo.setShucaiTuihuanhuoYesnoTypes(1);
            shucaiTuihuanhuo.setCreateTime(new Date());
            shucaiTuihuanhuoService.insert(shucaiTuihuanhuo);
            return R.ok();
        }else {
            return R.error(511,"该订单已经申请过退换货了");
        }
    }

    /**
    * 后端修改
    */
    @RequestMapping("/update")
    public R update(@RequestBody ShucaiTuihuanhuoEntity shucaiTuihuanhuo, HttpServletRequest request){
        logger.debug("update方法:,,Controller:{},,shucaiTuihuanhuo:{}",this.getClass().getName(),shucaiTuihuanhuo.toString());

        String role = String.valueOf(request.getSession().getAttribute("role"));
//        if(false)
//            return R.error(511,"永远不会进入");
//        else if("用户".equals(role))
//            shucaiTuihuanhuo.setYonghuId(Integer.valueOf(String.valueOf(request.getSession().getAttribute("userId"))));
        //根据字段查询是否有相同数据
        Wrapper<ShucaiTuihuanhuoEntity> queryWrapper = new EntityWrapper<ShucaiTuihuanhuoEntity>()
            .notIn("id",shucaiTuihuanhuo.getId())
            .andNew()
//            .eq("shucai_tuihuanhuo_uuid_number", shucaiTuihuanhuo.getShucaiTuihuanhuoUuidNumber())
            .eq("shucai_order_id", shucaiTuihuanhuo.getShucaiOrderId())
//            .eq("yonghu_id", shucaiTuihuanhuo.getYonghuId())
//            .eq("tuihuanhuo_types", shucaiTuihuanhuo.getTuihuanhuoTypes())
//            .eq("insert_time", shucaiTuihuanhuo.getInsertTime())
//            .eq("shucai_tuihuanhuo_yesno_types", shucaiTuihuanhuo.getShucaiTuihuanhuoYesnoTypes())
//            .eq("shenhe_time", shucaiTuihuanhuo.getShenheTime())
//            .eq("shucai_tuihuanhuo_courier_name", shucaiTuihuanhuo.getShucaiTuihuanhuoCourierName())
//            .eq("shucai_tuihuanhuo_courier_number", shucaiTuihuanhuo.getShucaiTuihuanhuoCourierNumber())
//            .eq("kuaidi_types", shucaiTuihuanhuo.getKuaidiTypes())
//            .eq("shucai_huanhuo_courier_name", shucaiTuihuanhuo.getShucaiHuanhuoCourierName())
//            .eq("shucai_huanhuo_courier_number", shucaiTuihuanhuo.getShucaiHuanhuoCourierNumber())
            ;

        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        ShucaiTuihuanhuoEntity shucaiTuihuanhuoEntity = shucaiTuihuanhuoService.selectOne(queryWrapper);
        if(shucaiTuihuanhuoEntity==null){
            shucaiTuihuanhuoService.updateById(shucaiTuihuanhuo);//根据id更新
            return R.ok();
        }else {
            return R.error(511,"该订单已经申请过退换货了");
        }
    }


    /**
    * 审核
    */
    @RequestMapping("/shenhe")
    public R shenhe(@RequestBody ShucaiTuihuanhuoEntity shucaiTuihuanhuoEntity, HttpServletRequest request){
        logger.debug("shenhe方法:,,Controller:{},,shucaiTuihuanhuoEntity:{}",this.getClass().getName(),shucaiTuihuanhuoEntity.toString());

//        if(shucaiTuihuanhuoEntity.getShucaiTuihuanhuoYesnoTypes() == 2){//通过
//            shucaiTuihuanhuoEntity.setShucaiTuihuanhuoTypes();
//        }else if(shucaiTuihuanhuoEntity.getShucaiTuihuanhuoYesnoTypes() == 3){//拒绝
//            shucaiTuihuanhuoEntity.setShucaiTuihuanhuoTypes();
//        }
        shucaiTuihuanhuoEntity.setShenheTime(new Date());
        shucaiTuihuanhuoService.updateById(shucaiTuihuanhuoEntity);//审核
        return R.ok();
    }

    /**
    * 删除
    */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids){
        logger.debug("delete:,,Controller:{},,ids:{}",this.getClass().getName(),ids.toString());
        shucaiTuihuanhuoService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }


    /**
     * 批量上传
     */
    @RequestMapping("/batchInsert")
    public R save( String fileName, HttpServletRequest request){
        logger.debug("batchInsert方法:,,Controller:{},,fileName:{}",this.getClass().getName(),fileName);
        Integer yonghuId = Integer.valueOf(String.valueOf(request.getSession().getAttribute("userId")));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            List<ShucaiTuihuanhuoEntity> shucaiTuihuanhuoList = new ArrayList<>();//上传的东西
            Map<String, List<String>> seachFields= new HashMap<>();//要查询的字段
            Date date = new Date();
            int lastIndexOf = fileName.lastIndexOf(".");
            if(lastIndexOf == -1){
                return R.error(511,"该文件没有后缀");
            }else{
                String suffix = fileName.substring(lastIndexOf);
                if(!".xls".equals(suffix)){
                    return R.error(511,"只支持后缀为xls的excel文件");
                }else{
                    URL resource = this.getClass().getClassLoader().getResource("../../upload/" + fileName);//获取文件路径
                    File file = new File(resource.getFile());
                    if(!file.exists()){
                        return R.error(511,"找不到上传文件，请联系管理员");
                    }else{
                        List<List<String>> dataList = PoiUtil.poiImport(file.getPath());//读取xls文件
                        dataList.remove(0);//删除第一行，因为第一行是提示
                        for(List<String> data:dataList){
                            //循环
                            ShucaiTuihuanhuoEntity shucaiTuihuanhuoEntity = new ShucaiTuihuanhuoEntity();
//                            shucaiTuihuanhuoEntity.setShucaiTuihuanhuoUuidNumber(data.get(0));                    //退换货编号 要改的
//                            shucaiTuihuanhuoEntity.setShucaiOrderId(Integer.valueOf(data.get(0)));   //蔬菜订单 要改的
//                            shucaiTuihuanhuoEntity.setYonghuId(Integer.valueOf(data.get(0)));   //用户 要改的
//                            shucaiTuihuanhuoEntity.setTuihuanhuoTypes(Integer.valueOf(data.get(0)));   //退换货 要改的
//                            shucaiTuihuanhuoEntity.setInsertTime(date);//时间
//                            shucaiTuihuanhuoEntity.setGonggaoContent("");//详情和图片
//                            shucaiTuihuanhuoEntity.setShucaiTuihuanhuoYesnoTypes(Integer.valueOf(data.get(0)));   //审核状态 要改的
//                            shucaiTuihuanhuoEntity.setShucaiTuihuanhuoYesnoContent("");//详情和图片
//                            shucaiTuihuanhuoEntity.setShenheTime(sdf.parse(data.get(0)));          //审核时间 要改的
//                            shucaiTuihuanhuoEntity.setShucaiTuihuanhuoCourierName(data.get(0));                    //退回快递公司 要改的
//                            shucaiTuihuanhuoEntity.setShucaiTuihuanhuoCourierNumber(data.get(0));                    //退回快递单号 要改的
//                            shucaiTuihuanhuoEntity.setKuaidiTypes(Integer.valueOf(data.get(0)));   //快递状态 要改的
//                            shucaiTuihuanhuoEntity.setShucaiHuanhuoCourierName(data.get(0));                    //换货快递公司 要改的
//                            shucaiTuihuanhuoEntity.setShucaiHuanhuoCourierNumber(data.get(0));                    //换货快递单号 要改的
//                            shucaiTuihuanhuoEntity.setCreateTime(date);//时间
                            shucaiTuihuanhuoList.add(shucaiTuihuanhuoEntity);


                            //把要查询是否重复的字段放入map中
                                //退换货编号
                                if(seachFields.containsKey("shucaiTuihuanhuoUuidNumber")){
                                    List<String> shucaiTuihuanhuoUuidNumber = seachFields.get("shucaiTuihuanhuoUuidNumber");
                                    shucaiTuihuanhuoUuidNumber.add(data.get(0));//要改的
                                }else{
                                    List<String> shucaiTuihuanhuoUuidNumber = new ArrayList<>();
                                    shucaiTuihuanhuoUuidNumber.add(data.get(0));//要改的
                                    seachFields.put("shucaiTuihuanhuoUuidNumber",shucaiTuihuanhuoUuidNumber);
                                }
                        }

                        //查询是否重复
                         //退换货编号
                        List<ShucaiTuihuanhuoEntity> shucaiTuihuanhuoEntities_shucaiTuihuanhuoUuidNumber = shucaiTuihuanhuoService.selectList(new EntityWrapper<ShucaiTuihuanhuoEntity>().in("shucai_tuihuanhuo_uuid_number", seachFields.get("shucaiTuihuanhuoUuidNumber")));
                        if(shucaiTuihuanhuoEntities_shucaiTuihuanhuoUuidNumber.size() >0 ){
                            ArrayList<String> repeatFields = new ArrayList<>();
                            for(ShucaiTuihuanhuoEntity s:shucaiTuihuanhuoEntities_shucaiTuihuanhuoUuidNumber){
                                repeatFields.add(s.getShucaiTuihuanhuoUuidNumber());
                            }
                            return R.error(511,"数据库的该表中的 [退换货编号] 字段已经存在 存在数据为:"+repeatFields.toString());
                        }
                        shucaiTuihuanhuoService.insertBatch(shucaiTuihuanhuoList);
                        return R.ok();
                    }
                }
            }
        }catch (Exception e){
            e.printStackTrace();
            return R.error(511,"批量插入数据异常，请联系管理员");
        }
    }





    /**
    * 前端列表
    */
    @IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params, HttpServletRequest request){
        logger.debug("list方法:,,Controller:{},,params:{}",this.getClass().getName(),JSONObject.toJSONString(params));

        // 没有指定排序字段就默认id倒序
        if(StringUtil.isEmpty(String.valueOf(params.get("orderBy")))){
            params.put("orderBy","id");
        }
        PageUtils page = shucaiTuihuanhuoService.queryPage(params);

        //字典表数据转换
        List<ShucaiTuihuanhuoView> list =(List<ShucaiTuihuanhuoView>)page.getList();
        for(ShucaiTuihuanhuoView c:list)
            dictionaryService.dictionaryConvert(c, request); //修改对应字典表字段
        return R.ok().put("data", page);
    }

    /**
    * 前端详情
    */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id, HttpServletRequest request){
        logger.debug("detail方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        ShucaiTuihuanhuoEntity shucaiTuihuanhuo = shucaiTuihuanhuoService.selectById(id);
            if(shucaiTuihuanhuo !=null){


                //entity转view
                ShucaiTuihuanhuoView view = new ShucaiTuihuanhuoView();
                BeanUtils.copyProperties( shucaiTuihuanhuo , view );//把实体数据重构到view中

                //级联表
                    ShucaiOrderEntity shucaiOrder = shucaiOrderService.selectById(shucaiTuihuanhuo.getShucaiOrderId());
                if(shucaiOrder != null){
                    BeanUtils.copyProperties( shucaiOrder , view ,new String[]{ "id", "createDate"});//把级联的数据添加到view中,并排除id和创建时间字段
                    view.setShucaiOrderId(shucaiOrder.getId());
                }
                //级联表
                    YonghuEntity yonghu = yonghuService.selectById(shucaiTuihuanhuo.getYonghuId());
                if(yonghu != null){
                    BeanUtils.copyProperties( yonghu , view ,new String[]{ "id", "createDate"});//把级联的数据添加到view中,并排除id和创建时间字段
                    view.setYonghuId(yonghu.getId());
                }
                //修改对应字典表字段
                dictionaryService.dictionaryConvert(view, request);
                return R.ok().put("data", view);
            }else {
                return R.error(511,"查不到数据");
            }
    }


    /**
    * 前端保存
    */
    @RequestMapping("/add")
    public R add(@RequestBody ShucaiTuihuanhuoEntity shucaiTuihuanhuo, HttpServletRequest request){
        logger.debug("add方法:,,Controller:{},,shucaiTuihuanhuo:{}",this.getClass().getName(),shucaiTuihuanhuo.toString());
        Wrapper<ShucaiTuihuanhuoEntity> queryWrapper = new EntityWrapper<ShucaiTuihuanhuoEntity>()
            .eq("shucai_tuihuanhuo_uuid_number", shucaiTuihuanhuo.getShucaiTuihuanhuoUuidNumber())
            .eq("shucai_order_id", shucaiTuihuanhuo.getShucaiOrderId())
            .eq("yonghu_id", shucaiTuihuanhuo.getYonghuId())
            .eq("tuihuanhuo_types", shucaiTuihuanhuo.getTuihuanhuoTypes())
            .eq("shucai_tuihuanhuo_yesno_types", shucaiTuihuanhuo.getShucaiTuihuanhuoYesnoTypes())
            .eq("shucai_tuihuanhuo_courier_name", shucaiTuihuanhuo.getShucaiTuihuanhuoCourierName())
            .eq("shucai_tuihuanhuo_courier_number", shucaiTuihuanhuo.getShucaiTuihuanhuoCourierNumber())
            .eq("kuaidi_types", shucaiTuihuanhuo.getKuaidiTypes())
            .eq("shucai_huanhuo_courier_name", shucaiTuihuanhuo.getShucaiHuanhuoCourierName())
            .eq("shucai_huanhuo_courier_number", shucaiTuihuanhuo.getShucaiHuanhuoCourierNumber())
            ;
        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        ShucaiTuihuanhuoEntity shucaiTuihuanhuoEntity = shucaiTuihuanhuoService.selectOne(queryWrapper);
        if(shucaiTuihuanhuoEntity==null){
            shucaiTuihuanhuo.setInsertTime(new Date());
            shucaiTuihuanhuo.setShucaiTuihuanhuoYesnoTypes(1);
            shucaiTuihuanhuo.setCreateTime(new Date());
        shucaiTuihuanhuoService.insert(shucaiTuihuanhuo);
            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }


}
