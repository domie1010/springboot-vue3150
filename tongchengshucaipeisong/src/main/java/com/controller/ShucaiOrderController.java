
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
 * 蔬菜订单
 * 后端接口
 * @author
 * @email
*/
@RestController
@Controller
@RequestMapping("/shucaiOrder")
public class ShucaiOrderController {
    private static final Logger logger = LoggerFactory.getLogger(ShucaiOrderController.class);

    @Autowired
    private ShucaiOrderService shucaiOrderService;


    @Autowired
    private TokenService tokenService;
    @Autowired
    private DictionaryService dictionaryService;

    //级联表service
    @Autowired
    private AddressService addressService;
    @Autowired
    private ShucaiService shucaiService;
    @Autowired
    private YonghuService yonghuService;
@Autowired
private CartService cartService;
@Autowired
private ShucaiCommentbackService shucaiCommentbackService;



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
        PageUtils page = shucaiOrderService.queryPage(params);

        //字典表数据转换
        List<ShucaiOrderView> list =(List<ShucaiOrderView>)page.getList();
        for(ShucaiOrderView c:list){
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
        ShucaiOrderEntity shucaiOrder = shucaiOrderService.selectById(id);
        if(shucaiOrder !=null){
            //entity转view
            ShucaiOrderView view = new ShucaiOrderView();
            BeanUtils.copyProperties( shucaiOrder , view );//把实体数据重构到view中

                //级联表
                AddressEntity address = addressService.selectById(shucaiOrder.getAddressId());
                if(address != null){
                    BeanUtils.copyProperties( address , view ,new String[]{ "id", "createTime", "insertTime", "updateTime", "yonghuId"});//把级联的数据添加到view中,并排除id和创建时间字段
                    view.setAddressId(address.getId());
                    view.setAddressYonghuId(address.getYonghuId());
                }
                //级联表
                ShucaiEntity shucai = shucaiService.selectById(shucaiOrder.getShucaiId());
                if(shucai != null){
                    BeanUtils.copyProperties( shucai , view ,new String[]{ "id", "createTime", "insertTime", "updateTime"});//把级联的数据添加到view中,并排除id和创建时间字段
                    view.setShucaiId(shucai.getId());
                }
                //级联表
                YonghuEntity yonghu = yonghuService.selectById(shucaiOrder.getYonghuId());
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
    public R save(@RequestBody ShucaiOrderEntity shucaiOrder, HttpServletRequest request){
        logger.debug("save方法:,,Controller:{},,shucaiOrder:{}",this.getClass().getName(),shucaiOrder.toString());

        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(false)
            return R.error(511,"永远不会进入");
        else if("用户".equals(role))
            shucaiOrder.setYonghuId(Integer.valueOf(String.valueOf(request.getSession().getAttribute("userId"))));

        shucaiOrder.setInsertTime(new Date());
        shucaiOrder.setCreateTime(new Date());
        shucaiOrderService.insert(shucaiOrder);
        return R.ok();
    }

    /**
    * 后端修改
    */
    @RequestMapping("/update")
    public R update(@RequestBody ShucaiOrderEntity shucaiOrder, HttpServletRequest request){
        logger.debug("update方法:,,Controller:{},,shucaiOrder:{}",this.getClass().getName(),shucaiOrder.toString());

        String role = String.valueOf(request.getSession().getAttribute("role"));
//        if(false)
//            return R.error(511,"永远不会进入");
//        else if("用户".equals(role))
//            shucaiOrder.setYonghuId(Integer.valueOf(String.valueOf(request.getSession().getAttribute("userId"))));
        //根据字段查询是否有相同数据
        Wrapper<ShucaiOrderEntity> queryWrapper = new EntityWrapper<ShucaiOrderEntity>()
            .eq("id",0)
            ;

        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        ShucaiOrderEntity shucaiOrderEntity = shucaiOrderService.selectOne(queryWrapper);
        if(shucaiOrderEntity==null){
            shucaiOrderService.updateById(shucaiOrder);//根据id更新
            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }



    /**
    * 删除
    */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids){
        logger.debug("delete:,,Controller:{},,ids:{}",this.getClass().getName(),ids.toString());
        shucaiOrderService.deleteBatchIds(Arrays.asList(ids));
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
            List<ShucaiOrderEntity> shucaiOrderList = new ArrayList<>();//上传的东西
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
                            ShucaiOrderEntity shucaiOrderEntity = new ShucaiOrderEntity();
//                            shucaiOrderEntity.setShucaiOrderUuidNumber(data.get(0));                    //订单号 要改的
//                            shucaiOrderEntity.setAddressId(Integer.valueOf(data.get(0)));   //收货地址 要改的
//                            shucaiOrderEntity.setShucaiId(Integer.valueOf(data.get(0)));   //蔬菜 要改的
//                            shucaiOrderEntity.setYonghuId(Integer.valueOf(data.get(0)));   //用户 要改的
//                            shucaiOrderEntity.setBuyNumber(Integer.valueOf(data.get(0)));   //购买数量 要改的
//                            shucaiOrderEntity.setShucaiOrderTruePrice(data.get(0));                    //实付价格 要改的
//                            shucaiOrderEntity.setShucaiOrderCourierName(data.get(0));                    //快递公司 要改的
//                            shucaiOrderEntity.setShucaiOrderCourierNumber(data.get(0));                    //订单快递单号 要改的
//                            shucaiOrderEntity.setShucaiOrderTypes(Integer.valueOf(data.get(0)));   //订单类型 要改的
//                            shucaiOrderEntity.setShucaiOrderPaymentTypes(Integer.valueOf(data.get(0)));   //支付类型 要改的
//                            shucaiOrderEntity.setInsertTime(date);//时间
//                            shucaiOrderEntity.setCreateTime(date);//时间
                            shucaiOrderList.add(shucaiOrderEntity);


                            //把要查询是否重复的字段放入map中
                                //订单号
                                if(seachFields.containsKey("shucaiOrderUuidNumber")){
                                    List<String> shucaiOrderUuidNumber = seachFields.get("shucaiOrderUuidNumber");
                                    shucaiOrderUuidNumber.add(data.get(0));//要改的
                                }else{
                                    List<String> shucaiOrderUuidNumber = new ArrayList<>();
                                    shucaiOrderUuidNumber.add(data.get(0));//要改的
                                    seachFields.put("shucaiOrderUuidNumber",shucaiOrderUuidNumber);
                                }
                        }

                        //查询是否重复
                         //订单号
                        List<ShucaiOrderEntity> shucaiOrderEntities_shucaiOrderUuidNumber = shucaiOrderService.selectList(new EntityWrapper<ShucaiOrderEntity>().in("shucai_order_uuid_number", seachFields.get("shucaiOrderUuidNumber")));
                        if(shucaiOrderEntities_shucaiOrderUuidNumber.size() >0 ){
                            ArrayList<String> repeatFields = new ArrayList<>();
                            for(ShucaiOrderEntity s:shucaiOrderEntities_shucaiOrderUuidNumber){
                                repeatFields.add(s.getShucaiOrderUuidNumber());
                            }
                            return R.error(511,"数据库的该表中的 [订单号] 字段已经存在 存在数据为:"+repeatFields.toString());
                        }
                        shucaiOrderService.insertBatch(shucaiOrderList);
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
        PageUtils page = shucaiOrderService.queryPage(params);

        //字典表数据转换
        List<ShucaiOrderView> list =(List<ShucaiOrderView>)page.getList();
        for(ShucaiOrderView c:list)
            dictionaryService.dictionaryConvert(c, request); //修改对应字典表字段
        return R.ok().put("data", page);
    }

    /**
    * 前端详情
    */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id, HttpServletRequest request){
        logger.debug("detail方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        ShucaiOrderEntity shucaiOrder = shucaiOrderService.selectById(id);
            if(shucaiOrder !=null){


                //entity转view
                ShucaiOrderView view = new ShucaiOrderView();
                BeanUtils.copyProperties( shucaiOrder , view );//把实体数据重构到view中

                //级联表
                    AddressEntity address = addressService.selectById(shucaiOrder.getAddressId());
                if(address != null){
                    BeanUtils.copyProperties( address , view ,new String[]{ "id", "createDate"});//把级联的数据添加到view中,并排除id和创建时间字段
                    view.setAddressId(address.getId());
                }
                //级联表
                    ShucaiEntity shucai = shucaiService.selectById(shucaiOrder.getShucaiId());
                if(shucai != null){
                    BeanUtils.copyProperties( shucai , view ,new String[]{ "id", "createDate"});//把级联的数据添加到view中,并排除id和创建时间字段
                    view.setShucaiId(shucai.getId());
                }
                //级联表
                    YonghuEntity yonghu = yonghuService.selectById(shucaiOrder.getYonghuId());
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
    public R add(@RequestBody ShucaiOrderEntity shucaiOrder, HttpServletRequest request){
        logger.debug("add方法:,,Controller:{},,shucaiOrder:{}",this.getClass().getName(),shucaiOrder.toString());
            ShucaiEntity shucaiEntity = shucaiService.selectById(shucaiOrder.getShucaiId());
            if(shucaiEntity == null){
                return R.error(511,"查不到该蔬菜");
            }
            // Double shucaiNewMoney = shucaiEntity.getShucaiNewMoney();

            if(false){
            }
            else if((shucaiEntity.getShucaiKucunNumber() -shucaiOrder.getBuyNumber())<0){
                return R.error(511,"购买数量不能大于库存数量");
            }
            else if(shucaiEntity.getShucaiNewMoney() == null){
                return R.error(511,"蔬菜价格不能为空");
            }

            //计算所获得积分
            Double buyJifen =0.0;
            Integer userId = (Integer) request.getSession().getAttribute("userId");
            YonghuEntity yonghuEntity = yonghuService.selectById(userId);
            if(yonghuEntity == null)
                return R.error(511,"用户不能为空");
            if(yonghuEntity.getNewMoney() == null)
                return R.error(511,"用户金额不能为空");
            double balance = yonghuEntity.getNewMoney() - shucaiEntity.getShucaiNewMoney()*shucaiOrder.getBuyNumber();//余额
            buyJifen = new BigDecimal(shucaiEntity.getShucaiPrice()).multiply(new BigDecimal(shucaiOrder.getBuyNumber())).doubleValue();//所获积分
            if(balance<0)
                return R.error(511,"余额不够支付");
            shucaiOrder.setShucaiOrderTypes(1); //设置订单状态为已支付
            shucaiOrder.setShucaiOrderTruePrice(shucaiEntity.getShucaiNewMoney()*shucaiOrder.getBuyNumber()); //设置实付价格
            shucaiOrder.setYonghuId(userId); //设置订单支付人id
            shucaiOrder.setShucaiOrderUuidNumber(String.valueOf(new Date().getTime()));
            shucaiOrder.setShucaiOrderPaymentTypes(1);
            shucaiOrder.setInsertTime(new Date());
            shucaiOrder.setCreateTime(new Date());
                shucaiEntity.setShucaiKucunNumber( shucaiEntity.getShucaiKucunNumber() -shucaiOrder.getBuyNumber());
                shucaiService.updateById(shucaiEntity);
                shucaiOrderService.insert(shucaiOrder);//新增订单
            yonghuEntity.setNewMoney(balance);//设置金额
            yonghuEntity.setYonghuSumJifen(yonghuEntity.getYonghuSumJifen() + buyJifen); //设置总积分
            yonghuEntity.setYonghuNewJifen(yonghuEntity.getYonghuNewJifen() + buyJifen); //设置现积分
                if(yonghuEntity.getYonghuSumJifen()  < 10000)
                    yonghuEntity.setHuiyuandengjiTypes(1);
                else if(yonghuEntity.getYonghuSumJifen()  < 100000)
                    yonghuEntity.setHuiyuandengjiTypes(2);
                else if(yonghuEntity.getYonghuSumJifen()  < 1000000)
                    yonghuEntity.setHuiyuandengjiTypes(3);
            yonghuService.updateById(yonghuEntity);
            return R.ok();
    }
    /**
     * 添加订单
     */
    @RequestMapping("/order")
    public R add(@RequestParam Map<String, Object> params, HttpServletRequest request){
        logger.debug("order方法:,,Controller:{},,params:{}",this.getClass().getName(),params.toString());
        String shucaiOrderUuidNumber = String.valueOf(new Date().getTime());

        //获取当前登录用户的id
        Integer userId = (Integer) request.getSession().getAttribute("userId");
        Integer addressId = Integer.valueOf(String.valueOf(params.get("addressId")));

        Integer shucaiOrderPaymentTypes = Integer.valueOf(String.valueOf(params.get("shucaiOrderPaymentTypes")));//支付类型

        String data = String.valueOf(params.get("shucais"));
        JSONArray jsonArray = JSON.parseArray(data);
        List<Map> shucais = JSON.parseObject(jsonArray.toString(), List.class);

        //获取当前登录用户的个人信息
        YonghuEntity yonghuEntity = yonghuService.selectById(userId);

        //当前订单表
        List<ShucaiOrderEntity> shucaiOrderList = new ArrayList<>();
        //商品表
        List<ShucaiEntity> shucaiList = new ArrayList<>();
        //购物车ids
        List<Integer> cartIds = new ArrayList<>();

        BigDecimal zhekou = new BigDecimal(1.0);
        // 获取折扣
        Wrapper<DictionaryEntity> dictionary = new EntityWrapper<DictionaryEntity>()
                .eq("dic_code", "huiyuandengji_types")
                .eq("dic_name", "会员等级类型")
                .eq("code_index", yonghuEntity.getHuiyuandengjiTypes())
                ;
        DictionaryEntity dictionaryEntity = dictionaryService.selectOne(dictionary);
        if(dictionaryEntity != null ){
            zhekou = BigDecimal.valueOf(Double.valueOf(dictionaryEntity.getBeizhu()));
        }

        //循环取出需要的数据
        for (Map<String, Object> map : shucais) {
           //取值
            Integer shucaiId = Integer.valueOf(String.valueOf(map.get("shucaiId")));//商品id
            Integer buyNumber = Integer.valueOf(String.valueOf(map.get("buyNumber")));//购买数量
            ShucaiEntity shucaiEntity = shucaiService.selectById(shucaiId);//购买的商品
            String id = String.valueOf(map.get("id"));
            if(StringUtil.isNotEmpty(id))
                cartIds.add(Integer.valueOf(id));

            //判断商品的库存是否足够
            if(shucaiEntity.getShucaiKucunNumber() < buyNumber){
                //商品库存不足直接返回
                return R.error(shucaiEntity.getShucaiName()+"的库存不足");
            }else{
                //商品库存充足就减库存
                shucaiEntity.setShucaiKucunNumber(shucaiEntity.getShucaiKucunNumber() - buyNumber);
            }

            //订单信息表增加数据
            ShucaiOrderEntity shucaiOrderEntity = new ShucaiOrderEntity<>();

            //赋值订单信息
            shucaiOrderEntity.setShucaiOrderUuidNumber(String.valueOf(new Date().getTime()+new Random().nextInt(100)));//订单号
            shucaiOrderEntity.setAddressId(addressId);//收货地址
            shucaiOrderEntity.setShucaiId(shucaiId);//蔬菜
            shucaiOrderEntity.setYonghuId(userId);//用户
            shucaiOrderEntity.setBuyNumber(buyNumber);//购买数量 ？？？？？？
            shucaiOrderEntity.setShucaiOrderTypes(1);//订单类型
            shucaiOrderEntity.setShucaiOrderPaymentTypes(shucaiOrderPaymentTypes);//支付类型
            shucaiOrderEntity.setInsertTime(new Date());//订单创建时间
            shucaiOrderEntity.setCreateTime(new Date());//创建时间

            //判断是什么支付方式 1代表余额 2代表积分
            if(shucaiOrderPaymentTypes == 1){//余额支付
                //计算金额
                Double money = new BigDecimal(shucaiEntity.getShucaiNewMoney()).multiply(new BigDecimal(buyNumber)).multiply(zhekou).doubleValue();

                if(yonghuEntity.getNewMoney() - money <0 ){
                    return R.error("余额不足,请充值！！！");
                }else{
                    //计算所获得积分
                    Double buyJifen =0.0;
                        buyJifen = new BigDecimal(shucaiEntity.getShucaiPrice()).multiply(new BigDecimal(buyNumber)).doubleValue();
                    yonghuEntity.setNewMoney(yonghuEntity.getNewMoney() - money); //设置金额
                    yonghuEntity.setYonghuSumJifen(yonghuEntity.getYonghuSumJifen() + buyJifen); //设置总积分
                    yonghuEntity.setYonghuNewJifen(yonghuEntity.getYonghuNewJifen() + buyJifen); //设置现积分
                        if(yonghuEntity.getYonghuSumJifen()  < 10000)
                            yonghuEntity.setHuiyuandengjiTypes(1);
                        else if(yonghuEntity.getYonghuSumJifen()  < 100000)
                            yonghuEntity.setHuiyuandengjiTypes(2);
                        else if(yonghuEntity.getYonghuSumJifen()  < 1000000)
                            yonghuEntity.setHuiyuandengjiTypes(3);


                    shucaiOrderEntity.setShucaiOrderTruePrice(money);

                }
            }
            shucaiOrderList.add(shucaiOrderEntity);
            shucaiList.add(shucaiEntity);

        }
        shucaiOrderService.insertBatch(shucaiOrderList);
        shucaiService.updateBatchById(shucaiList);
        yonghuService.updateById(yonghuEntity);
        if(cartIds != null && cartIds.size()>0)
            cartService.deleteBatchIds(cartIds);
        return R.ok();
    }

    /**
    * 退款
    */
    @RequestMapping("/refund")
    public R refund(Integer id, HttpServletRequest request){
        logger.debug("refund方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        String role = String.valueOf(request.getSession().getAttribute("role"));

            ShucaiOrderEntity shucaiOrder = shucaiOrderService.selectById(id);
            Integer buyNumber = shucaiOrder.getBuyNumber();
            Integer shucaiOrderPaymentTypes = shucaiOrder.getShucaiOrderPaymentTypes();
            Integer shucaiId = shucaiOrder.getShucaiId();
            if(shucaiId == null)
                return R.error(511,"查不到该蔬菜");
            ShucaiEntity shucaiEntity = shucaiService.selectById(shucaiId);
            if(shucaiEntity == null)
                return R.error(511,"查不到该蔬菜");
            Double shucaiNewMoney = shucaiEntity.getShucaiNewMoney();
            if(shucaiNewMoney == null)
                return R.error(511,"蔬菜价格不能为空");

            Integer userId = (Integer) request.getSession().getAttribute("userId");
            YonghuEntity yonghuEntity = yonghuService.selectById(userId);
            if(yonghuEntity == null)
                return R.error(511,"用户不能为空");
            if(yonghuEntity.getNewMoney() == null)
                return R.error(511,"用户金额不能为空");

            Double zhekou = 1.0;
            // 获取折扣
            Wrapper<DictionaryEntity> dictionary = new EntityWrapper<DictionaryEntity>()
                    .eq("dic_code", "huiyuandengji_types")
                    .eq("dic_name", "会员等级类型")
                    .eq("code_index", yonghuEntity.getHuiyuandengjiTypes())
                    ;
            DictionaryEntity dictionaryEntity = dictionaryService.selectOne(dictionary);
            if(dictionaryEntity != null ){
                zhekou = Double.valueOf(dictionaryEntity.getBeizhu());
            }


            //判断是什么支付方式 1代表余额 2代表积分
            if(shucaiOrderPaymentTypes == 1){//余额支付
                //计算金额
                Double money = shucaiEntity.getShucaiNewMoney() * buyNumber  * zhekou;
                //计算所获得积分
                Double buyJifen = 0.0;
                buyJifen = new BigDecimal(shucaiEntity.getShucaiPrice()).multiply(new BigDecimal(buyNumber)).doubleValue();
                yonghuEntity.setNewMoney(yonghuEntity.getNewMoney() + money); //设置金额
                yonghuEntity.setYonghuSumJifen(yonghuEntity.getYonghuSumJifen() - buyJifen); //设置总积分
                if(yonghuEntity.getYonghuNewJifen() - buyJifen <0 )
                    return R.error("积分已经消费,无法退款！！！");
                yonghuEntity.setYonghuNewJifen(yonghuEntity.getYonghuNewJifen() - buyJifen); //设置现积分

                if(yonghuEntity.getYonghuSumJifen()  < 10000)
                    yonghuEntity.setHuiyuandengjiTypes(1);
                else if(yonghuEntity.getYonghuSumJifen()  < 100000)
                    yonghuEntity.setHuiyuandengjiTypes(2);
                else if(yonghuEntity.getYonghuSumJifen()  < 1000000)
                    yonghuEntity.setHuiyuandengjiTypes(3);

            }

            shucaiEntity.setShucaiKucunNumber(shucaiEntity.getShucaiKucunNumber() + buyNumber);



            shucaiOrder.setShucaiOrderTypes(2);//设置订单状态为退款
            shucaiOrderService.updateById(shucaiOrder);//根据id更新
            yonghuService.updateById(yonghuEntity);//更新用户信息
            shucaiService.updateById(shucaiEntity);//更新订单中蔬菜的信息
            return R.ok();
    }


    /**
     * 发货
     */
    @RequestMapping("/deliver")
    public R deliver(Integer id ,String shucaiOrderCourierNumber, String shucaiOrderCourierName){
        logger.debug("refund:,,Controller:{},,ids:{}",this.getClass().getName(),id.toString());
        ShucaiOrderEntity  shucaiOrderEntity = new  ShucaiOrderEntity();;
        shucaiOrderEntity.setId(id);
        shucaiOrderEntity.setShucaiOrderTypes(3);
        shucaiOrderEntity.setShucaiOrderCourierNumber(shucaiOrderCourierNumber);
        shucaiOrderEntity.setShucaiOrderCourierName(shucaiOrderCourierName);
        boolean b =  shucaiOrderService.updateById( shucaiOrderEntity);
        if(!b){
            return R.error("发货出错");
        }
        return R.ok();
    }














    /**
     * 收货
     */
    @RequestMapping("/receiving")
    public R receiving(Integer id){
        logger.debug("refund:,,Controller:{},,ids:{}",this.getClass().getName(),id.toString());
        ShucaiOrderEntity  shucaiOrderEntity = new  ShucaiOrderEntity();
        shucaiOrderEntity.setId(id);
        shucaiOrderEntity.setShucaiOrderTypes(4);
        boolean b =  shucaiOrderService.updateById( shucaiOrderEntity);
        if(!b){
            return R.error("收货出错");
        }
        return R.ok();
    }



    /**
    * 评价
    */
    @RequestMapping("/commentback")
    public R commentback(Integer id, String commentbackText, Integer shucaiCommentbackPingfenNumber, HttpServletRequest request){
        logger.debug("commentback方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
            ShucaiOrderEntity shucaiOrder = shucaiOrderService.selectById(id);
        if(shucaiOrder == null)
            return R.error(511,"查不到该订单");
        if(shucaiOrder.getShucaiOrderTypes() != 4)
            return R.error(511,"您不能评价");
        Integer shucaiId = shucaiOrder.getShucaiId();
        if(shucaiId == null)
            return R.error(511,"查不到该蔬菜");

        ShucaiCommentbackEntity shucaiCommentbackEntity = new ShucaiCommentbackEntity();
            shucaiCommentbackEntity.setId(id);
            shucaiCommentbackEntity.setShucaiId(shucaiId);
            shucaiCommentbackEntity.setYonghuId((Integer) request.getSession().getAttribute("userId"));
            shucaiCommentbackEntity.setShucaiCommentbackText(commentbackText);
            shucaiCommentbackEntity.setInsertTime(new Date());
            shucaiCommentbackEntity.setReplyText(null);
            shucaiCommentbackEntity.setUpdateTime(null);
            shucaiCommentbackEntity.setCreateTime(new Date());
            shucaiCommentbackService.insert(shucaiCommentbackEntity);

            shucaiOrder.setShucaiOrderTypes(5);//设置订单状态为已评价
            shucaiOrderService.updateById(shucaiOrder);//根据id更新
            return R.ok();
    }












}
