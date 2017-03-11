package ${pojoPackage};

import com.xunkai.athena.common.base.AbstractBaseController;
import com.xunkai.athena.common.base.Pagin;
import com.xunkai.athena.beauty.biz.${className_Java}Manager;
import com.xunkai.athena.beauty.dal.model.${className_Java};
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import com.xunkai.athena.common.util.StringUtils;
/**
 * ${tableComment} Controller
 * 
 * @Author ${author}
 * @Date ${createDate}
 */
@Controller
public class ${className_Java}Controller extends AbstractBaseController {
    @Autowired
    private ${className_Java}Manager ${className}Manager;

    @RequestMapping(value = "/admin/${className}List")
    public String ${className}List(Model model){
        Pagin<${className_Java}> pagin = getPagin();
        ${className}Manager.findByPagin(pagin);
        model.addAttribute("pagin", pagin);
        return "/WEB-INF/views/${className_x}/${className}List";
    }

    @RequestMapping(value = "/admin/set${className_Java}")
    public String set${className_Java}(Model model,@ModelAttribute ${className_Java} obj) {
        if (!isTokenValid()) {
            return tokenInvalidPage(model);
        }

        ${className}Manager.save(obj);
        return "redirect:/admin/${className}List.htm";
    }

    @RequestMapping(value = "/admin/toSet${className_Java}")
    public String toSet${className_Java}(Model model,@RequestParam(required=false) Integer id) {
        if (null!=id) {
            model.addAttribute("model", ${className}Manager.findById(id));
        }
        return "/WEB-INF/views/${className_x}/set${className_Java}";
    }

    @RequestMapping(value = "/admin/delete${className_Java}")
    public String delete${className_Java}(@RequestParam String id) {
        ${className}Manager.deleteByIds(StringUtils.substringBeforeLast(id, ",").split(","));
        return "redirect:/admin/${className}List.htm";
    }
}