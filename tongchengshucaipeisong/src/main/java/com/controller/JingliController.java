
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
 * 经理
 * 后端接口
 * @author
 * @email
*/
@RestController
@Controller
@RequestMapping("/jingli")
public class JingliController {
    private static final Logger logger = LoggerFactory.getLogger(JingliController.class);

    @Autowired
    private JingliService jingliService;


    @Autowired
    private TokenService tokenService;
    @Autowired
    private DictionaryService dictionaryService;

    //级联表service

    @Autowired
    private YonghuService yonghuService;
    @Autowired
    private YuangongService yuangongService;


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
        PageUtils page = jingliService.queryPage(params);

        //字典表数据转换
        List<JingliView> list =(List<JingliView>)page.getList();
        for(JingliView c:list){
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
        JingliEntity jingli = jingliService.selectById(id);
        if(jingli !=null){
            //entity转view
            JingliView view = new JingliView();
            BeanUtils.copyProperties( jingli , view );//把实体数据重构到view中

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
    public R save(@RequestBody JingliEntity jingli, HttpServletRequest request){
        logger.debug("save方法:,,Controller:{},,jingli:{}",this.getClass().getName(),jingli.toString());

        String role = String.valueOf(request.getSession().getAttribute("role"));
        if(false)
            return R.error(511,"永远不会进入");

        Wrapper<JingliEntity> queryWrapper = new EntityWrapper<JingliEntity>()
            .eq("username", jingli.getUsername())
            .or()
            .eq("jingli_phone", jingli.getJingliPhone())
            .or()
            .eq("jingli_id_number", jingli.getJingliIdNumber())
            ;

        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        JingliEntity jingliEntity = jingliService.selectOne(queryWrapper);
        if(jingliEntity==null){
            jingli.setCreateTime(new Date());
            jingli.setPassword("123456");
            jingliService.insert(jingli);
            return R.ok();
        }else {
            return R.error(511,"账户或者经理手机号或者经理身份证号已经被使用");
        }
    }

    /**
    * 后端修改
    */
    @RequestMapping("/update")
    public R update(@RequestBody JingliEntity jingli, HttpServletRequest request){
        logger.debug("update方法:,,Controller:{},,jingli:{}",this.getClass().getName(),jingli.toString());

        String role = String.valueOf(request.getSession().getAttribute("role"));
//        if(false)
//            return R.error(511,"永远不会进入");
        //根据字段查询是否有相同数据
        Wrapper<JingliEntity> queryWrapper = new EntityWrapper<JingliEntity>()
            .notIn("id",jingli.getId())
            .andNew()
            .eq("username", jingli.getUsername())
            .or()
            .eq("jingli_phone", jingli.getJingliPhone())
            .or()
            .eq("jingli_id_number", jingli.getJingliIdNumber())
            ;

        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        JingliEntity jingliEntity = jingliService.selectOne(queryWrapper);
        if("".equals(jingli.getJingliPhoto()) || "null".equals(jingli.getJingliPhoto())){
                jingli.setJingliPhoto(null);
        }
        if(jingliEntity==null){
            jingliService.updateById(jingli);//根据id更新
            return R.ok();
        }else {
            return R.error(511,"账户或者经理手机号或者经理身份证号已经被使用");
        }
    }



    /**
    * 删除
    */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids){
        logger.debug("delete:,,Controller:{},,ids:{}",this.getClass().getName(),ids.toString());
        jingliService.deleteBatchIds(Arrays.asList(ids));
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
            List<JingliEntity> jingliList = new ArrayList<>();//上传的东西
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
                            JingliEntity jingliEntity = new JingliEntity();
//                            jingliEntity.setUsername(data.get(0));                    //账户 要改的
//                            //jingliEntity.setPassword("123456");//密码
//                            jingliEntity.setJingliUuidNumber(data.get(0));                    //经理编号 要改的
//                            jingliEntity.setJingliName(data.get(0));                    //经理姓名 要改的
//                            jingliEntity.setJingliPhone(data.get(0));                    //经理手机号 要改的
//                            jingliEntity.setJingliIdNumber(data.get(0));                    //经理身份证号 要改的
//                            jingliEntity.setJingliPhoto("");//详情和图片
//                            jingliEntity.setSexTypes(Integer.valueOf(data.get(0)));   //性别 要改的
//                            jingliEntity.setJingliEmail(data.get(0));                    //电子邮箱 要改的
//                            jingliEntity.setCreateTime(date);//时间
                            jingliList.add(jingliEntity);


                            //把要查询是否重复的字段放入map中
                                //账户
                                if(seachFields.containsKey("username")){
                                    List<String> username = seachFields.get("username");
                                    username.add(data.get(0));//要改的
                                }else{
                                    List<String> username = new ArrayList<>();
                                    username.add(data.get(0));//要改的
                                    seachFields.put("username",username);
                                }
                                //经理编号
                                if(seachFields.containsKey("jingliUuidNumber")){
                                    List<String> jingliUuidNumber = seachFields.get("jingliUuidNumber");
                                    jingliUuidNumber.add(data.get(0));//要改的
                                }else{
                                    List<String> jingliUuidNumber = new ArrayList<>();
                                    jingliUuidNumber.add(data.get(0));//要改的
                                    seachFields.put("jingliUuidNumber",jingliUuidNumber);
                                }
                                //经理手机号
                                if(seachFields.containsKey("jingliPhone")){
                                    List<String> jingliPhone = seachFields.get("jingliPhone");
                                    jingliPhone.add(data.get(0));//要改的
                                }else{
                                    List<String> jingliPhone = new ArrayList<>();
                                    jingliPhone.add(data.get(0));//要改的
                                    seachFields.put("jingliPhone",jingliPhone);
                                }
                                //经理身份证号
                                if(seachFields.containsKey("jingliIdNumber")){
                                    List<String> jingliIdNumber = seachFields.get("jingliIdNumber");
                                    jingliIdNumber.add(data.get(0));//要改的
                                }else{
                                    List<String> jingliIdNumber = new ArrayList<>();
                                    jingliIdNumber.add(data.get(0));//要改的
                                    seachFields.put("jingliIdNumber",jingliIdNumber);
                                }
                        }

                        //查询是否重复
                         //账户
                        List<JingliEntity> jingliEntities_username = jingliService.selectList(new EntityWrapper<JingliEntity>().in("username", seachFields.get("username")));
                        if(jingliEntities_username.size() >0 ){
                            ArrayList<String> repeatFields = new ArrayList<>();
                            for(JingliEntity s:jingliEntities_username){
                                repeatFields.add(s.getUsername());
                            }
                            return R.error(511,"数据库的该表中的 [账户] 字段已经存在 存在数据为:"+repeatFields.toString());
                        }
                         //经理编号
                        List<JingliEntity> jingliEntities_jingliUuidNumber = jingliService.selectList(new EntityWrapper<JingliEntity>().in("jingli_uuid_number", seachFields.get("jingliUuidNumber")));
                        if(jingliEntities_jingliUuidNumber.size() >0 ){
                            ArrayList<String> repeatFields = new ArrayList<>();
                            for(JingliEntity s:jingliEntities_jingliUuidNumber){
                                repeatFields.add(s.getJingliUuidNumber());
                            }
                            return R.error(511,"数据库的该表中的 [经理编号] 字段已经存在 存在数据为:"+repeatFields.toString());
                        }
                         //经理手机号
                        List<JingliEntity> jingliEntities_jingliPhone = jingliService.selectList(new EntityWrapper<JingliEntity>().in("jingli_phone", seachFields.get("jingliPhone")));
                        if(jingliEntities_jingliPhone.size() >0 ){
                            ArrayList<String> repeatFields = new ArrayList<>();
                            for(JingliEntity s:jingliEntities_jingliPhone){
                                repeatFields.add(s.getJingliPhone());
                            }
                            return R.error(511,"数据库的该表中的 [经理手机号] 字段已经存在 存在数据为:"+repeatFields.toString());
                        }
                         //经理身份证号
                        List<JingliEntity> jingliEntities_jingliIdNumber = jingliService.selectList(new EntityWrapper<JingliEntity>().in("jingli_id_number", seachFields.get("jingliIdNumber")));
                        if(jingliEntities_jingliIdNumber.size() >0 ){
                            ArrayList<String> repeatFields = new ArrayList<>();
                            for(JingliEntity s:jingliEntities_jingliIdNumber){
                                repeatFields.add(s.getJingliIdNumber());
                            }
                            return R.error(511,"数据库的该表中的 [经理身份证号] 字段已经存在 存在数据为:"+repeatFields.toString());
                        }
                        jingliService.insertBatch(jingliList);
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
    * 登录
    */
    @IgnoreAuth
    @RequestMapping(value = "/login")
    public R login(String username, String password, String captcha, HttpServletRequest request) {
        JingliEntity jingli = jingliService.selectOne(new EntityWrapper<JingliEntity>().eq("username", username));
        if(jingli==null || !jingli.getPassword().equals(password))
            return R.error("账号或密码不正确");
        //  // 获取监听器中的字典表
        // ServletContext servletContext = ContextLoader.getCurrentWebApplicationContext().getServletContext();
        // Map<String, Map<Integer, String>> dictionaryMap= (Map<String, Map<Integer, String>>) servletContext.getAttribute("dictionaryMap");
        // Map<Integer, String> role_types = dictionaryMap.get("role_types");
        // role_types.get(.getRoleTypes());
        String token = tokenService.generateToken(jingli.getId(),username, "jingli", "经理");
        R r = R.ok();
        r.put("token", token);
        r.put("role","经理");
        r.put("username",jingli.getJingliName());
        r.put("tableName","jingli");
        r.put("userId",jingli.getId());
        return r;
    }

    /**
    * 注册
    */
    @IgnoreAuth
    @PostMapping(value = "/register")
    public R register(@RequestBody JingliEntity jingli){
//    	ValidatorUtils.validateEntity(user);
        Wrapper<JingliEntity> queryWrapper = new EntityWrapper<JingliEntity>()
            .eq("username", jingli.getUsername())
            .or()
            .eq("jingli_phone", jingli.getJingliPhone())
            .or()
            .eq("jingli_id_number", jingli.getJingliIdNumber())
            ;
        JingliEntity jingliEntity = jingliService.selectOne(queryWrapper);
        if(jingliEntity != null)
            return R.error("账户或者经理手机号或者经理身份证号已经被使用");
        jingli.setCreateTime(new Date());
        jingliService.insert(jingli);
        return R.ok();
    }

    /**
     * 重置密码
     */
    @GetMapping(value = "/resetPassword")
    public R resetPassword(Integer  id){
        JingliEntity jingli = new JingliEntity();
        jingli.setPassword("123456");
        jingli.setId(id);
        jingliService.updateById(jingli);
        return R.ok();
    }


    /**
     * 忘记密码
     */
    @IgnoreAuth
    @RequestMapping(value = "/resetPass")
    public R resetPass(String username, HttpServletRequest request) {
        JingliEntity jingli = jingliService.selectOne(new EntityWrapper<JingliEntity>().eq("username", username));
        if(jingli!=null){
            jingli.setPassword("123456");
            boolean b = jingliService.updateById(jingli);
            if(!b){
               return R.error();
            }
        }else{
           return R.error("账号不存在");
        }
        return R.ok();
    }


    /**
    * 获取用户的session用户信息
    */
    @RequestMapping("/session")
    public R getCurrJingli(HttpServletRequest request){
        Integer id = (Integer)request.getSession().getAttribute("userId");
        JingliEntity jingli = jingliService.selectById(id);
        if(jingli !=null){
            //entity转view
            JingliView view = new JingliView();
            BeanUtils.copyProperties( jingli , view );//把实体数据重构到view中

            //修改对应字典表字段
            dictionaryService.dictionaryConvert(view, request);
            return R.ok().put("data", view);
        }else {
            return R.error(511,"查不到数据");
        }
    }


    /**
    * 退出
    */
    @GetMapping(value = "logout")
    public R logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return R.ok("退出成功");
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
        PageUtils page = jingliService.queryPage(params);

        //字典表数据转换
        List<JingliView> list =(List<JingliView>)page.getList();
        for(JingliView c:list)
            dictionaryService.dictionaryConvert(c, request); //修改对应字典表字段
        return R.ok().put("data", page);
    }

    /**
    * 前端详情
    */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id, HttpServletRequest request){
        logger.debug("detail方法:,,Controller:{},,id:{}",this.getClass().getName(),id);
        JingliEntity jingli = jingliService.selectById(id);
            if(jingli !=null){


                //entity转view
                JingliView view = new JingliView();
                BeanUtils.copyProperties( jingli , view );//把实体数据重构到view中

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
    public R add(@RequestBody JingliEntity jingli, HttpServletRequest request){
        logger.debug("add方法:,,Controller:{},,jingli:{}",this.getClass().getName(),jingli.toString());
        Wrapper<JingliEntity> queryWrapper = new EntityWrapper<JingliEntity>()
            .eq("username", jingli.getUsername())
            .or()
            .eq("jingli_phone", jingli.getJingliPhone())
            .or()
            .eq("jingli_id_number", jingli.getJingliIdNumber())
            ;
        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        JingliEntity jingliEntity = jingliService.selectOne(queryWrapper);
        if(jingliEntity==null){
            jingli.setCreateTime(new Date());
        jingli.setPassword("123456");
        jingliService.insert(jingli);
            return R.ok();
        }else {
            return R.error(511,"账户或者经理手机号或者经理身份证号已经被使用");
        }
    }


}
